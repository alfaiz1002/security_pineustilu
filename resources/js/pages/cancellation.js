/**
 * Cancellation Page JavaScript
 * Handles form validation and submission for both code and email
 */

import { onReady } from '../utils/dom.js';
import { sanitize, isValidRedeemCode } from '../utils/helpers.js';

class Cancellation {
    constructor() {
        this.form = null;
        this.codeInput = null;
        this.emailInput = null;
        this.button = null;
        this.msg = null;
    }

    init() {
        this.form = document.querySelector('form[action*="cancellation"]');
        this.codeInput = document.getElementById('cancel-redeem');
        this.emailInput = document.getElementById('cancellation-email');

        if (!this.form || !this.codeInput || !this.emailInput) return;

        this.button = this.form.querySelector('button[type="submit"]');
        this.createMessageElement();
        this.bindEvents();
    }

    createMessageElement() {
        this.msg = document.createElement('p');
        this.msg.className = 'mt-3 text-sm';
        this.form.after(this.msg);
    }

    bindEvents() {
        this.codeInput.addEventListener('input', () => {
            this.codeInput.value = sanitize(this.codeInput.value);
            this.clearError();
        });

        this.emailInput.addEventListener('input', () => {
            this.clearError();
        });

        this.form.addEventListener('submit', (e) => this.handleSubmit(e));
    }

    clearError() {
        this.codeInput.classList.remove('border-red-500', 'ring-red-500');
        this.emailInput.classList.remove('border-red-500', 'ring-red-500');
        this.msg.textContent = '';
        this.msg.classList.remove('text-red-600', 'text-green-600');
    }

    showError(message) {
        this.msg.textContent = message;
        this.msg.classList.add('text-red-600');
        this.codeInput.classList.add('border-red-500', 'ring-red-500');
        this.emailInput.classList.add('border-red-500', 'ring-red-500');
    }

    isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    setLoading(loading) {
        if (loading) {
            this.button.dataset.originalText = this.button.textContent;
            this.button.textContent = 'Processing...';
            this.button.disabled = true;
            this.button.classList.add('opacity-60', 'cursor-not-allowed');
        } else {
            this.button.textContent = this.button.dataset.originalText || 'Submit';
            this.button.disabled = false;
            this.button.classList.remove('opacity-60', 'cursor-not-allowed');
        }
    }

    handleSubmit(e) {
        e.preventDefault();
        const code = sanitize(this.codeInput.value);
        const email = this.emailInput.value.trim();

        if (!code) {
            this.showError('Silakan masukkan kode booking Anda.');
            return;
        }

        if (!isValidRedeemCode(code)) {
            this.showError('Kode booking tidak valid. Gunakan 6–32 karakter alfanumerik dan tanda hubung (-).');
            return;
        }

        if (!email) {
            this.showError('Silakan masukkan email Anda.');
            return;
        }

        if (!this.isValidEmail(email)) {
            this.showError('Format email tidak valid. Silakan masukkan email yang benar.');
            return;
        }

        this.setLoading(true);

        // Redirect with query parameters
        const url = new URL(this.form.action, window.location.origin);
        url.searchParams.set('code', code);
        url.searchParams.set('email', email);
        window.location.href = url.toString();

        // Safety re-enable if redirect is blocked
        setTimeout(() => this.setLoading(false), 5000);
    }
}

// Initialize on DOM ready
onReady(() => {
    const cancellation = new Cancellation();
    cancellation.init();
});

export default Cancellation;
