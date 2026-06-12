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
            <input type="hidden" id="rescheduleFee" value="{{ $rescheduleFee ?? 0 }}" />

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


@endpush
@endsection
