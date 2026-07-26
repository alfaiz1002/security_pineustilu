<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOP Laporan Evaluasi Insiden #{{ sprintf('%04d', $log->id) }} - Pineus Tilu</title>
    <style>
        @page {
            size: A4 portrait;
            margin: 15mm;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Times New Roman', Times, serif;
            color: #000000;
            background-color: #e5e7eb;
            margin: 0;
            padding: 30px 15px;
            font-size: 12pt;
            line-height: 1.5;
            display: flex;
            justify-content: center;
        }

        /* Realistic A4 Paper Sheet Preview Container (Monochrome SOP) */
        .a4-document {
            width: 210mm;
            min-height: 297mm;
            background-color: #ffffff;
            padding: 22mm 20mm 20mm 20mm;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            border: 1px solid #9ca3af;
            position: relative;
        }

        /* Kop Surat Formal Hitam-Putih Double Line */
        .kop-surat {
            border-bottom: 3px double #000000;
            padding-bottom: 12px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        .kop-brand {
            font-size: 16pt;
            font-weight: bold;
            color: #000000;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .kop-sub {
            font-size: 10pt;
            color: #000000;
            margin-top: 4px;
            font-style: italic;
        }

        .kop-meta {
            text-align: right;
            font-size: 9.5pt;
            color: #000000;
        }

        .ref-code {
            font-family: 'Courier New', Courier, monospace;
            border: 1px solid #000000;
            padding: 2px 6px;
            font-size: 9.5pt;
            font-weight: bold;
            background-color: #ffffff;
            color: #000000;
        }

        /* Document Title */
        .doc-title-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .doc-title-container h2 {
            font-size: 13pt;
            font-weight: bold;
            color: #000000;
            text-transform: uppercase;
            text-decoration: underline;
            margin: 0 0 6px 0;
            letter-spacing: 0.5px;
        }

        .doc-title-container p {
            font-size: 10pt;
            color: #000000;
            margin: 0;
        }

        /* Auditor Intro Box */
        .intro-paragraph {
            border: 1px solid #000000;
            background-color: #ffffff;
            padding: 10px 14px;
            font-size: 10.5pt;
            color: #000000;
            margin-bottom: 18px;
            text-align: justify;
        }

        /* Section Title */
        .section-header {
            font-size: 11pt;
            font-weight: bold;
            color: #000000;
            text-transform: uppercase;
            border-bottom: 1px solid #000000;
            padding-bottom: 3px;
            margin: 18px 0 10px 0;
            letter-spacing: 0.5px;
        }

        /* Detailed Monochrome Table */
        .info-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
            font-size: 10.5pt;
        }

        .info-table th {
            background-color: #ffffff;
            color: #000000;
            font-weight: bold;
            text-align: left;
            padding: 7px 10px;
            width: 32%;
            border: 1px solid #000000;
            font-size: 10pt;
            text-transform: uppercase;
        }

        .info-table td {
            padding: 7px 10px;
            border: 1px solid #000000;
            color: #000000;
            vertical-align: top;
            background-color: #ffffff;
        }

        .severity-tag {
            font-weight: bold;
            text-transform: uppercase;
            border: 1px solid #000000;
            padding: 2px 6px;
            display: inline-block;
            font-size: 9pt;
            background-color: #ffffff;
            color: #000000;
        }

        /* Narrative Log Box */
        .log-box {
            border: 1px solid #000000;
            background-color: #ffffff;
            padding: 12px;
            font-size: 10pt;
            color: #000000;
            font-family: 'Courier New', Courier, monospace;
            line-height: 1.5;
            margin-bottom: 18px;
            word-break: break-all;
        }

        /* SOP Mitigation Plan */
        .mitigation-box {
            border: 1px solid #000000;
            background-color: #ffffff;
            padding: 12px 16px;
            margin-bottom: 25px;
        }

        .mitigation-box h4 {
            margin: 0 0 8px 0;
            font-size: 10.5pt;
            color: #000000;
            text-transform: uppercase;
            text-decoration: underline;
        }

        .mitigation-box ul {
            margin: 0;
            padding-left: 20px;
            color: #000000;
            font-size: 10.5pt;
        }

        .mitigation-box li {
            margin-bottom: 6px;
            text-align: justify;
        }

        /* Formal Monochrome Signature Section */
        .signature-section {
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            page-break-inside: avoid;
        }

        .sig-box {
            text-align: center;
            width: 220px;
        }

        .sig-box .title {
            font-size: 10pt;
            font-weight: bold;
            color: #000000;
            text-transform: uppercase;
            margin-bottom: 50px;
        }

        .sig-box .name {
            font-size: 11pt;
            font-weight: bold;
            color: #000000;
            border-top: 1px solid #000000;
            padding-top: 4px;
        }

        .sig-box .role {
            font-size: 9.5pt;
            color: #000000;
        }

        /* Floating Action Bar */
        .action-bar {
            position: fixed;
            top: 15px;
            right: 25px;
            z-index: 9999;
        }

        .btn-action {
            background-color: #000000;
            color: #ffffff;
            border: 1px solid #000000;
            padding: 8px 18px;
            font-size: 11pt;
            font-weight: bold;
            font-family: Arial, sans-serif;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-action:hover {
            background-color: #333333;
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
                border: none;
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
            Cetak / Simpan Dokumen SOP (PDF)
        </button>
    </div>

    <!-- Centered A4 Monochrome Paper Sheet Preview -->
    <div class="a4-document">

        <!-- Kop Surat Resmi -->
        <div class="kop-surat">
            <div>
                <div class="kop-brand">Tim Security Pineustilu</div>
                <div class="kop-sub">Standar Operasional Prosedur (SOP) Audit Keamanan Sistem &amp; Forensik Digital</div>
            </div>
            <div class="kop-meta">
                <div>Klasifikasi: <strong>RAHASIA / INTERNAL AUDIT</strong></div>
                <div style="margin-top: 4px;">No. Registrasi: <span class="ref-code">AUDIT-SEC/2026/PT/{{ sprintf('%04d', $log->id) }}</span></div>
            </div>
        </div>

        <!-- Document Title -->
        <div class="doc-title-container">
            <h2>BERKAS EVALUASI INSIDEN KEAMANAN &amp; REKOMENDASI MITIGASI</h2>
            <p>Laporan Penilaian Teknis Peristiwa Keamanan Sistem Informasi &bull; Referensi Insiden ID #{{ sprintf('%04d', $log->id) }}</p>
        </div>

        <!-- Auditor Formal Intro -->
        <div class="intro-paragraph">
            Laporan ini disusun secara formal berdasarkan temuan instrumen pengawasan keamanan siber pada server web Pineus Tilu. Dokumen ini memuat analisis rincian barang bukti forensik digital, identifikasi perangkat pengakses, serta petunjuk tindakan korektif bagi tim teknis pengelola sistem.
        </div>

        <!-- Section I: Incident Metadata -->
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
                <td>
                    <span class="severity-tag">
                        [ {{ $log->severity }} ]
                    </span>
                </td>
            </tr>
            <tr>
                <th>Identitas Pengguna Terkait</th>
                <td>{{ $log->user ? $log->user->name . ' (' . $log->user->email . ')' : 'Guest ()' }}</td>
            </tr>
        </table>

        <!-- Section II: Forensic Environment -->
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
                <td><span class="ref-code">SHA256: {{ $reportHash }}</span></td>
            </tr>
        </table>

        <!-- Section III: Technical Log Evidence -->
        <div class="section-header">III. BARANG BUKTI TEKNIS &amp; NARASI PERISTIWA (EVIDENCE NARRATIVE)</div>
        <div class="log-box">
            {{ $log->description }}
        </div>

        <!-- Section IV: Technical SOP Mitigation Steps -->
        <div class="section-header">IV. REKOMENDASI STRATEGI MITIGASI TEKNIS (TECHNICAL REMEDIATION PLAN)</div>
        <div class="mitigation-box">
            <h4>POIN LANGKAH TINDAKAN PERBAIKAN &amp; PENCEGAHAN:</h4>
            <ul>
                @if(in_array($log->event, ['bot_scraping_attempt', 'unauthorized_access']))
                    <li><strong>Pembatas Laju Request (Rate Limiting):</strong> Terapkan batasan maksimum 30 request/menit per alamat IP pada endpoint publik untuk menghentikan skrip scraping otomatis.</li>
                    <li><strong>Perlindungan Web Application Firewall (WAF):</strong> Aktifkan mode proteksi Cloudflare WAF JS Challenge serta masukan subnet IP pengakses ke dalam daftar blokir (IP Blacklist).</li>
                @elseif(in_array($log->event, ['idor_attempt']))
                    <li><strong>Pemeriksaan Otorisasi Sisi Server (Server-Side Authorization):</strong> Wajibkan verifikasi hak akses sebelum mengembalikan data reservasi menggunakan middleware otorisasi `$this->authorize('view', $booking)`.</li>
                    <li><strong>Migrasi Pengenal Unik (UUID Migration):</strong> Ganti format ID inkremental angka pada parameter URL dengan format UUID v4 untuk mencegah teknik tebak ID (Enumeration Attack).</li>
                @elseif(in_array($log->event, ['brute_force', 'login_failed']))
                    <li><strong>Kebijakan Penguncian Akun (Account Lockout Policy):</strong> Aktifkan penguncian akun otomatis selama 15 menit apabila terjadi 5 kali kegagalan login berturut-turut.</li>
                    <li><strong>Otentikasi Dua Faktor (MFA / 2FA):</strong> Wajibkan penggunaan aplikasi OTP Authenticator (TOTP) bagi seluruh pengguna dengan hak akses admin.</li>
                @elseif(in_array($log->event, ['csp_violation']))
                    <li><strong>Audit Kebijakan Keamanan Konten (CSP Policy Audit):</strong> Audit seluruh skrip eksternal pihak ketiga dan perketat arahan header CSP `script-src 'self'`.</li>
                @elseif(in_array($log->event, ['sql_injection_attempt']))
                    <li><strong>Penggunaan Query Terparameter (Prepared Statements):</strong> Pastikan seluruh kueri basis data menggunakan PDO Parameterized Queries atau Laravel Eloquent ORM secara konsisten.</li>
                @else
                    <li><strong>Pengawasan Kontinyu (Continuous Monitoring):</strong> Lakukan pemantauan catatan log aktivitas secara berkala serta lakukan pembaruan patch keamanan sistem secara rutin.</li>
                @endif
                <li><strong>Integritas Barang Bukti:</strong> Cadangkan catatan bukti forensik digital ini ke dalam repositori penyimpanan terisolasi secara periodik.</li>
            </ul>
        </div>

        <!-- Section V: Formal Signatures -->
        <div class="signature-section">
            <div style="font-size: 8.5pt; color: #000000; max-width: 380px;">
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