<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pembayaran Berhasil — Pineus Tilu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body, table, td, a { font-family: 'Poppins', 'Segoe UI', Arial, sans-serif; }
        body { background-color: #f6fbf8; margin: 0; padding: 0; color: #1a2e1a; -webkit-text-size-adjust: 100%; }
        table { border-collapse: collapse !important; }
        .wrapper { width: 100%; background-color: #f6fbf8; padding: 30px 10px; }
        .container { max-width: 600px; width: 100%; background: #ffffff; border: 1px solid #ddeee6; border-radius: 12px; overflow: hidden; margin: 0 auto; }
        
        .header { background-color: #017249; padding: 30px; }
        .hero { background-color: #f6fbf8; border-bottom: 1px solid #ddeee6; padding: 30px; text-align: center; }
        .body-content { padding: 30px; }
        .footer { background-color: #f6fbf8; border-top: 1px solid #ddeee6; padding: 30px; }
        
        .btn { display: inline-block; background-color: #017249; color: #ffffff; text-decoration: none; font-size: 14px; font-weight: 600; padding: 14px 32px; border-radius: 8px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;" class="container">
            <!-- HEADER -->
            <tr>
                <td class="header" bgcolor="#017249" style="padding: 30px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center">
                                @if(isset($message))
                                    <img src="{{ $message->embed(public_path('images/dashboard/logo_email.png')) }}" alt="Pineus Tilu" width="150" border="0" style="display: block; max-width: 150px;">
                                @else
                                    <img src="{{ asset('images/dashboard/logo_email.png') }}" alt="Pineus Tilu" width="150" border="0" style="display: block; max-width: 150px;">
                                @endif
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <!-- HERO -->
            <tr>
                <td class="hero" bgcolor="#f6fbf8" align="center" style="padding: 30px; text-align: center; border-bottom: 1px solid #ddeee6;">
                    <div style="font-size: 40px; margin-bottom: 10px;">✅</div>
                    <h1 style="font-size: 20px; font-weight: 700; color: #0b5a3e; margin: 0 0 8px 0;">Pembayaran Berhasil!</h1>
                    <p style="font-size: 13px; color: #5a7a6a; margin: 0; line-height: 1.6;">Reservasi Anda telah dikonfirmasi.<br>Sampai jumpa di Pineus Tilu!</p>
                </td>
            </tr>

            <!-- BODY -->
            <tr>
                <td class="body-content" bgcolor="#ffffff" style="padding: 30px;">
                    <p style="font-size: 14px; color: #1a2e1a; margin: 0 0 10px 0;">Halo, <strong style="color: #017249;">{{ $guestName }}</strong>!</p>
                    <p style="font-size: 13px; color: #5a7a6a; line-height: 1.7; margin: 0 0 25px 0;">
                        Pembayaran Anda telah berhasil kami terima dan reservasi Anda sudah <strong style="color:#017249;">dikonfirmasi</strong>. Simpan email ini sebagai bukti pembayaran Anda.
                    </p>

                    <!-- AMOUNT BLOCK -->
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 25px;">
                        <tr>
                            <td align="center" bgcolor="#0b5a3e" style="padding: 25px; border-radius: 12px;">
                                <div style="font-size: 11px; font-weight: 600; letter-spacing: 2px; text-transform: uppercase; color: #a3f0cb; margin-bottom: 10px;">Total Pembayaran</div>
                                <div style="font-size: 32px; font-weight: 700; color: #ffffff; letter-spacing: 1px;">
                                    <span style="font-size: 18px; font-weight: 500; color: #a3f0cb; margin-right: 4px;">Rp</span>{{ $grossAmount }}
                                </div>
                            </td>
                        </tr>
                    </table>

                    <!-- SUCCESS BANNER -->
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid #6ee7b7; border-radius: 12px; overflow: hidden; margin-bottom: 25px;">
                        <tr>
                            <td bgcolor="#ecfdf5" style="padding: 15px; font-size: 13px; font-weight: 600; color: #065f46; text-align: center;">
                                🎉 Selamat! Slot camping Anda sudah dikonfirmasi.
                            </td>
                        </tr>
                    </table>

                    <!-- PAYMENT DETAILS CARD -->
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid #ddeee6; border-radius: 12px; overflow: hidden; margin-bottom: 25px;">
                        <tr>
                            <td bgcolor="#f6fbf8" style="padding: 12px 20px; font-size: 11px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; color: #017249; border-bottom: 1px solid #ddeee6;">
                                Detail Pembayaran
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="padding: 0;">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; color: #7a9a8a;" width="40%">Order ID</td>
                                        <td align="right" style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; font-weight: 600; color: #1a2e1a;" width="60%">{{ $orderId }}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; color: #7a9a8a;">Metode Pembayaran</td>
                                        <td align="right" style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; font-weight: 600; color: #1a2e1a;">{{ strtoupper(str_replace('_', ' ', $paymentType)) }}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; color: #7a9a8a;">Waktu Pembayaran</td>
                                        <td align="right" style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; font-weight: 600; color: #1a2e1a;">{{ $paidAt }}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px 20px; font-size: 13px; color: #7a9a8a;">Status</td>
                                        <td align="right" style="padding: 15px 20px; font-size: 13px; font-weight: 600; color: #059669;">Lunas</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <!-- BOOKING DETAILS CARD -->
                    @if($booking)
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid #ddeee6; border-radius: 12px; overflow: hidden; margin-bottom: 25px;">
                        <tr>
                            <td bgcolor="#f6fbf8" style="padding: 12px 20px; font-size: 11px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; color: #017249; border-bottom: 1px solid #ddeee6;">
                                Detail Reservasi
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" style="padding: 0;">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; color: #7a9a8a;" width="40%">Kode Token</td>
                                        <td align="right" style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 15px; font-weight: 700; font-family: 'Courier New', Courier, monospace; letter-spacing: 3px; color: #017249;" width="60%">{{ $tokenCode }}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; color: #7a9a8a;">Tanggal Camping</td>
                                        <td align="right" style="padding: 15px 20px; border-bottom: 1px solid #f0f7f3; font-size: 13px; font-weight: 600; color: #1a2e1a;">{{ $booking->booking_date?->translatedFormat('l, d F Y') }}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px 20px; font-size: 13px; color: #7a9a8a;">Tipe Reservasi</td>
                                        <td align="right" style="padding: 15px 20px; font-size: 13px; font-weight: 600; color: #1a2e1a;">{{ ucfirst(str_replace('_', ' ', $booking->booking_type)) }}</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    @endif

                    <!-- CTA -->
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" style="padding-bottom: 15px;">
                                <a href="{{ route('reservasi.detail-pesanan', ['token' => $tokenCode]) }}" class="btn" style="display: inline-block; background-color: #017249; color: #ffffff; text-decoration: none; font-size: 14px; font-weight: 600; padding: 14px 32px; border-radius: 8px;">Lihat Reservasi Saya</a>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <p style="font-size: 12px; color: #9ab0a3; margin: 0;">Ada pertanyaan? Hubungi kami melalui WhatsApp atau balas email ini.</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <!-- FOOTER -->
            <tr>
                <td class="footer" bgcolor="#f6fbf8" style="padding: 30px; border-top: 1px solid #ddeee6;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 20px;">
                        <tr>
                            <td align="left" valign="top" width="50%">
                                <div style="font-size: 16px; font-weight: 700; color: #017249; margin: 0;">Pineus<span style="color: #0b5a3e;">Tilu</span></div>
                                <div style="font-size: 11px; color: #7a9a8a; margin-top: 4px;">Glamping & Outdoor Adventure</div>
                            </td>
                            <td align="right" valign="top" width="50%">
                                <div style="font-size: 11px; color: #7a9a8a; line-height: 1.8;">
                                    📍 Ciwidey, Bandung, Jawa Barat<br>
                                    📞 +62 877-3548-2327<br>
                                    ✉ <a href="mailto:pineust@gmail.com" style="color: #017249; text-decoration: none;">pineust@gmail.com</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" style="border-top: 1px solid #ddeee6; padding-top: 15px; font-size: 11px; color: #9ab0a3; line-height: 1.6;">
                                © {{ date('Y') }} Pineus Tilu. Semua hak dilindungi.<br>
                                Email ini dikirim secara otomatis, mohon tidak membalas email ini.
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
