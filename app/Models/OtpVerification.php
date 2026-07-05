<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OtpVerification extends Model
{
    use HasFactory;

    protected $fillable = [
        'phone_number',
        'otp_hash',
        'expired_at',
        'attempts',
    ];

    protected $casts = [
        'expired_at' => 'datetime',
    ];
}
