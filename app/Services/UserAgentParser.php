<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

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
     * Format IP address with dynamic global country & flag context.
     * Supports all 249 country codes worldwide with automatic caching.
     */
    public static function formatIp(?string $ip): string
    {
        if (empty($ip) || $ip === '127.0.0.1' || $ip === '::1' || str_starts_with($ip, '192.168.') || str_starts_with($ip, '10.') || str_starts_with($ip, '172.16.')) {
            return "{$ip} (Localhost / Jaringan Lokal 🏠)";
        }

        // Fast match for demo prefixes
        if (str_starts_with($ip, '185.220') || str_starts_with($ip, '194.26') || str_starts_with($ip, '46.101')) {
            return "{$ip} (Frankfurt, Jerman 🇩🇪)";
        }
        if (str_starts_with($ip, '45.33') || str_starts_with($ip, '104.238') || str_starts_with($ip, '198.51') || str_starts_with($ip, '23.94')) {
            return "{$ip} (California, Amerika Serikat 🇺🇸)";
        }
        if (str_starts_with($ip, '95.213') || str_starts_with($ip, '188.162') || str_starts_with($ip, '77.88')) {
            return "{$ip} (Moskow, Rusia 🇷🇺)";
        }
        if (str_starts_with($ip, '80.58') || str_starts_with($ip, '83.32') || str_starts_with($ip, '212.170')) {
            return "{$ip} (Madrid, Spanyol 🇪🇸)";
        }
        if (str_starts_with($ip, '87.50') || str_starts_with($ip, '185.125') || str_starts_with($ip, '194.255')) {
            return "{$ip} (Kopenhagen, Denmark 🇩🇰)";
        }
        if (str_starts_with($ip, '128.199') || str_starts_with($ip, '139.59') || str_starts_with($ip, '103.28')) {
            return "{$ip} (Singapura 🇸🇬)";
        }
        if (str_starts_with($ip, '133.') || str_starts_with($ip, '210.140')) {
            return "{$ip} (Tokyo, Jepang 🇯🇵)";
        }
        if (str_starts_with($ip, '82.132') || str_starts_with($ip, '51.140')) {
            return "{$ip} (London, Inggris 🇬🇧)";
        }
        if (str_starts_with($ip, '103.') || str_starts_with($ip, '110.') || str_starts_with($ip, '180.') || str_starts_with($ip, '36.')) {
            return "{$ip} (Indonesia 🇮🇩)";
        }

        // Automatic Dynamic GeoIP Lookup for any public IP worldwide (cached for 24 hours)
        return Cache::remember("geoip_format_{$ip}", 86400, function () use ($ip) {
            try {
                $response = Http::timeout(2)->get("http://ip-api.com/json/{$ip}?fields=status,country,countryCode,city");
                if ($response->successful() && $response->json('status') === 'success') {
                    $country = $response->json('country');
                    $countryCode = $response->json('countryCode');
                    $city = $response->json('city');
                    $flag = self::countryCodeToEmojiFlag($countryCode);
                    $locationStr = $city ? "{$city}, {$country} {$flag}" : "{$country} {$flag}";
                    return "{$ip} ({$locationStr})";
                }
            } catch (\Throwable $e) {
                Log::warning("GeoIP lookup failed for IP {$ip}: " . $e->getMessage());
            }

            return "{$ip} (Luar Negeri / Overseas 🌍)";
        });
    }

    /**
     * Convert 2-letter ISO Country Code (e.g. US, ID, JP, FR, AU, NL) into Unicode Emoji Flag.
     */
    public static function countryCodeToEmojiFlag(?string $countryCode): string
    {
        if (empty($countryCode) || strlen(trim($countryCode)) !== 2) {
            return '🌍';
        }

        $code = strtoupper(trim($countryCode));
        $firstChar = ord($code[0]) + 127397;
        $secondChar = ord($code[1]) + 127397;

        return mb_chr($firstChar, 'UTF-8') . mb_chr($secondChar, 'UTF-8');
    }
}
