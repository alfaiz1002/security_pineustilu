<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Evaluasi Insiden Keamanan #{{ sprintf('%04d', $log->id) }} - Pineus Tilu</title>
    <style>
        @page {
            size: A4 portrait;
            margin: 15mm;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            color: #111827;
            background-color: #f3f4f6;
            margin: 0;
            padding: 30px 15px;
            font-size: 11px;
            line-height: 1.6;
            display: flex;
            justify-content: center;
        }

        /* Centered A4 Paper Preview Container */
        .a4-document {
            width: 210mm;
            min-height: 297mm;
            background-color: #ffffff;
            padding: 22mm 20mm;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            position: relative;
        }

        /* Kop Surat - Clean Line */
        .kop-surat {
            border-bottom: 2px solid #111827;
            padding-bottom: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        .kop-brand {
            font-size: 16px;
            font-weight: bold;
            color: #111827;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .kop-sub {
            font-size: 10px;
            color: #4b5563;
            margin-top: 3px;
        }

        .kop-meta {
            text-align: right;
            font-size: 9.5px;
            color: #4b5563;
        }

        /* Title Container */
        .doc-title-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .doc-title-container h2 {
            font-size: 14px;
            font-weight: bold;
            color: #111827;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin: 0 0 4px 0;
        }

        .doc-title-container p {
            font-size: 10.5px;
            color: #6b7280;
            margin: 0;
        }

        /* Intro Paragraph */
        .intro-paragraph {
            font-size: 11px;
            color: #374151;
            margin-bottom: 20px;
            text-align: justify;
            line-height: 1.6;
        }

        /* Section Title - Clean Line */
        .section-header {
            font-size: 11px;
            font-weight: bold;
            color: #111827;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1.5px solid #111827;
            padding-bottom: 4px;
            margin: 22px 0 12px 0;
        }

        /* Table - Clean Horizontal Lines Only */
        .info-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 18px;
            font-size: 11px;
        }

        .info-table th {
            color: #374151;
            font-weight: bold;
            text-align: left;
            padding: 8px 10px;
            width: 32%;
            border-bottom: 1px solid #e5e7eb;
            background-color: #f9fafb;
            font-size: 10px;
            text-transform: uppercase;
        }

        .info-table td {
            padding: 8px 10px;
            border-bottom: 1px solid #e5e7eb;
            color: #111827;
            vertical-align: top;
        }

        /* Narrative Code Line */
        .code-snippet {
            font-family: 'Courier New', Courier, monospace;
            background-color: #f8fafc;
            padding: 10px 12px;
            border-left: 3px solid #111827;
            font-size: 10.5px;
            word-break: break-all;
            margin-bottom: 18px;
        }

        /* Bullet List */
        .bullet-list {
            margin: 0;
            padding-left: 20px;
            color: #111827;
            font-size: 11px;
        }

        .bullet-list li {
            margin-bottom: 8px;
            text-align: justify;
        }

        /* Formal Signatures Footer */
        .signature-section {
            margin-top: 45px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            page-break-inside: avoid;
        }

        .sig-box {
            text-align: center;
            width: 200px;
        }

        .sig-box .title {
            font-size: 10px;
            font-weight: bold;
            color: #374151;
            text-transform: uppercase;
            margin-bottom: 55px;
        }

        .sig-box .name {
            font-size: 11px;
            font-weight: bold;
            color: #111827;
            border-top: 1px solid #111827;
            padding-top: 4px;
        }

        .sig-box .role {
            font-size: 9.5px;
            color: #6b7280;
        }

        /* Floating Action Bar */
        .action-bar {
            position: fixed;
            top: 15px;
            right: 25px;
            z-index: 9999;
        }

        .btn-action {
            background-color: #111827;
            color: #ffffff;
            border: none;
            padding: 8px 18px;
            font-size: 11px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .btn-action:hover {
            background-color: #1f2937;
        }

        @media print {
            body {
                background-color: #ffffff;
                padding: 0;
                display: block;
            }
            .a4-document {
                width: 100%;
                box-shadow: none;
                padding: 0;
                margin: 0;
            }
            .action-bar {
                display: none !important;
            }
        }
    </style>
</head>
<body>

    <!-- Floating Action Bar -->
    <div class="action-bar">
        <button onclick="window.print()" class="btn-action">
            🖨️ Cetak / Simpan Laporan PDF
        </button>
    </div>

    <!-- Centered A4 Paper Preview -->
    <div class="a4-document">

        <!-- Kop Surat -->
        <div class="kop-surat">
            <div>
                <div class="kop-brand">Tim Security Pineustilu</div>
                <div class="kop-sub">Standar Operasional Prosedur (SOP) Audit Keamanan Sistem &amp; Forensik Digital</div>
            </div>
            <div class="kop-meta">
                <div>Klasifikasi: <strong>RAHASIA / INTERNAL AUDIT</strong></div>
                <div style="margin-top: 3px;">No. Dokumen: <strong>AUDIT-SEC/2026/PT/{{ sprintf('%04d', $log->id) }}</strong></div>
            </div>
        </div>

        <!-- Document Title -->
        <div class="doc-title-container">
            <h2>BERKAS EVALUASI INSIDEN KEAMANAN &amp; REKOMENDASI MITIGASI</h2>
            <p>Laporan Penilaian Teknis Peristiwa Keamanan Sistem Informasi &bull; Referensi Insiden ID #{{ sprintf('%04d', $log->id) }}</p>
        </div>

        <!-- Intro Paragraph -->
        <div class="intro-paragraph">
            Laporan ini disusun secara formal berdasarkan temuan instrumen pengawasan keamanan siber pada server web Pineus Tilu. Dokumen ini memuat analisis rincian barang bukti forensik digital, identifikasi perangkat pengakses, dampak risiko kerugian bisnis, serta petunjuk tindakan korektif bagi tim teknis pengelola sistem.
        </div>

        <!-- Section 1: Metadata -->
        <div class="section-header">I. IDENTIFIKASI UTAMA INSIDEN (INCIDENT METADATA)</div>
        <table class="info-table">
            <tr>
                <th>ID Referensi Insiden</th>
                <td><strong>#{{ sprintf('%04d', $log->id) }}</strong></td>
            </tr>
            <tr>
                <th>Waktu Kejadian (WIB)</th>
                <td>{{ $log->created_at->setTimezone('Asia/Jakarta')->format('d F Y - H:i:s') }} WIB</td>
            </tr>
            <tr>
                <th>Kategori Insiden</th>
                <td><strong>{{ ucfirst(str_replace('_', ' ', $log->event)) }}</strong></td>
            </tr>
            <tr>
                <th>Tingkat Keparahan (Severity)</th>
                <td><strong>{{ $log->severity }}</strong></td>
            </tr>
            <tr>
                <th>Identitas Pengguna Terkait</th>
                <td>{{ $log->user ? $log->user->name . ' (' . $log->user->email . ')' : 'Guest ()' }}</td>
            </tr>
        </table>

        <!-- Section 2: Forensic Environment -->
        <div class="section-header">II. LINGKUNGAN FORENSIK &amp; REKAM PERANGKAT PENGAKSES</div>
        <table class="info-table">
            <tr>
                <th>Alamat IP &amp; Lokasi Geografis</th>
                <td>{{ \App\Services\UserAgentParser::formatIpPlain($log->ip_address) }}</td>
            </tr>
            <tr>
                <th>Perangkat &amp; Browser Engine</th>
                <td>{{ \App\Services\UserAgentParser::parsePlain(preg_match('/User-Agent:\s*([^\)]+)/i', $log->description, $m) ? $m[1] : request()->header('User-Agent')) }}</td>
            </tr>
            <tr>
                <th>Hash Integritas Dokumen</th>
                <td><code>SHA256: {{ $reportHash }}</code></td>
            </tr>
        </table>

        <!-- Section 3: Evidence Narrative -->
        <div class="section-header">III. BARANG BUKTI TEKNIS &amp; NARASI PERISTIWA (EVIDENCE NARRATIVE)</div>
        <div class="code-snippet">
            {{ $log->description }}
        </div>

        <!-- Section 4: Business Impact Assessment -->
        <div class="section-header">IV. ANALISIS RISIKO DAN POTENSI KERUGIAN BISNIS (BUSINESS IMPACT ASSESSMENT)</div>
        <ul class="bullet-list">
            @if(in_array($log->event, ['sql_injection_attempt']))
                <li><strong>Risiko Kebocoran Basis Data &amp; Data Transaksi:</strong> Kerentanan SQL Injection berpotensi dimanfaatkan peretas untuk mengunduh seluruh basis data reservasi, kredensial pengguna, serta riwayat transaksi keuangan.</li>
                <li><strong>Potensi Kerugian Finansial &amp; Operasional:</strong> Risiko pembatalan reservasi massal akibat kerusakan data (*Data Corruption*), potensi denda pelanggaran perlindungan data pribadi (UU PDP), serta kehilangan pendapatan harian sewa tenda.</li>
            @elseif(in_array($log->event, ['idor_attempt']))
                <li><strong>Pelanggaran Privasi Pengunjung:</strong> Penyerang dapat mengunduh atau mengubah data reservasi dan bukti pembayaran milik pelanggan lain secara ilegal.</li>
                <li><strong>Risiko Kerusakan Reputasi:</strong> Potensi komplain publik dan gugatan hukum dari pengunjung yang menurunkan tingkat kepercayaan calon wisatawan secara signifikan.</li>
            @elseif(in_array($log->event, ['bot_scraping_attempt', 'unauthorized_access']))
                <li><strong>Pencurian Data Strategis Harga &amp; Ketersediaan:</strong> Bot otomatis dapat mencuri data ketersediaan tempat dan pola tarif sewa untuk kepentingan pihak ketiga/kompetitor.</li>
                <li><strong>Lonjakan Beban Server &amp; Penurunan Layanan:</strong> Tingginya traffic bot scraping menyebabkan server *overload*, memperlambat proses checkout booking pelanggan asli, dan berisiko menyebabkan *downtime*.</li>
            @elseif(in_array($log->event, ['brute_force', 'login_failed']))
                <li><strong>Risiko Pengambilalihan Akun Administrator (Account Takeover):</strong> Keberhasilan serangan brute force memungkinkan peretas mengambil alih akun admin, mengubah nomor rekening pembayaran, serta memanipulasi data reservasi.</li>
            @elseif(in_array($log->event, ['csp_violation']))
                <li><strong>Risiko Penyusupan Skrip Jahat Pihak Ketiga (XSS):</strong> Kerentanan CSP memungkinkan skrip tidak dikenal mencegat data transaksi sensitif pengunjung saat pengisian formulir booking.</li>
            @else
                <li><strong>Risiko Gangguan Keandalan Sistem:</strong> Jika insiden ini tidak ditangani segera, akumulasi celah keamanan dapat dimanfaatkan penyerang untuk melancarkan serangan lanjutan yang lebih kompleks.</li>
            @endif
        </ul>

        <!-- Section 5: Mitigation Steps -->
        <div class="section-header">V. REKOMENDASI STRATEGI MITIGASI TEKNIS (TECHNICAL REMEDIATION PLAN)</div>
        <ul class="bullet-list">
            @if(in_array($log->event, ['bot_scraping_attempt', 'unauthorized_access']))
                <li><strong>Pembatas Laju Request (Rate Limiting):</strong> Terapkan batasan maksimum 30 request/menit per alamat IP pada endpoint publik untuk menghentikan skrip scraping otomatis.</li>
                <li><strong>Perlindungan Web Application Firewall (WAF):</strong> Aktifkan mode proteksi Cloudflare WAF JS Challenge serta masukan subnet IP pengakses ke dalam daftar blokir (IP Blacklist).</li>
            @elseif(in_array($log->event, ['idor_attempt']))
                <li><strong>Pemeriksaan Otorisasi Sisi Server (Server-Side Authorization):</strong> Wajibkan verifikasi hak akses sebelum mengembalikan data reservasi menggunakan middleware otorisasi <code>$this-&gt;authorize('view', $booking)</code>.</li>
                <li><strong>Migrasi Pengenal Unik (UUID Migration):</strong> Ganti format ID inkremental angka pada parameter URL dengan format UUID v4 untuk mencegah teknik tebak ID (Enumeration Attack).</li>
            @elseif(in_array($log->event, ['brute_force', 'login_failed']))
                <li><strong>Kebijakan Penguncian Akun (Account Lockout Policy):</strong> Aktifkan penguncian akun otomatis selama 15 menit apabila terjadi 5 kali kegagalan login berturut-turut.</li>
                <li><strong>Otentikasi Dua Faktor (MFA / 2FA):</strong> Wajibkan penggunaan aplikasi OTP Authenticator (TOTP) bagi seluruh pengguna dengan hak akses admin.</li>
            @elseif(in_array($log->event, ['csp_violation']))
                <li><strong>Audit Kebijakan Keamanan Konten (CSP Policy Audit):</strong> Audit seluruh skrip eksternal pihak ketiga dan perketat arahan header CSP <code>script-src 'self'</code>.</li>
            @elseif(in_array($log->event, ['sql_injection_attempt']))
                <li><strong>Penggunaan Query Terparameter (Prepared Statements):</strong> Pastikan seluruh kueri basis data menggunakan PDO Parameterized Queries atau Laravel Eloquent ORM secara konsisten.</li>
            @else
                <li><strong>Pengawasan Kontinyu (Continuous Monitoring):</strong> Lakukan pemantauan catatan log aktivitas secara berkala serta lakukan pembaruan patch keamanan sistem secara rutin.</li>
            @endif
            <li><strong>Integritas Barang Bukti:</strong> Cadangkan catatan bukti forensik digital ini ke dalam repositori penyimpanan terisolasi secara periodik.</li>
        </ul>

        <!-- Section 6: Formal Signatures -->
        <div class="signature-section">
            <div style="font-size: 8.5pt; color: #6b7280; max-width: 380px;">
                * Berkas evaluasi ini diterbitkan oleh <strong>Tim Auditor Keamanan Siber Pineus Tilu Web</strong>.<br>
                Seluruh catatan di atas terverifikasi secara sah dan dapat dipergunakan sebagai lampiran laporan resmi audit keamanan sistem informasi.
            </div>

            <div class="sig-box">
                <div class="title">Disetujui Oleh Tim Auditor</div>
                <div class="name">security pineustilu</div>
                <div class="role">Tim security Pineus tilu</div>
            </div>
        </div>

    </div>

</body>
</html>