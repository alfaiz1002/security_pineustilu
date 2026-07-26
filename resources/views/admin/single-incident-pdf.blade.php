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
            font-family: 'Segoe UI', Arial, sans-serif;
            color: #1e293b;
            background-color: #f1f5f9;
            margin: 0;
            padding: 30px 15px;
            font-size: 11.5px;
            line-height: 1.5;
            display: flex;
            justify-content: center;
        }

        /* Centered Realistic A4 Paper Sheet Preview */
        .a4-document {
            width: 210mm;
            min-height: 297mm;
            background-color: #ffffff;
            padding: 22mm 20mm 20mm 20mm;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border-radius: 2px;
            border: 1px solid #cbd5e1;
            position: relative;
        }

        /* Letterhead / Kop Surat Resmi */
        .kop-surat {
            border-bottom: 3px double #0f172a;
            padding-bottom: 12px;
            margin-bottom: 18px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        .kop-brand {
            font-size: 15px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .kop-sub {
            font-size: 10px;
            color: #475569;
            margin-top: 3px;
        }

        .kop-meta {
            text-align: right;
            font-size: 9.5px;
            color: #64748b;
        }

        .ref-code {
            font-family: monospace;
            background-color: #f8fafc;
            border: 1px solid #cbd5e1;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 9.5px;
            color: #0f172a;
            font-weight: 600;
        }

        /* Document Header Title */
        .doc-title-container {
            text-align: center;
            margin-bottom: 18px;
        }

        .doc-title-container h2 {
            font-size: 14px;
            font-weight: 800;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin: 0 0 4px 0;
        }

        .doc-title-container p {
            font-size: 10.5px;
            color: #64748b;
            margin: 0;
        }

        /* Auditor Intro Box */
        .intro-paragraph {
            background-color: #f8fafc;
            border-left: 3.5px solid #2563eb;
            padding: 10px 14px;
            font-size: 10.5px;
            color: #334155;
            margin-bottom: 16px;
            border-radius: 0 4px 4px 0;
        }

        /* Section Title */
        .section-header {
            font-size: 11px;
            font-weight: 800;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1.5px solid #e2e8f0;
            padding-bottom: 4px;
            margin: 16px 0 10px 0;
        }

        /* Detailed Tables */
        .info-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 12px;
            font-size: 10.5px;
        }

        .info-table th {
            background-color: #f1f5f9;
            color: #334155;
            font-weight: 700;
            text-align: left;
            padding: 7px 10px;
            width: 32%;
            border: 1px solid #cbd5e1;
            font-size: 10px;
            text-transform: uppercase;
        }

        .info-table td {
            padding: 7px 10px;
            border: 1px solid #cbd5e1;
            color: #0f172a;
            vertical-align: top;
        }

        /* Badges */
        .badge-severity {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 3px;
            font-size: 9.5px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        .severity-CRITICAL {
            background-color: #fee2e2;
            color: #991b1b;
            border: 1px solid #f87171;
        }

        .severity-WARNING {
            background-color: #fef3c7;
            color: #92400e;
            border: 1px solid #fbbf24;
        }

        /* Description / Log Narrative Box */
        .log-box {
            border: 1px solid #cbd5e1;
            background-color: #fafafa;
            border-radius: 4px;
            padding: 12px;
            font-size: 10.5px;
            color: #1e293b;
            font-family: 'Courier New', Courier, monospace;
            line-height: 1.5;
            margin-bottom: 16px;
        }

        /* Technical Mitigation Section */
        .mitigation-box {
            border: 1px solid #94a3b8;
            background-color: #f8fafc;
            border-radius: 4px;
            padding: 12px 14px;
            margin-bottom: 20px;
        }

        .mitigation-box h4 {
            margin: 0 0 8px 0;
            font-size: 11px;
            color: #0f172a;
            text-transform: uppercase;
        }

        .mitigation-box ul {
            margin: 0;
            padding-left: 18px;
            color: #334155;
            font-size: 10.5px;
        }

        .mitigation-box li {
            margin-bottom: 6px;
        }

        /* Formal Signatures Footer */
        .signature-section {
            margin-top: 35px;
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
            font-size: 10px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            margin-bottom: 45px;
        }

        .sig-box .name {
            font-size: 11px;
            font-weight: 800;
            color: #0f172a;
            border-top: 1px dotted #94a3b8;
            padding-top: 4px;
        }

        .sig-box .role {
            font-size: 9px;
            color: #64748b;
        }

        /* Floating Top Action Bar */
        .action-bar {
            position: fixed;
            top: 15px;
            right: 25px;
            z-index: 9999;
            display: flex;
            gap: 10px;
        }

        .btn-action {
            background-color: #0f172a;
            color: #ffffff;
            border: 1px solid #334155;
            padding: 8px 16px;
            font-size: 12px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-action:hover {
            background-color: #1e293b;
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

    <!-- Floating Print / Save Action Bar -->
    <div class="action-bar">
        <button onclick="window.print()" class="btn-action">
            🖨️ Cetak / Simpan Laporan PDF
        </button>
    </div>

    <!-- Centered A4 Paper Sheet Preview Container -->
    <div class="a4-document">

        <!-- Kop Surat Resmi Instansi -->
        <div class="kop-surat">
            <div>
                <div class="kop-brand">Tim Security Pineustilu</div>
            </div>
            <div class="kop-meta">
                <div>Klasifikasi: <strong>RAHASIA INTERNAL AUDIT</strong></div>
                <div style="margin-top: 3px;">Nomor Dokumen: <span
                        class="ref-code">AUDIT-SEC/2026/PT/{{ sprintf('%04d', $log->id) }}</span></div>
            </div>
        </div>

        <!-- Document Title -->
        <div class="doc-title-container">
            <h2>BERKAS EVALUASI INSIDEN KEAMANAN & REKOMENDASI MITIGASI</h2>
            <p>Laporan Penilaian Teknis Peristiwa Keamanan Sistem Informasi &bull; Referensi Insiden ID
                #{{ sprintf('%04d', $log->id) }}</p>
        </div>

        <!-- Auditor Formal Intro -->
        <div class="intro-paragraph">
            Laporan ini disusun secara formal berdasarkan temuan instrumen pengawasan keamanan siber pada server web
            Pineus Tilu. Dokumen ini memuat analisis rincian barang bukti forensik digital, identifikasi perangkat
            pengakses, serta petunjuk tindakan korektif bagi tim teknis pengelola sistem.
        </div>

        <!-- Section 1: Incident Identity -->
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
                    <span class="badge-severity severity-{{ $log->severity }}">
                        {{ $log->severity }}
                    </span>
                </td>
            </tr>
            <tr>
                <th>Identitas Pengguna Terkait</th>
                <td>{{ $log->user ? $log->user->name . ' (' . $log->user->email . ')' : 'Pengunjung Anonim / Tidak Terautentikasi (Guest)' }}
                </td>
            </tr>
        </table>

        <!-- Section 2: Forensic Environment -->
        <div class="section-header">II. LINGKUNGAN FORENSIK & REKAM PERANGKAT PENGAKSES</div>
        <table class="info-table">
            <tr>
                <th>Alamat IP &amp; Lokasi Geografis</th>
                <td>{{ \App\Services\UserAgentParser::formatIp($log->ip_address) }}</td>
            </tr>
            <tr>
                <th>Perangkat &amp; Browser Engine</th>
                <td>{{ \App\Services\UserAgentParser::parse(preg_match('/User-Agent:\s*([^\)]+)/i', $log->description, $m) ? $m[1] : request()->header('User-Agent')) }}
                </td>
            </tr>
            <tr>
                <th>Hash Integritas Dokumen</th>
                <td><span class="ref-code">SHA256: {{ $reportHash }}</span></td>
            </tr>
        </table>

        <!-- Section 3: Technical Narrative Log -->
        <div class="section-header">III. BARANG BUKTI TEKNIS &amp; NARASI PERISTIWA (EVIDENCE NARRATIVE)</div>
        <div class="log-box">
            {{ $log->description }}
        </div>

        <!-- Section 4: Technical Remediation Steps -->
        <div class="section-header">IV. REKOMENDASI STRATEGI MITIGASI TEKNIS (TECHNICAL REMEDIATION PLAN)</div>
        <div class="mitigation-box">
            <h4>Poin Langkah Tindakan Perbaikan &amp; Pencegahan:</h4>
            <ul>
                @if(in_array($log->event, ['bot_scraping_attempt', 'unauthorized_access']))
                    <li><strong>Pembatas Laju Request (Rate Limiting):</strong> Terapkan batasan maksimum 30 request/menit
                        per alamat IP pada endpoint publik untuk menghentikan skrip scraping otomatis.</li>
                    <li><strong>Perlindungan Web Application Firewall (WAF):</strong> Aktifkan mode proteksi Cloudflare WAF
                        JS Challenge serta masukan subnet IP pengakses ke dalam daftar blokir (IP Blacklist).</li>
                @elseif(in_array($log->event, ['idor_attempt']))
                    <li><strong>Pemeriksaan Otorisasi Sisi Server (Server-Side Authorization):</strong> Wajibkan verifikasi
                        hak akses sebelum mengembalikan data reservasi menggunakan middleware otorisasi
                        `$this->authorize('view', $booking)`.</li>
                    <li><strong>Migrasi Pengenal Unik (UUID Migration):</strong> Ganti format ID inkremental angka pada
                        parameter URL dengan format UUID v4 untuk mencegah teknik tebak ID (Enumeration Attack).</li>
                @elseif(in_array($log->event, ['brute_force', 'login_failed']))
                    <li><strong>Kebijakan Penguncian Akun (Account Lockout Policy):</strong> Aktifkan penguncian akun
                        otomatis selama 15 menit apabila terjadi 5 kali kegagalan login berturut-turut.</li>
                    <li><strong>Otentikasi Dua Faktor (MFA / 2FA):</strong> Wajibkan penggunaan aplikasi OTP Authenticator
                        (TOTP) bagi seluruh pengguna dengan hak akses admin.</li>
                @elseif(in_array($log->event, ['csp_violation']))
                    <li><strong>Audit Kebijakan Keamanan Konten (CSP Policy Audit):</strong> Audit seluruh skrip eksternal
                        pihak ketiga dan perketat arahan header CSP `script-src 'self'`.</li>
                @elseif(in_array($log->event, ['sql_injection_attempt']))
                    <li><strong>Penggunaan Query Terparameter (Prepared Statements):</strong> Pastikan seluruh kueri basis
                        data menggunakan PDO Parameterized Queries atau Laravel Eloquent ORM secara konsisten.</li>
                @else
                    <li><strong>Pengawasan Kontinyu (Continuous Monitoring):</strong> Lakukan pemantauan catatan log
                        aktivitas secara berkala serta lakukan pembaruan patch keamanan sistem secara rutin.</li>
                @endif
                <li><strong>Integritas Barang Bukti:</strong> Cadangkan catatan bukti forensik digital ini ke dalam
                    repositori penyimpanan terisolasi secara periodik.</li>
            </ul>
        </div>

        <!-- Section 5: Formal Signatures -->
        <div class="signature-section">
            <div style="font-size: 9px; color: #64748b; max-width: 380px;">
                * Berkas evaluasi ini diterbitkan oleh <strong>Tim Auditor Keamanan Siber Pineus Tilu Web</strong>.<br>
                Seluruh catatan di atas terverifikasi secara sah dan dapat dipergunakan sebagai lampiran laporan resmi
                audit keamanan sistem informasi.
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