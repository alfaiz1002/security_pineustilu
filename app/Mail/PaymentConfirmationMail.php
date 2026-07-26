<?php

namespace App\Mail;

use App\Models\Payment;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class PaymentConfirmationMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
    public function __construct(public Payment $payment)
    {
        //
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Pembayaran Berhasil #' . $this->payment->order_id . ' — PineusTilu',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        $booking = $this->payment->booking;

        return new Content(
            view: 'emails.payment-confirmation',
            with: [
                'payment'     => $this->payment,
                'booking'     => $booking,
                'user'        => $booking?->user,
                'guestName'   => $booking?->guest_name ?? $booking?->user?->name,
                'orderId'     => $this->payment->order_id,
                'grossAmount' => number_format((float) $this->payment->gross_amount, 0, ',', '.'),
                'paymentType' => $this->payment->payment_type,
                'paidAt'      => $this->payment->updated_at?->translatedFormat('l, d F Y H:i'),
                'tokenCode'   => $booking?->token_code,
            ],
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
