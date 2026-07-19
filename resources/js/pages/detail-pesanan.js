/**
 * Detail Pesanan (Order Details) Page JavaScript
 * Handles booking status updates and payment flow
 * Integrated with Midtrans Snap payment gateway
 */

import { onReady, qs } from '../utils/dom.js';

class DetailPesanan {
    updateUrl = null;
    csrfToken = null;
    bookingToken = null;
    snapLoaded = false;


    init() {
        this.updateUrl = document.body.dataset.updateStatusUrl;
        this.csrfToken = qs('meta[name="csrf-token"]')?.content;
        this.bookingToken = document.body.dataset.bookingToken;

        if (!this.updateUrl || !this.csrfToken) {
            return;
        }

        this.bindEvents();
    }

    bindEvents() {
        const proceedBtn = qs('[data-action="proceed-to-payment"]');
        if (proceedBtn) {
            proceedBtn.addEventListener('click', () => this.proceedToPayment());
        }

        const payBtn = qs('[data-action="complete-payment"]');
        if (payBtn) {
            payBtn.addEventListener('click', () => this.completePayment());
        }

        const copyBtn = qs('#copyCodeBtn');
        if (copyBtn) {
            copyBtn.addEventListener('click', () => this.copyBookingCode());
        }
    }

    copyBookingCode() {
        const codeEl = qs('#bookingCode');
        if (!codeEl) return;

        const code = codeEl.textContent.trim();

        navigator.clipboard.writeText(code).then(() => {

            const copyBtn = qs('#copyCodeBtn');
            const originalHtml = copyBtn.innerHTML;
            copyBtn.innerHTML = `
                <svg class="w-5 h-5 text-green-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                </svg>
            `;

            setTimeout(() => {
                copyBtn.innerHTML = originalHtml;
            }, 2000);
        }).catch(err => {

            const textArea = document.createElement('textarea');
            textArea.value = code;
            textArea.style.position = 'fixed';
            textArea.style.left = '-9999px';
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand('copy');
            document.body.removeChild(textArea);
            alert('Kode berhasil disalin: ' + code);
        });
    }

    /**
     * Submit a form to update booking status
     * @param {string} newStatus - The new status to set
     */
    updateBookingStatus(newStatus) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = this.updateUrl;

        const csrfInput = document.createElement('input');
        csrfInput.type = 'hidden';
        csrfInput.name = '_token';
        csrfInput.value = this.csrfToken;
        form.appendChild(csrfInput);

        const statusInput = document.createElement('input');
        statusInput.type = 'hidden';
        statusInput.name = 'status';
        statusInput.value = newStatus;
        form.appendChild(statusInput);

        document.body.appendChild(form);
        form.submit();
    }

    /**
     * Proceed to payment step or directly confirm if no additional payment required.
     * For reschedule bookings where price delta <= 0, skip payment and go straight to confirmed.
     */
    proceedToPayment() {
        const btn = qs('#continueOrderBtn') ?? qs('[data-action="proceed-to-payment"]');
        const reschedulePaymentStatus = btn?.dataset?.reschedulePaymentStatus ?? '';

        // If this is a reschedule with no extra payment required, skip payment and confirm directly
        if (reschedulePaymentStatus === 'no_payment_required' || reschedulePaymentStatus === 'refund_due') {
            this.updateBookingStatus('berhasil');
            return;
        }

        // Otherwise proceed to payment stage as normal
        this.updateBookingStatus('pembayaran');
    }

    completePayment() {
        const modal = qs('#snapPaymentModal');
        if (!modal) return;

        // Show modal (loading spinner) briefly before Midtrans popup appears
        modal.classList.remove('hidden');

<<<<<<< Updated upstream
        // Selalu fetch token dari backend.
        // Backend akan me-return token yang sudah di-cache di DB (tidak hit Midtrans API lagi)
        // sehingga aman dipanggil berulang kali.
=======
        // Hide floating WhatsApp button so it doesn't block clicks
        const floatingWA = document.getElementById('floatingWhatsApp');
        if (floatingWA) {
            floatingWA.style.opacity = '0';
            floatingWA.style.pointerEvents = 'none';
        }

        // Fetch token from backend and trigger payment
>>>>>>> Stashed changes
        this.fetchSnapToken();
    }

    /**
     * Fetch Snap token from backend API
     */
    async fetchSnapToken() {
        try {
            if (!this.bookingToken) {
                this.showSnapError('Booking token not found');
                return;
            }

            const response = await fetch(`/api/payment/snap-token/${this.bookingToken}`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                }
            });

            // Handle non-JSON responses gracefully
            const contentType = response.headers.get('content-type') ?? '';
            if (!contentType.includes('application/json')) {
                this.showSnapError('Failed to load payment gateway. Please try again.');
                return;
            }

            const data = await response.json();

            if (!response.ok || !data.success) {
                this.showSnapError(data.message || 'Failed to generate payment token');
                return;
            }

            // Initialize Snap with token
            this.initializeSnap(data.token, data.client_key, data.snap_js_url);

        } catch (error) {
            console.error('Error fetching snap token:', error);
            this.showSnapError('Failed to load payment gateway. Please try again.');
        }
    }

    /**
     * Initialize and display Midtrans Snap payment
     */
    initializeSnap(snapToken, clientKey, snapJsUrl) {
        // Load Snap JS library if not already loaded
        if (!window.snap) {
            const script = document.createElement('script');
            script.src = snapJsUrl;
            script.setAttribute('data-client-key', clientKey);
            script.onload = () => {
                this.displaySnapPayment(snapToken);
            };
            script.onerror = () => {
                this.showSnapError('Failed to load payment gateway. Please check your connection.');
            };
            document.head.appendChild(script);
        } else {
            this.displaySnapPayment(snapToken);
        }
    }

    /**
     * Display Snap payment popup natively
     */
    displaySnapPayment(snapToken) {
        // Hide our custom modal entirely and use Midtrans' native popup which works perfectly on mobile
        const modal = qs('#snapPaymentModal');
        if (modal) {
            modal.classList.add('hidden');
        }

        window.snap.pay(snapToken, {
            onSuccess: (result) => this.onPaymentSuccess(result),
            onPending: (result) => this.onPaymentPending(result),
            onError: (result) => this.onPaymentError(result),
            onClose: () => this.onPaymentClose(),
        });

        this.snapLoaded = true;
    }
    /**
     * Handle successful payment
     */
    onPaymentSuccess(result) {
        console.log('Payment successful:', result);

        // Close modal
        this.closeSnapModal();

        // Show success message
        alert('Payment successful! Your booking has been confirmed.');

        // Update booking status to berhasil
        this.updateBookingStatus('berhasil');
    }

    /**
     * Handle pending payment
     */
    onPaymentPending(result) {
        console.log('Payment pending:', result);
        alert('Payment is being processed. Please wait...');
    }

    /**
     * Handle payment error
     */
    onPaymentError(result) {
        console.error('Payment error:', result);
        this.showSnapError('Payment failed. ' + (result?.status_message || 'Please try again.'));
    }

    /**
     * Handle payment close (user menutup popup Snap tanpa menyelesaikan)
     */
    onPaymentClose() {
        console.log('Payment modal closed by user');
        
        // Restore floating WhatsApp button visibility
        const floatingWA = document.getElementById('floatingWhatsApp');
        if (floatingWA) {
            floatingWA.style.opacity = '';
            floatingWA.style.pointerEvents = '';
        }
        
        // Do not reset state so the user can continue payment if they reopen it
    }

    closeSnapModal() {
        const modal = qs('#snapPaymentModal');
        if (modal) {
            modal.classList.add('hidden');
        }
<<<<<<< Updated upstream
        // Reset semua state modal agar fresh saat dibuka kembali
        this.resetSnapModal();
=======

        // Restore floating WhatsApp button visibility
        const floatingWA = document.getElementById('floatingWhatsApp');
        if (floatingWA) {
            floatingWA.style.opacity = '';
            floatingWA.style.pointerEvents = '';
        }
>>>>>>> Stashed changes
    }

    /**
     * Reset semua UI state modal ke kondisi awal (loading).
     */
    resetSnapModal() {
        const loadingEl = qs('#snapLoading');
        const errorEl = qs('#snapError');
        const errorMessageEl = qs('#snapErrorMessage');

        if (loadingEl) loadingEl.style.display = '';
        if (errorEl) errorEl.classList.add('hidden');
        if (errorMessageEl) errorMessageEl.textContent = '';
    }

    /**
     * Show error in Snap modal
     */
    showSnapError(message) {
        const loadingEl = qs('#snapLoading');
        const containerEl = qs('#snap-container');
        const errorEl = qs('#snapError');
        const errorMessageEl = qs('#snapErrorMessage');

        if (loadingEl) loadingEl.style.display = 'none';
        if (containerEl) containerEl.style.display = 'none';

        if (errorEl && errorMessageEl) {
            errorMessageEl.textContent = message;
            errorEl.classList.remove('hidden');
        }
    }
}

// Initialize on DOM ready
onReady(() => {
    const detailPesanan = new DetailPesanan();
    detailPesanan.init();

    // Expose functions globally for backward compatibility
    globalThis.proceedToPayment = () => detailPesanan.proceedToPayment();
    globalThis.completePayment = () => detailPesanan.completePayment();
    globalThis.closeSnapModal = () => detailPesanan.closeSnapModal();
});

