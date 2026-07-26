<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Rekapitulasi Audit Keamanan & Mitigasi - Pineus Tilu</title>
    <style>
        @page {
            size: A4 landscape;
            margin: 12mm;
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
            font-size: 10.5px;
            line-height: 1.45;
            display: flex;
            justify-content: center;
        }

        /* Centered Realistic A4 Paper Sheet Preview Container */
        .a4-document-landscape {
            width: 297mm;
            min-height: 210mm;
            background-color: #ffffff;
            padding: 18mm 18mm 18mm 18mm;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border-radius: 2px;
            border: 1px solid #cbd5e1;
            position: relative;
        }

        /* Kop Surat Resmi Instansi */
        .kop-surat {
            border-bottom: 3px double #0f172a;
            padding-bottom: 10px;
            margin-bottom: 16px;
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
            margin-top: 2px;
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
            margin-bottom: 16px;
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

        /* Summary Cards Grid */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            margin-bottom: 16px;
        }

        .card {
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            padding: 8px 12px;
            background-color: #f8fafc;
        }

        .card.critical { border-left: 4px solid #dc2626; background-color: #fef2f2; }
        .card.warning { border-left: 4px solid #d97706; background-color: #fffbeb; }
        .card.info { border-left: 4px solid #16a34a; background-color: #f0fdf4; }
        .card.total { border-left: 4px solid #2563eb; background-color: #eff6ff; }

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

        /* Table Styling */
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

        .badge-severity {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 8.5px;
            font-weight: 700;
            text-transform: uppercase;
        }

        .severity-CRITICAL { background-color: #fee2e2; color: #991b1b; border: 1px solid #f87171; }
        .severity-WARNING { background-color: #fef3c7; color: #92400e; border: 1px solid #fbbf24; }

        /* Technical Mitigation Section */
        .mitigation-box {
            border: 1px solid #94a3b8;
            background-color: #f8fafc;
            border-radius: 4px;
            padding: 10px 12px;
            margin-top: 16px;
            page-break-inside: avoid;
        }

        .mitigation-box h4 {
            margin: 0 0 6px 0;
            font-size: 10px;
            color: #0f172a;
            text-transform: uppercase;
        }

        .mitigation-box ul {
            margin: 0;
            padding-left: 18px;
            color: #334155;
            font-size: 9.5px;
        }

        .mitigation-box li {
            margin-bottom: 4px;
        }

        /* Signatures Footer */
        .signature-section {
            margin-top: 25px;
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
            margin-bottom: 35px;
        }

        .sig-box .name {
            font-size: 10.5px;
            font-weight: 800;
            color: #0f172a;
            border-top: 1px dotted #94a3b8;
            padding-top: 4px;
        }

        /* Floating Action Bar */
        .action-bar {
            position: fixed;
            top: 15px;
            right: 25px;
            z-index: 9999;
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
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        @media print {
            body {
                background-color: #ffffff;
                padding: 0;
                display: block;
            }
            .a4-document-landscape {
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

    <!-- Action Bar -->
    <div class="action-bar">
        <button onclick="window.print()" class="btn-action">
            🖨️ Cetak / Simpan Laporan PDF
        </button>
    </div>

    <!-- Centered A4 Landscape Document Preview Container -->
    <div class="a4-document-landscape">

        <!-- Kop Surat Resmi -->
        <div class="kop-surat">
            <div>
                <div class="kop-brand">Tim Keamanan Siber &amp; Digital Forensik Pineus Tilu</div>
                <div class="kop-sub">Sistem Informasi Reservasi Wisata &bull; Universitas Telkom / Pineus Tilu Web</div>
            </div>
            <div class="kop-meta">
                <div>Klasifikasi: <strong>RAHASIA INTERNAL AUDIT</strong></div>
                <div style="margin-top: 3px;">Kode Referensi Audit: <span class="ref-code">PT-SEC-{{ $reportHash }}</span></div>
            </div>
        </div>

        <!-- Title -->
        <div class="doc-title-container">
            <h2>LAPORAN REKAPITULASI AUDIT ANCAMAN KEAMANAN &amp; MITIGASI TEKNIS</h2>
            <p>Rekapitulasi Barang Bukti Insiden Keamanan Berkatagori Kritis &amp; Peringatan &bull; Diterbitkan Pada {{ now()->setTimezone('Asia/Jakarta')->format('d F Y, H:i:s \W\I\B') }}</p>
        </div>

        <!-- Summary Grid -->
        <div class="summary-grid">
            <div class="summary-card total">
                <label>Total Insiden Evaluasi</label>
                <div class="number">{{ number_format($totalCount) }}</div>
            </div>
            <div class="summary-card critical">
                <label>Insiden Kritis (Critical)</label>
                <div class="number" style="color: #dc2626;">{{ number_format($criticalCount) }}</div>
            </div>
            <div class="summary-card warning">
                <label>Peringatan Security (Warning)</label>
                <div class="number" style="color: #d97706;">{{ number_format($warningCount) }}</div>
            </div>
            <div class="summary-card info">
                <label>Status Sistem</label>
                <div class="number" style="color: #16a34a; font-size: 13px;">MONITORED</div>
            </div>
        </div>

        <!-- Forensic Table -->
        <h4 style="font-size: 11px; font-weight: 800; color: #0f172a; text-transform: uppercase; margin: 10px 0 6px 0;">
            I. REKAPITULASI BARANG BUKTI ANCAMAN KEAMANAN (DIGITAL FORENSIC ANOMALY RECORDS)
        </h4>

        <table>
            <thead>
                <tr>
                    <th style="width: 25px;">NO</th>
                    <th style="width: 105px;">WAKTU (WIB)</th>
                    <th style="width: 130px;">KATEGORI INSIDEN</th>
                    <th style="width: 65px;">SEVERITY</th>
                    <th style="width: 150px;">IP ADDRESS &amp; LOKASI</th>
                    <th style="width: 160px;">PERANGKAT &amp; BROWSER</th>
                    <th style="width: 100px;">USER TERKAIT</th>
                    <th>DESKRIPSI NARASI BUKTI KEJADIAN</th>
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
                            <span class="badge-severity severity-{{ $log->severity }}">
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
                            Tidak ada catatan ancaman keamanan (Critical / Warning) dalam database.
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>

        <!-- Technical Remediation Plan -->
        <div class="mitigation-box">
            <h4>II. REKOMENDASI ANJURAN MITIGASI TEKNIS &amp; PENCEGAHAN ANCAMAN SIBER</h4>
            <ul>
                <li><strong>Penanganan Web Scraping:</strong> Aktifkan proteksi throttling IP Rate Limiting (maksimum 30 request/menit) dan tantangan Cloudflare WAF JS Challenge.</li>
                <li><strong>Pencegahan IDOR (Insecure Direct Object References):</strong> Wajibkan pengecekan otorisasi pengguna pada controller `$this->authorize('view', $booking)` dan ganti ID publik dengan UUID v4.</li>
                <li><strong>Mitigasi Brute Force:</strong> Enforce penguncian akun otomatis setelah 5 kali gagal login dan wajibkan penggunaan 2FA TOTP Authenticator.</li>
                <li><strong>Pencegahan SQL Injection &amp; XSS:</strong> Gunakan Prepared Statements (`PDO::prepare`) atau Laravel Eloquent ORM secara konsisten serta validasi header CSP.</li>
            </ul>
        </div>

        <!-- Footer Signatures -->
        <div class="signature-section">
            <div style="font-size: 8.5px; color: #64748b; max-width: 450px;">
                Dokumen rekapitulasi ini diterbitkan oleh <strong>Tim Auditor Keamanan Siber Pineus Tilu</strong>.<br>
                Seluruh catatan insiden di atas divalidasi secara sah dan dapat dipergunakan sebagai lampiran laporan resmi audit keamanan sistem informasi.
            </div>

            <div class="sig-box">
                <div class="title">Disetujui Oleh Tim Auditor</div>
                <div class="name">Tim Security Capstone Design</div>
            </div>
        </div>

    </div>

</body>
</html>
