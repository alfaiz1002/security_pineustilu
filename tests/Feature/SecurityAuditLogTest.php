<?php

namespace Tests\Feature;

use App\Models\ActivityLog;
use App\Services\DetectSsrfService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SecurityAuditLogTest extends TestCase
{
    use RefreshDatabase;

    public function test_detects_and_logs_sql_injection(): void
    {
        // Kirim request dengan SQL injection payload
        $this->post('/verify-otp', [
            'phone' => '08123456789',
            'otp' => "123456' OR '1'='1"
        ]);

        $this->assertDatabaseHas('activity_logs', [
            'event' => 'sql_injection_attempt',
            'severity' => 'CRITICAL',
        ]);
    }

    public function test_detects_and_logs_xss(): void
    {
        // Kirim request dengan XSS payload
        $this->post('/verify-otp', [
            'phone' => '08123456789',
            'otp' => '<script>alert(1)</script>'
        ]);

        $this->assertDatabaseHas('activity_logs', [
            'event' => 'xss_attempt',
            'severity' => 'CRITICAL',
        ]);
    }

    public function test_detects_and_logs_debug_endpoint_access(): void
    {
        // Kirim request ke debug endpoint (Telescope)
        $this->get('/telescope');

        $this->assertDatabaseHas('activity_logs', [
            'event' => 'debug_access',
            'severity' => 'WARNING',
        ]);
    }

    public function test_detects_and_logs_ssrf(): void
    {
        $ssrfService = new DetectSsrfService();
        
        // Cek URL local / loopback
        $detected = $ssrfService->checkUrl('http://127.0.0.1/admin');

        $this->assertTrue($detected);
        $this->assertDatabaseHas('activity_logs', [
            'event' => 'ssrf_attempt',
            'severity' => 'CRITICAL',
        ]);
    }
}
