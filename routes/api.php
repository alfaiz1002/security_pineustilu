<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PaymentController;

// Endpoint webhook Midtrans (stateless - tanpa session / cookie)
Route::post('/payment/notification', [PaymentController::class, 'handleNotification'])
    ->name('api.payment.notification');

// Endpoint penerima laporan CSP Violation dari browser untuk AuditLog
Route::post('/csp-report', function (\Illuminate\Http\Request $request) {
    $reportData = json_decode($request->getContent(), true) ?? $request->all();
    $cspReport = $reportData['csp-report'] ?? $reportData;

    $documentUri = $cspReport['document-uri'] ?? $cspReport['documentURI'] ?? request()->header('Referer') ?? 'Unknown Page';
    $blockedUri = $cspReport['blocked-uri'] ?? $cspReport['blockedURI'] ?? 'Unknown Resource';
    $violatedDirective = $cspReport['violated-directive'] ?? $cspReport['violatedDirective'] ?? 'Unknown Directive';

    \App\Services\AuditLogService::log(
        'csp_violation',
        "Pelanggaran CSP diblokir: Resource '{$blockedUri}' pada halaman '{$documentUri}' (Directive: {$violatedDirective})",
        auth()->id(),
        'WARNING'
    );

    return response()->json(['status' => 'logged'], 204);
})->name('api.csp.report');

