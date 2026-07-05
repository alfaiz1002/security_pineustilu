<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kode OTP Anda</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; color: #333;">
    <div style="max-w-md; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); text-align: center;">
        <h2 style="color: #017249; margin-bottom: 20px;">Verifikasi Akun Pineus Tilu</h2>
        <p style="font-size: 16px; margin-bottom: 20px;">Berikut adalah kode verifikasi OTP Anda. Jangan bagikan kode ini kepada siapapun.</p>
        
        <div style="background-color: #f8f9fa; border: 2px dashed #017249; padding: 15px; border-radius: 8px; margin-bottom: 20px;">
            <span style="font-size: 32px; font-weight: bold; letter-spacing: 5px; color: #333;">{{ $otp }}</span>
        </div>
        
        <p style="font-size: 14px; color: #666; margin-bottom: 30px;">Kode ini hanya berlaku selama 15 menit.</p>
        
        <div style="border-top: 1px solid #eee; padding-top: 20px; font-size: 12px; color: #999;">
            <p>Jika Anda tidak merasa meminta kode ini, abaikan email ini.</p>
            <p>&copy; {{ date('Y') }} Pineus Tilu Camp. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
