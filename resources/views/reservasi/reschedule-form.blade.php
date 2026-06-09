@extends('layouts.app')

@section('title', 'Reschedule Booking - Pineus Tilu')

@section('mainClass', 'pt-24 w-full max-w-screen-xl mx-auto px-6 pb-16')

@push('preload')
<link rel="preload" href="{{ asset('js/flatpickr.js') }}" as="script">
@endpush

@section('content')
        <x-page-heading title="RESCHEDULE BOOKING" wrapperClass="text-center py-8" />

        <!-- Reschedule container: reuse reservation layout but separate flow -->
        <form method="POST" action="{{ route('reschedule.submit', ['token' => $originalBooking->token_code ?? '']) }}" id="rescheduleForm" autocomplete="off">
            @csrf
            <input type="hidden" id="originalToken" value="{{ $originalBooking->token_code ?? '' }}" />
            <input type="hidden" id="originalTotalValue" value="{{ $originalTotal ?? 0 }}" />
            <input type="hidden" id="originalTotalDisplay" value="{{ $originalTotalDisplay ?? '' }}" />

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 lg:gap-8">
                <!-- LEFT COLUMN: Detail Reservasi (spans 2 columns on large screens) -->
                <div class="lg:col-span-2">
                    @include('partials.reservasi-glamping.detail', ['hideContactFields' => true])
                </div>

                <!-- RIGHT COLUMN: Preview Detail Pesanan (sticky on desktop) -->
                <div class="lg:col-span-1">
                    <div class="lg:sticky lg:top-28">
                        @include('partials.reservasi-glamping.preview-detail', ['rescheduleMode' => true])
                    </div>
                </div>
            </div>
        </form>

        @include('partials.modals.modal-info')
        @include('partials.modals.modal-amenities', ['formId' => 'rescheduleForm'])

@push('styles')
<link rel="stylesheet" href="{{ asset('css/flatpickr.min.css') }}">
@endpush

@push('scripts')
<script src="{{ asset('js/flatpickr.js') }}" defer></script>
@vite(['resources/js/pages/reservasi-glamping.js'])

<script>
document.addEventListener('DOMContentLoaded', function(){
    const token = document.getElementById('originalToken')?.value;
    const originalTotalValue = Number(document.getElementById('originalTotalValue')?.value || 0);
    const originalDisplay = document.getElementById('originalTotalDisplay')?.value || '';

    // Helper functions
    function formatToRupiah(num){
        try{
            return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR', maximumFractionDigits: 0 }).format(num);
        }catch(e){
            return 'Rp ' + (num || 0).toLocaleString('id-ID');
        }
    }

    // Call API to estimate reschedule pricing
    async function estimateReschedulePricing() {
        const checkin = document.getElementById('checkin')?.value;
        const checkout = document.getElementById('checkout')?.value;
        const unitId = document.getElementById('selected_unit')?.value;

        if (!checkin || !checkout || !unitId || !token) {
            return;
        }

        try {
            const response = await fetch(`/api/reschedule/${token}/estimate`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.content || '',
                },
                body: JSON.stringify({
                    checkin: checkin,
                    checkout: checkout,
                    unit_id: parseInt(unitId),
                }),
            });

            if (!response.ok) {
                console.error('API error:', response.status);
                return;
            }

            const data = await response.json();

            if (data.success) {
                updateReschedulePreview(data);
            }
        } catch (error) {
            console.error('Estimation error:', error);
        }
    }

    // Update preview with breakdown
    function updateReschedulePreview(data) {
        const breakdown = data.breakdown;

        // Update main price with the payable amount (difference)
        document.getElementById('previewPrice').textContent = formatToRupiah(breakdown.payable_amount);

        // Update breakdown elements for reschedule
        const originalPriceEl = document.getElementById('previewOriginalPrice');
        const newPriceEl = document.getElementById('previewNewPrice');
        const differencePriceEl = document.getElementById('previewPriceDifference');

        if (originalPriceEl) {
            originalPriceEl.textContent = formatToRupiah(breakdown.original_price);
        }

        if (newPriceEl) {
            newPriceEl.textContent = formatToRupiah(breakdown.new_price);
        }

        if (differencePriceEl) {
            differencePriceEl.textContent = formatToRupiah(breakdown.price_difference);

            // Color code the difference
            if (breakdown.price_difference > 0) {
                // Positive difference - need to pay more (red/orange)
                differencePriceEl.className = 'font-semibold text-red-600';
            } else if (breakdown.price_difference < 0) {
                // Negative difference - getting refund (green)
                differencePriceEl.className = 'font-semibold text-green-600';
            } else {
                // No difference (gray)
                differencePriceEl.className = 'font-semibold text-gray-800';
            }
        }

        // Update main preview price color based on whether payment is needed
        const previewPriceEl = document.getElementById('previewPrice');
        if (previewPriceEl) {
            if (breakdown.payable_amount > 0) {
                // Payment needed
                previewPriceEl.className = 'text-2xl font-extrabold text-red-600';
            } else {
                // No payment needed
                previewPriceEl.className = 'text-2xl font-extrabold text-green-600';
            }
        }
    }

    // Listen to date/unit changes
    const checkinInput = document.getElementById('checkin');
    const checkoutInput = document.getElementById('checkout');
    const unitSelect = document.getElementById('selected_unit');

    if (checkinInput) checkinInput.addEventListener('change', estimateReschedulePricing);
    if (checkoutInput) checkoutInput.addEventListener('change', estimateReschedulePricing);
    if (unitSelect) unitSelect.addEventListener('change', estimateReschedulePricing);

    // Initial estimate on load
    setTimeout(estimateReschedulePricing, 500);
});
</script>

@endpush
@endsection
