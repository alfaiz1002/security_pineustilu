<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Forensik Keamanan & Mitigasi Insiden - Pineus Tilu Web</title>
    <style>
        @page {
            size: A4 landscape;
            margin: 12mm 15mm 15mm 15mm;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #0f172a;
            background-color: #ffffff;
            margin: 0;
            padding: 10px 20px;
            font-size: 10.5px;
            line-height: 1.45;
        }

        /* Corporate Header Layout */
        .doc-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            border-bottom: 2.5px solid #0f172a;
            padding-bottom: 10px;
            margin-bottom: 14px;
        }

        .company-brand {
            font-size: 16px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: 0.8px;
            text-transform: uppercase;
        }

        .sub-brand {
            font-size: 10px;
            color: #475569;
            font-weight: 600;
            margin-top: 2px;
        }

        .doc-title {
            font-size: 14px;
            font-weight: 700;
            color: #1e293b;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 6px;
        }

        .meta-box {
            text-align: right;
            font-size: 9.5px;
            color: #475569;
        }

        .confidential-tag {
            display: inline-block;
            background-color: #7f1d1d;
            color: #ffffff;
            font-weight: bold;
            font-size: 8.5px;
            padding: 2px 6px;
            border-radius: 2px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 4px;
        }

        .hash-code {
            font-family: 'Courier New', Courier, monospace;
            background-color: #f1f5f9;
            border: 1px solid #cbd5e1;
            padding: 2px 5px;
            font-size: 9px;
            color: #334155;
            border-radius: 3px;
        }

        /* Summary Cards */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-bottom: 14px;
        }

        .card {
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            padding: 8px 12px;
            background-color: #f8fafc;
        }

        .card.critical { border-left: 4px solid #dc2626; }
        .card.warning { border-left: 4px solid #d97706; }
        .card.info { border-left: 4px solid #16a34a; }
        .card.total { border-left: 4px solid #2563eb; }

        .card label {
            font-size: 8.5px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            display: block;
            margin-bottom: 2px;
        }

        .card .number {
            font-size: 16px;
            font-weight: 800;
            color: #0f172a;
        }

        /* Tables */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 8px;
            font-size: 9.5px;
        }

        th {
            background-color: #1e293b;
            color: #ffffff;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 8.5px;
            padding: 6px 8px;
            text-align: left;
            letter-spacing: 0.3px;
            border: 1px solid #1e293b;
        }

        td {
            padding: 6px 8px;
            border: 1px solid #e2e8f0;
            vertical-align: top;
        }

        tr:nth-child(even) td {
            background-color: #f8fafc;
        }

        /* Badges */
        .badge {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 8.5px;
            font-weight: 700;
            text-transform: uppercase;
        }

        .badge-CRITICAL { background-color: #fee2e2; color: #991b1b; border: 1px solid #f87171; }
        .badge-WARNING { background-color: #fef3c7; color: #92400e; border: 1px solid #fbbf24; }
        .badge-INFO { background-color: #dcfce7; color: #166534; border: 1px solid #4ade80; }

        /* Mitigation Box */
        .mitigation-section {
            margin-top: 14px;
            border: 1px solid #94a3b8;
            border-radius: 4px;
            background-color: #f1f5f9;
            padding: 10px 12px;
            page-break-inside: avoid;
        }

        .mitigation-title {
            font-size: 10px;
            font-weight: 800;
            color: #0f172a;
            text-transform: uppercase;
            margin-bottom: 6px;
            border-bottom: 1px solid #cbd5e1;
            padding-bottom: 4px;
        }

        .mitigation-list {
            margin: 0;
            padding-left: 18px;
            font-size: 9.5px;
            color: #334155;
        }

        .mitigation-list li {
            margin-bottom: 4px;
        }

        /* Signatures Footer */
        .footer-signatures {
            margin-top: 20px;
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
            font-size: 9px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            margin-bottom: 40px;
        }

        .sig-box .name {
            font-size: 10px;
            font-weight: 700;
            color: #0f172a;
            border-top: 1px solid #94a3b8;
            padding-top: 4px;
        }

        .sig-box .role {
            font-size: 8.5px;
            color: #64748b;
        }

        .print-btn-bar {
            position: fixed;
            top: 12px;
            right: 15px;
            z-index: 9999;
        }

        .btn-print {
            background-color: #0f172a;
            color: #ffffff;
            border: 1px solid #334155;
            padding: 6px 14px;
            font-size: 11px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0,0,0,0.15);
        }

        @media print {
            .print-btn-bar { display: none !important; }
            body { padding: 0; }
        }
    </style>
</head>
<body>

    <div class="print-btn-bar">
        <button onclick="window.print()" class="btn-print">Cetak / Simpan PDF Laporan</button>
    </div>

    <!-- Header Section -->
    <div class="doc-header">
        <div>
            <div class="company-brand">Pineus Tilu Cybersecurity & Digital Forensics Unit</div>
            <div class="sub-brand">Standar Laporan Audit Keamanan Sistem & Mitigasi Insiden (ISO/IEC 27001 & NIST SP 800-61)</div>
            <div class="doc-title">Laporan Forensik Insiden Keamanan Sistem</div>
        </div>
        <div class="meta-box">
            <div><span class="confidential-tag">CONFIDENTIAL // INTERNAL AUDIT</span></div>
            <div style="margin-top: 3px;">Tanggal Terbit: <strong>{{ now()->setTimezone('Asia/Jakarta')->format('d F Y, H:i:s \W\I\B') }}</strong></div>
            <div style="margin-top: 3px;">Kode Referensi: <span class="hash-code">PT-SEC-{{ $reportHash }}</span></div>
        </div>
    </div>

    <!-- Summary Grid -->
    <div class="summary-grid">
        <div class="summary-card total">
            <label>Total Bukti Log Evaluasi</label>
            <div class="number">{{ number_format($totalCount) }}</div>
        </div>
        <div class="summary-card critical">
            <label>Insiden Kritis (Critical)</label>
            <div class="number" style="color: #dc2626;">{{ number_format($criticalCount) }}</div>
        </div>
        <div class="summary-card warning">
            <label>Peringatan Keamanan (Warning)</label>
            <div class="number" style="color: #d97706;">{{ number_format($warningCount) }}</div>
        </div>
        <div class="summary-card info">
            <label>Aktivitas Terverifikasi (Info)</label>
            <div class="number" style="color: #16a34a;">{{ number_format($infoCount) }}</div>
        </div>
    </div>

    <!-- Evidence Table -->
    <h4 style="font-size: 11px; font-weight: 700; color: #0f172a; text-transform: uppercase; margin: 10px 0 6px 0;">
        I. REKAPITULASI BARANG BUKTI FORENSIK DIGITAL (DIGITAL EVIDENCE RECORDS)
    </h4>

    <table>
        <thead>
            <tr>
                <th style="width: 25px;">NO</th>
                <th style="width: 105px;">WAKTU (WIB)</th>
                <th style="width: 130px;">KATEGORI INSIDEN</th>
                <th style="width: 65px;">SEVERITY</th>
                <th style="width: 150px;">IP ADDRESS & LOKASI</th>
                <th style="width: 160px;">PERANGKAT & BROWSER</th>
                <th style="width: 100px;">IDENTITAS USER</th>
                <th>NARASI BUKTI FORENSIK KEJADIAN</th>
            </tr>
        </thead>
        <tbody>
            @forelse($logs as $index => $log)
                @php
                    $deviceInfo = \App\Services\UserAgentParser::parse(
                        preg_match('/User-Agent:\s*([^\)]+)/i', $log->description, $m) ? $m[1] : request()->header('User-Agent')
                    );
                    $ipLocation = \App\Services\UserAgentParser::formatIp($log->ip_address);
                @endphp
                <tr>
                    <td style="text-align: center;">{{ $index + 1 }}</td>
                    <td style="font-weight: 600;">{{ $log->created_at->setTimezone('Asia/Jakarta')->format('d/m/Y H:i:s') }}</td>
                    <td><strong>{{ ucfirst(str_replace('_', ' ', $log->event)) }}</strong></td>
                    <td>
                        <span class="badge badge-{{ $log->severity }}">
                            {{ $log->severity }}
                        </span>
                    </td>
                    <td>{{ $ipLocation }}</td>
                    <td>{{ $deviceInfo }}</td>
                    <td>{{ $log->user ? $log->user->name : 'Guest (Anonim)' }}</td>
                    <td>{{ $log->description }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="8" style="text-align: center; color: #64748b; padding: 15px;">
                        Tidak ada log barang bukti insiden yang tercatat dalam database.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <!-- Technical Mitigation & Remediation Section -->
    <div class="mitigation-section">
        <div class="mitigation-title">
            II. REKOMENDASI PENCEGAHAN & STRATEGI MITIGASI TEKNIS ANCAMAN (REMEDIATION PLAN)
        </div>
        <ol class="mitigation-list">
            <li><strong>Mitigasi Web Scraping & Bot Attacks:</strong> Terapkan pembatasan laju HTTP Request (IP Rate Limiting max 30 req/menit), aktifkan tantangan JavaScript WAF Cloudflare, serta blokir otomatis alamat IP subnet penyerang.</li>
            <li><strong>Pencegahan IDOR (Insecure Direct Object References):</strong> Terapkan pengecekan otorisasi ketat di sisi server (Server-Side Authorization Check `$this->authorize()`), dan gunakan format UUID v4 sebagai pengenal unik resource alih-alih ID angka inkremental.</li>
            <li><strong>Mitigasi Brute Force & Credential Stuffing:</strong> Terapkan penguncian akun otomatis (Account Lockout Policy) setelah 5 kali gagal login berturut-turut, serta wajibkan Otentikasi Dua Faktor (TOTP 2FA) untuk seluruh akun admin.</li>
            <li><strong>Pencegahan SQL Injection & Cross-Site Scripting (XSS):</strong> Wajibkan penggunaan Prepared Statements (`PDO::prepare`) atau Laravel Eloquent ORM secara konsisten, serta terapkan pembersihan sanitasi input dan Content Security Policy (CSP).</li>
            <li><strong>Pencegahan Akses File Sensitif:</strong> Simpan seluruh dokumen privat di luar folder direktori publik `public_html` (Gunakan Laravel Private Storage `storage/app/private`) dan terapkan Signed Access URLs bertenggat waktu.</li>
        </ol>
    </div>

    <!-- Signatures Footer -->
    <div class="footer-signatures">
        <div style="font-size: 8.5px; color: #64748b; max-width: 400px;">
            Dokumen ini diterbitkan oleh <strong>Tim Auditor Keamanan Siber Pineus Tilu</strong>.<br>
            Seluruh data bukti forensik di atas terverifikasi integritasnya dan dapat digunakan sebagai berkas evaluasi keamanan resmi.
        </div>

        <div class="sig-box">
            <div class="title">Disetujui Oleh Auditor Keamanan</div>
            <div style="height: 35px;"></div>
            <div class="name">Tim Security Capstone Design</div>
            <div class="role">Lead Digital Forensic & Incident Response</div>
        </div>
    </div>

</body>
</html>
