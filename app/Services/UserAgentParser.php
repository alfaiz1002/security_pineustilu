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
     * Remove emojis from text for formal PDF SOP documents.
     */
    public static function stripEmojis(?string $string): string
    {
        if (empty($string)) return '';
        $clean = preg_replace('/[\x{1F600}-\x{1F64F}\x{1F300}-\x{1F5FF}\x{1F680}-\x{1F6FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}\x{1F900}-\x{1F9FF}\x{1F1E6}-\x{1F1FF}]/u', '', $string);
        return trim(preg_replace('/\s+/', ' ', $clean));
    }

    /**
     * Plain text User-Agent parser for PDF SOP reports (100% no emojis).
     */
    public static function parsePlain(?string $userAgent): string
    {
        return self::stripEmojis(self::parse($userAgent));
    }

    /**
     * Get Geo Details (Country Code & Location Name) for IP Address.
     */
    public static function getGeoDetails(?string $ip): array
    {
        if (empty($ip) || $ip === '127.0.0.1' || $ip === '::1' || str_starts_with($ip, '192.168.') || str_starts_with($ip, '10.') || str_starts_with($ip, '172.16.')) {
            return ['code' => 'LOCAL', 'location' => 'Localhost / Jaringan Lokal 🏠'];
        }

        // Fast match for demo prefixes
        if (str_starts_with($ip, '185.220') || str_starts_with($ip, '194.26') || str_starts_with($ip, '46.101')) {
            return ['code' => 'de', 'location' => 'Frankfurt, Jerman 🇩🇪'];
        }
        if (str_starts_with($ip, '45.33') || str_starts_with($ip, '104.238') || str_starts_with($ip, '198.51') || str_starts_with($ip, '23.94')) {
            return ['code' => 'us', 'location' => 'California, Amerika Serikat 🇺🇸'];
        }
        if (str_starts_with($ip, '95.213') || str_starts_with($ip, '188.162') || str_starts_with($ip, '77.88')) {
            return ['code' => 'ru', 'location' => 'Moskow, Rusia 🇷🇺'];
        }
        if (str_starts_with($ip, '80.58') || str_starts_with($ip, '83.32') || str_starts_with($ip, '212.170')) {
            return ['code' => 'es', 'location' => 'Madrid, Spanyol 🇪🇸'];
        }
        if (str_starts_with($ip, '87.50') || str_starts_with($ip, '185.125') || str_starts_with($ip, '194.255')) {
            return ['code' => 'dk', 'location' => 'Kopenhagen, Denmark 🇩🇰'];
        }
        if (str_starts_with($ip, '51.175') || str_starts_with($ip, '193.212') || str_starts_with($ip, '84.208') || str_starts_with($ip, '151.236')) {
            return ['code' => 'no', 'location' => 'Oslo, Norwegia 🇳🇴'];
        }
        if (str_starts_with($ip, '128.199') || str_starts_with($ip, '139.59') || str_starts_with($ip, '103.28')) {
            return ['code' => 'sg', 'location' => 'Singapura 🇸🇬'];
        }
        if (str_starts_with($ip, '133.') || str_starts_with($ip, '210.140')) {
            return ['code' => 'jp', 'location' => 'Tokyo, Jepang 🇯🇵'];
        }
        if (str_starts_with($ip, '82.132') || str_starts_with($ip, '51.140')) {
            return ['code' => 'gb', 'location' => 'London, Inggris 🇬🇧'];
        }
        if (str_starts_with($ip, '103.') || str_starts_with($ip, '110.') || str_starts_with($ip, '180.') || str_starts_with($ip, '36.')) {
            return ['code' => 'id', 'location' => 'Indonesia 🇮🇩'];
        }

        // Automatic Dynamic GeoIP Lookup for any public IP worldwide (cached 24 hours)
        return Cache::remember("geoip_details_{$ip}", 86400, function () use ($ip) {
            try {
                $response = Http::timeout(2)->get("http://ip-api.com/json/{$ip}?fields=status,country,countryCode,city");
                if ($response->successful() && $response->json('status') === 'success') {
                    $country = $response->json('country');
                    $countryCode = strtolower($response->json('countryCode'));
                    $city = $response->json('city');
                    $flag = self::countryCodeToEmojiFlag($countryCode);
                    $locationStr = $city ? "{$city}, {$country} {$flag}" : "{$country} {$flag}";
                    return ['code' => $countryCode, 'location' => $locationStr];
                }
            } catch (\Throwable $e) {
                Log::warning("GeoIP lookup failed for IP {$ip}: " . $e->getMessage());
            }

            return ['code' => '', 'location' => 'Luar Negeri / Overseas 🌍'];
        });
    }

    /**
     * Format IP address with location context.
     */
    public static function formatIp(?string $ip): string
    {
        $details = self::getGeoDetails($ip);
        return "{$ip} ({$details['location']})";
    }

    /**
     * Plain text IP formatting for PDF SOP reports (100% no emojis).
     */
    public static function formatIpPlain(?string $ip): string
    {
        return self::stripEmojis(self::formatIp($ip));
    }

    /**
     * Format IP address with HTML SVG/PNG Flag image icon for Filament Infolist.
     */
    public static function formatIpHtml(?string $ip): string
    {
        if (empty($ip) || $ip === '127.0.0.1' || $ip === '::1' || str_starts_with($ip, '192.168.') || str_starts_with($ip, '10.') || str_starts_with($ip, '172.16.')) {
            return "<span class=\"inline-flex items-center gap-1.5\"><span>🏠</span> <span>{$ip} <span class=\"text-xs text-gray-400 dark:text-gray-500\">(Localhost / Jaringan Lokal)</span></span></span>";
        }

        $details = self::getGeoDetails($ip);
        $code = strtolower($details['code'] ?? '');
        $location = $details['location'];

        if (!empty($code) && strlen($code) === 2 && $code !== 'local') {
            $flagUrl = "https://flagcdn.com/w40/{$code}.png";
            return "<span class=\"inline-flex items-center gap-2\"><img src=\"{$flagUrl}\" style=\"width:22px; height:15px; object-fit:cover; border-radius:3px; display:inline-block; vertical-align:middle;\" alt=\"{$code}\"> <span>{$ip} <span class=\"text-xs text-gray-400 dark:text-gray-500\">({$location})</span></span></span>";
        }

        return "<span>{$ip} <span class=\"text-xs text-gray-400 dark:text-gray-500\">({$location})</span></span>";
    }

    /**
     * Convert 2-letter ISO Country Code (e.g. US, ID, JP, FR, AU, NL, ES, DK) into Unicode Emoji Flag.
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
