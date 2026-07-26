<?php

use App\Http\Controllers\Auth\GoogleAuthController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OTPController;
use App\Http\Controllers\AreaController;
use App\Http\Controllers\AktivitasController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\OutboundController;
use App\Http\Controllers\FaqController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\Settings\ProfileController;
use App\Livewire\Settings\Appearance;
use App\Livewire\Settings\Password;
use App\Livewire\Settings\TwoFactor;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Laravel\Fortify\Features;

Route::view('/cerita', 'cerita')->name('cerita');

Route::view('/', 'dashboard')->name('home');

Route::view('dashboard', 'dashboard')->name('dashboard');

// Cabin VIP/VVIP routes
Route::get('/cabin/vip', [AreaController::class, 'show'])->defaults('slug', 'pineus-tilu-cabin')->name('cabin.vip');
Route::get('/cabin/vvip', [AreaController::class, 'show'])->defaults('slug', 'pineus-tilu-cabin-vvip')->name('cabin.vvip');
Route::permanentRedirect('/area/cabin', '/cabin/vip')->name('cabin.vip.legacy');
Route::permanentRedirect('/cabin-vvip', '/cabin/vvip')->name('cabin.vvip.legacy');

// Dynamic area routes - semua area menggunakan AreaController
Route::get('/area/{slug}', [AreaController::class, 'show'])->name('area.show');

Route::get('/aktivitas', [AktivitasController::class, 'index'])->name('aktivitas');

Route::view('/pedoman', 'pedoman')->name('pedoman');

Route::view('/morikafe', 'morikafe')->name('morikafe');
Route::get('/morikafe/menu-pdf', function (\Illuminate\Http\Request $request) {
    \App\Services\AuditLogService::logMorikafeMenuDownloaded($request->ip());
    return redirect()->away('https://drive.google.com/file/d/1Dr8EPHERgTZMYIp0581AtYuIdKhyiooD/view');
})->name('morikafe.menu.pdf');

Route::get('/faq', [FaqController::class, 'index'])->name('faq');

// Reschedule & Cancellation for guest users (with booking code lookup)
Route::get('/reschedule', [BookingController::class, 'showReschedulePage'])->name('reschedule');
// New reschedule flow: page where guest chooses new dates/units (separate from main glamping reservation)
Route::get('/reschedule/{token}/pilih', [BookingController::class, 'showRescheduleForm'])->name('reschedule.form');
Route::post('/reschedule/{token}/submit', [BookingController::class, 'processReschedule'])->name('reschedule.submit');
// API endpoint for reschedule price estimation
Route::post('/api/reschedule/{token}/estimate', [BookingController::class, 'estimateReschedulePrice']);
Route::get('/cancellation', [BookingController::class, 'showCancellationPage'])->name('cancellation');
Route::post('/cancellation/process', [BookingController::class, 'processCancellation'])->name('cancellation.process');
// Guest-facing cancellation confirmation & refund flow
Route::get('/cancellation/confirm', [BookingController::class, 'showCancellationConfirmPage'])->name('cancellation.confirm');
Route::post('/cancellation/refund', [BookingController::class, 'processRefund'])->name('cancellation.refund');
Route::get('/cancellation/success', [BookingController::class, 'showCancellationSuccessPage'])->name('cancellation.success');

// Availability Table Route
Route::get('/availability', [BookingController::class, 'showAvailabilityTable'])->name('availability');
Route::get('/availability/data', [BookingController::class, 'getAvailabilityData'])->name('availability.data');

// Reservasi Glamping Routes (User-facing dengan BookingController)
Route::get('/reservasi/glamping', [BookingController::class, 'showGlampingReservation'])->name('reservasi.glamping');
Route::get('/reservasi/glamping/area-info/{slug}', [BookingController::class, 'getGlampingAreaInfo'])->name('reservasi.glamping.area-info');
Route::post('/reservasi/glamping', [BookingController::class, 'store'])->middleware('throttle:5,1')->name('reservasi.glamping.store');

// Detail Pesanan Route
Route::get('/reservasi/detail-pesanan/{token}', [BookingController::class, 'showDetailPesanan'])->name('reservasi.detail-pesanan');
Route::post('/reservasi/detail-pesanan/{token}/update-status', [BookingController::class, 'updateBookingStatus'])->name('reservasi.update-status');

// Reservasi Outbound Route (use controller for data)
Route::get('/reservasi/outbound', [OutboundController::class, 'reservasiOutbound'])->name('reservasi.outbound');
Route::post('/reservasi/outbound', [OutboundController::class, 'store'])->middleware('throttle:5,1')->name('reservasi.outbound.store');
// Redirect untuk URL salah ketik/legacy
Route::permanentRedirect('/reservasi/outbond', '/reservasi/outbound')->name('reservasi.outbond.legacy');

// API Routes untuk data dinamis (rate limited: 60 requests per minute)
Route::prefix('api')->middleware(['throttle:60,1'])->group(function () {
    Route::get('/areas', [AreaController::class, 'getAllAreas'])->name('api.areas');
    Route::get('/areas/{slug}', [AreaController::class, 'getAreaData'])->name('api.area');
    Route::get('/items', [AreaController::class, 'getItems'])->name('api.items');
    Route::get('/outbounds', [OutboundController::class, 'getAllOutbounds'])->name('api.outbounds');
    Route::get('/outbounds/{slug}', [OutboundController::class, 'getOutboundData'])->name('api.outbound');

    Route::post('/reservasi/glamping/draft/start', [BookingController::class, 'startGlampingDraft'])->name('api.reservasi.glamping.draft.start');
    Route::post('/reservasi/glamping/draft/{draftId}/select-unit', [BookingController::class, 'selectGlampingDraftUnit'])->name('api.reservasi.glamping.draft.select-unit');
    Route::get('/reservasi/glamping/draft/{draftId}/checkout-options', [BookingController::class, 'getGlampingDraftCheckoutOptions'])->name('api.reservasi.glamping.draft.checkout-options');

    // Reschedule pricing estimation
    Route::post('/reschedule/{token}/estimate', [BookingController::class, 'estimateReschedulePrice'])->name('api.reschedule.estimate');

    // Payment routes
    Route::get('/payment/snap-token/{bookingToken}', [PaymentController::class, 'getSnapToken'])->name('api.payment.snap-token');
    Route::get('/payment/status/{bookingToken}', [PaymentController::class, 'getPaymentStatus'])->name('api.payment.status');
});



Route::get('/barang-tambahan', [ItemController::class, 'index'])->name('barang-tambahan');

// OTP Registration & Verification
Route::middleware('guest')->group(function () {
    Route::get('/register', [AuthController::class, 'showRegister'])->name('register');
    Route::post('/register', [AuthController::class, 'register'])->name('register.store')->middleware('throttle:otp-register');
    Route::get('/verify-otp', [OTPController::class, 'showVerifyForm'])->name('otp.verify.form');
    Route::post('/verify-otp', [OTPController::class, 'verify'])->name('otp.verify')->middleware('throttle:otp-verify');
    Route::post('/resend-otp', [OTPController::class, 'resend'])->name('otp.resend')->middleware('throttle:otp-resend');
    Route::post('/login-otp-start', [AuthController::class, 'loginOtpStart'])->name('login.otp.start')->middleware('throttle:login');
});

Route::middleware(['auth'])->group(function () {
    Route::redirect('settings', 'settings/profile');

    // Profile with dynamic tabs - Use ProfileController untuk real data dari database
    Route::get('settings/profile/{tab?}', [ProfileController::class, 'show'])->name('profile');

    // Profile update
    Route::put('settings/profile', [ProfileController::class, 'update'])->name('profile.update');

    Route::get('settings/password', Password::class)->name('user-password.edit');
    Route::get('settings/appearance', Appearance::class)->name('appearance.edit');

    Route::get('settings/two-factor', TwoFactor::class)
        ->middleware(
            when(
                Features::canManageTwoFactorAuthentication()
                    && Features::optionEnabled(Features::twoFactorAuthentication(), 'confirmPassword'),
                ['password.confirm'],
                [],
            ),
        )
        ->name('two-factor.show');
});

// Google OAuth Routes
Route::get('auth/google', [GoogleAuthController::class, 'redirectToGoogle'])->name('google.redirect');
Route::get('auth/google/callback', [GoogleAuthController::class, 'handleGoogleCallback'])->name('google.callback');

// Temporary Cloud Benchmark Route for Render.com/Hostinger (Safe isolated endpoint)
Route::get('/dev/benchmark-otp', function (\Illuminate\Http\Request $request) {
    if ($request->query('key') !== 'pineustilu2026') {
        return response()->json(['error' => 'Unauthorized access. Secret key required.'], 403);
    }

    @set_time_limit(300);
    @ini_set('max_execution_time', '300');

    // Restored to default 50 iterations as required by thesis methodology (can be adjusted via ?iterations=20 for cloud HTTP proxies)
    $iterations = (int) $request->query('iterations', 50);

    \Illuminate\Support\Facades\Artisan::call('benchmark:otp', [
        '--iterations' => $iterations,
        '--chart' => true,
    ]);

    if (\Illuminate\Support\Facades\Storage::exists('benchmark/statistics.json')) {
        $stats = json_decode(\Illuminate\Support\Facades\Storage::get('benchmark/statistics.json'), true);
        return response()->json([
            'status' => 'success',
            'environment_note' => "Cloud Server Benchmark Output ({$iterations} Iterations)",
            'executed_at' => now()->toIso8601String(),
            'statistics' => $stats,
        ], 200, [], JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    }

    return response()->json([
        'status' => 'completed',
        'cli_output' => \Illuminate\Support\Facades\Artisan::output(),
    ]);
});

// Direct Web Route to View HTML Benchmark Chart Dashboard in Browser
Route::get('/dev/benchmark-otp/chart', function (\Illuminate\Http\Request $request) {
    if ($request->query('key') !== 'pineustilu2026') {
        return response()->json(['error' => 'Unauthorized access. Secret key required.'], 403);
    }

    if (\Illuminate\Support\Facades\Storage::exists('benchmark/charts/index.html')) {
        return response(\Illuminate\Support\Facades\Storage::get('benchmark/charts/index.html'), 200)
            ->header('Content-Type', 'text/html');
    }

    return response('Benchmark chart has not been generated yet. Please run /dev/benchmark-otp first.', 404);
});

// Direct Web Route to Download raw_data.csv in Browser
Route::get('/dev/benchmark-otp/csv', function (\Illuminate\Http\Request $request) {
    if ($request->query('key') !== 'pineustilu2026') {
        return response()->json(['error' => 'Unauthorized access. Secret key required.'], 403);
    }

    if (\Illuminate\Support\Facades\Storage::exists('benchmark/raw_data.csv')) {
        return \Illuminate\Support\Facades\Storage::download('benchmark/raw_data.csv', 'raw_data_hostinger.csv');
    }

    return response('raw_data.csv has not been generated yet. Please run /dev/benchmark-otp first.', 404);
});

// Route untuk Cetak Laporan Audit Keamanan & Forensik Digital (PDF)
Route::get('/admin/audit-log/export-pdf', function () {
    if (!Auth::check() || !Auth::user()->hasRole('super-admin')) {
        abort(403, 'Akses ditolak. Hanya Super Admin Keamanan yang berhak mencetak Laporan Forensik.');
    }

    $logs = \App\Models\ActivityLog::with('user')->latest()->get();
    $criticalCount = \App\Models\ActivityLog::where('severity', 'CRITICAL')->count();
    $warningCount = \App\Models\ActivityLog::where('severity', 'WARNING')->count();
    $infoCount = \App\Models\ActivityLog::where('severity', 'INFO')->count();
    $totalCount = $logs->count();

    $reportHash = strtoupper(substr(hash('sha256', now()->toIso8601String() . 'PINEUS_TILU_AUDIT'), 0, 16));

    return view('admin.audit-log-pdf', compact(
        'logs',
        'criticalCount',
        'warningCount',
        'infoCount',
        'totalCount',
        'reportHash'
    ));
})->name('admin.audit-log.export-pdf');




