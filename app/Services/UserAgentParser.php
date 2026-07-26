<?php

namespace App\Services;

class UserAgentParser
{
    /**
     * Parse raw User-Agent string into human-readable browser, OS, and device type.
     */
    public static function parse(?string $userAgent): string
    {
        if (empty($userAgent)) {
            return 'Unknown Device / Agent';
        }

        $ua = strtolower($userAgent);

        // Detect Automated Scrapers / CLI Tools
        if (str_contains($ua, 'python')) return 'Python Script / Scraper Bot 🤖';
        if (str_contains($ua, 'curl')) return 'cURL CLI Tool 🤖';
        if (str_contains($ua, 'postman')) return 'Postman API Client 🛠️';
        if (str_contains($ua, 'wget')) return 'Wget Download Tool 🤖';
        if (str_contains($ua, 'scrapy')) return 'Scrapy Web Crawler 🤖';
        if (str_contains($ua, 'go-http-client')) return 'Go HTTP Client 🤖';

        // Detect Operating System
        $os = 'Unknown OS';
        if (str_contains($ua, 'windows nt 10.0')) $os = 'Windows 10/11';
        elseif (str_contains($ua, 'windows nt 6.3')) $os = 'Windows 8.1';
        elseif (str_contains($ua, 'windows nt 6.1')) $os = 'Windows 7';
        elseif (str_contains($ua, 'mac os x') || str_contains($ua, 'macintosh')) $os = 'macOS';
        elseif (str_contains($ua, 'android')) $os = 'Android';
        elseif (str_contains($ua, 'iphone') || str_contains($ua, 'ipad')) $os = 'iOS';
        elseif (str_contains($ua, 'linux')) $os = 'Linux';

        // Detect Browser
        $browser = 'Browser';
        if (str_contains($ua, 'edg/')) $browser = 'Microsoft Edge';
        elseif (str_contains($ua, 'chrome/')) $browser = 'Google Chrome';
        elseif (str_contains($ua, 'firefox/')) $browser = 'Mozilla Firefox';
        elseif (str_contains($ua, 'safari/') && !str_contains($ua, 'chrome/')) $browser = 'Apple Safari';
        elseif (str_contains($ua, 'opera') || str_contains($ua, 'opr/')) $browser = 'Opera';

        // Device Type
        $deviceType = (str_contains($ua, 'mobile') || str_contains($ua, 'android') || str_contains($ua, 'iphone')) ? 'Mobile 📱' : 'Desktop 💻';

        return "{$browser} pada {$os} ({$deviceType})";
    }

    /**
     * Format IP address with location context.
     */
    public static function formatIp(?string $ip): string
    {
        if (empty($ip) || $ip === '127.0.0.1' || $ip === '::1' || str_starts_with($ip, '192.168.') || str_starts_with($ip, '10.') || str_starts_with($ip, '172.16.')) {
            return "{$ip} (Localhost / Jaringan Lokal 🏠)";
        }

        return "{$ip} (Indonesia 🇮🇩)";
    }
}
