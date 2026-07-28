<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pineus Tilu Verification Code</title>
</head>
<body style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; background-color: #f4f6f8; margin: 0; padding: 30px 10px; color: #333333;">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 550px; background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);">
        <!-- HEADER WITH LOGO -->
        <tr>
            <td align="center" style="background-color: #017249; padding: 25px 20px;">
                @if(isset($message))
                    <img src="{{ $message->embed(public_path('images/dashboard/logo_email.png')) }}" alt="Pineus Tilu" width="160" style="display: block; max-width: 160px; height: auto;">
                @else
                    <img src="{{ asset('images/dashboard/logo_email.png') }}" alt="Pineus Tilu" width="160" style="display: block; max-width: 160px; height: auto;">
                @endif
            </td>
        </tr>

        <!-- MAIN BODY CONTENT -->
        <tr>
            <td style="padding: 35px 30px; text-align: center;">
                <h2 style="color: #017249; font-size: 22px; font-weight: 700; margin: 0 0 12px 0;">Verify Your Account 🏕️</h2>
                <p style="font-size: 15px; color: #555555; line-height: 1.6; margin: 0 0 25px 0;">
                    Here is your One-Time Password (OTP) to complete your verification:
                </p>

                <!-- OTP BOX -->
                <div style="background-color: #f0f8f4; border: 2px dashed #017249; border-radius: 10px; padding: 18px; margin-bottom: 25px;">
                    <span style="font-size: 34px; font-weight: 800; letter-spacing: 8px; color: #017249; font-family: 'Courier New', Courier, monospace;">{{ $otp }}</span>
                </div>

                <p style="font-size: 14px; color: #666666; margin: 0 0 8px 0;">
                    ⏳ Valid for <strong>15 minutes</strong>.
                </p>
                <p style="font-size: 13px; color: #e63946; font-weight: 600; margin: 0 0 30px 0;">
                    🔒 For security reasons, do not share this code with anyone.
                </p>

                <!-- FOOTER / CLOSING -->
                <div style="border-top: 1px solid #edf2f7; padding-top: 20px; text-align: center;">
                    <p style="font-size: 14px; font-weight: 600; color: #017249; margin: 0 0 10px 0;">
                        Happy camping vibes! 🌲🔥✨
                    </p>
                    <p style="font-size: 12px; color: #999999; margin: 0 0 5px 0;">
                        If you didn't request this code, please ignore this email.
                    </p>
                    <p style="font-size: 12px; color: #bbbbbb; margin: 0;">
                        &copy; {{ date('Y') }} Pineus Tilu Camping Ground. All rights reserved.
                    </p>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
