<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOP Laporan Rekapitulasi Audit Keamanan - Pineus Tilu</title>
    <style>
        @page {
            size: A4 landscape;
            margin: 12mm;
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
            font-size: 10.5px;
            line-height: 1.5;
            display: flex;
            justify-content: center;
        }

        /* Centered A4 Landscape Paper Preview */
        .a4-document-landscape {
            width: 297mm;
            min-height: 210mm;
            background-color: #ffffff;
            padding: 18mm;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            position: relative;
        }

        /* Kop Surat - Clean Line */
        .kop-surat {
            border-bottom: 2px solid #111827;
            padding-bottom: 10px;
            margin-bottom: 18px;
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
            margin-bottom: 18px;
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
            font-size: 10px;
            color: #6b7280;
            margin: 0;
        }

        /* Summary Horizontal Cards */
        .summary-grid {
            display: flex;
            gap: 20px;
            margin-bottom: 18px;
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 12px;
        }

        .summary-item {
            font-size: 11px;
            color: #374151;
        }

        .summary-item label {
            font-size: 9px;
            font-weight: bold;
            color: #6b7280;
            text-transform: uppercase;
            display: block;
        }

        .summary-item .number {
            font-size: 15px;
            font-weight: bold;
            color: #111827;
        }

        /* Table Styling - Clean Lines */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 10px;
        }

        th {
            background-color: #f9fafb;
            color: #374151;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 9px;
            padding: 8px;
            text-align: left;
            border-bottom: 2px solid #111827;
        }

        td {
            padding: 7px 8px;
            border-bottom: 1px solid #e5e7eb;
            color: #111827;
            vertical-align: top;
        }

        /* Section Header */
        .section-header {
            font-size: 11px;
            font-weight: bold;
            color: #111827;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1.5px solid #111827;
            padding-bottom: 4px;
            margin: 20px 0 10px 0;
        }

        /* Mitigation List */
        .mitigation-list {
            margin: 0;
            padding-left: 20px;
            color: #111827;
            font-size: 10.5px;
        }

        .mitigation-list li {
            margin-bottom: 6px;
            text-align: justify;
        }

        /* Signatures Footer */
        .signature-section {
            margin-top: 30px;
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
            font-size: 9.5px;
            font-weight: bold;
            color: #374151;
            text-transform: uppercase;
            margin-bottom: 45px;
        }

        .sig-box .name {
            font-size: 11px;
            font-weight: bold;
            color: #111827;
            border-top: 1px solid #111827;
            padding-top: 4px;
        }

        .sig-box .role {
            font-size: 9px;
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

        @media print {
            body {
                background-color: #ffffff;
                padding: 0;
                display: block;
            }
            .a4-document-landscape {
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

    <!-- Action Bar -->
    <div class="action-bar">
        <button onclick="window.print()" class="btn-action">
            🖨️ Cetak / Simpan Laporan PDF
        </button>
    </div>

    <!-- Centered A4 Landscape Document Preview Container -->
    <div class="a4-document-landscape">

        <!-- Kop Surat -->
        <div class="kop-surat">
            <div>
                <div class="kop-brand">Tim Security Pineustilu</div>
                <div class="kop-sub">Standar Operasional Prosedur (SOP) Audit Keamanan Sistem &amp; Forensik Digital</div>
            </div>
            <div class="kop-meta">
                <div>Klasifikasi: <strong>RAHASIA / INTERNAL AUDIT</strong></div>
                <div style="margin-top: 3px;">Kode Referensi: <strong>PT-SEC-{{ $reportHash }}</strong></div>
            </div>
        </div>

        <!-- Title -->
        <div class="doc-title-container">
            <h2>LAPORAN REKAPITULASI AUDIT ANCAMAN KEAMANAN &amp; MITIGASI TEKNIS</h2>
            <p>Rekapitulasi Berkas Barang Bukti Insiden Keamanan Berkatagori Kritis &amp; Peringatan &bull; Diterbitkan Pada {{ now()->setTimezone('Asia/Jakarta')->format('d F Y - H:i:s') }} WIB</p>
        </div>

        <!-- Summary Horizontal Grid -->
        <div class="summary-grid">
            <div class="summary-item">
                <label>Total Insiden Evaluasi</label>
                <div class="number">{{ number_format($totalCount) }}</div>
            </div>
            <div class="summary-item">
                <label>Insiden Kritis (Critical)</label>
                <div class="number">{{ number_format($criticalCount) }}</div>
            </div>
            <div class="summary-item">
                <label>Peringatan Security (Warning)</label>
                <div class="number">{{ number_format($warningCount) }}</div>
            </div>
        </div>

        <!-- Forensic Table -->
        <div class="section-header">I. REKAPITULASI BARANG BUKTI ANCAMAN KEAMANAN SIBER</div>

        <table>
            <thead>
                <tr>
                    <th style="width: 25px;">NO</th>
                    <th style="width: 105px;">WAKTU (WIB)</th>
                    <th style="width: 130px;">KATEGORI INSIDEN</th>
                    <th style="width: 75px;">SEVERITY</th>
                    <th style="width: 150px;">IP ADDRESS &amp; WILAYAH</th>
                    <th style="width: 160px;">PERANGKAT &amp; BROWSER</th>
                    <th style="width: 100px;">USER TERKAIT</th>
                    <th>DESKRIPSI NARASI BUKTI KEJADIAN</th>
                </tr>
            </thead>
            <tbody>
                @forelse($logs as $index => $log)
                    @php
                        $deviceInfo = \App\Services\UserAgentParser::parsePlain(
                            preg_match('/User-Agent:\s*([^\)]+)/i', $log->description, $m) ? $m[1] : request()->header('User-Agent')
                        );
                        $ipLocation = \App\Services\UserAgentParser::formatIpPlain($log->ip_address);
                    @endphp
                    <tr>
                        <td style="text-align: center;">{{ $index + 1 }}</td>
                        <td style="font-weight: bold;">{{ $log->created_at->setTimezone('Asia/Jakarta')->format('d/m/Y H:i:s') }}</td>
                        <td><strong>{{ strtoupper(str_replace('_', ' ', $log->event)) }}</strong></td>
                        <td><strong>{{ $log->severity }}</strong></td>
                        <td>{{ $ipLocation }}</td>
                        <td>{{ $deviceInfo }}</td>
                        <td>{{ $log->user ? $log->user->name : 'Guest (Anonim)' }}</td>
                        <td>{{ $log->description }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="8" style="text-align: center; color: #6b7280; padding: 15px;">
                            Tidak ada catatan insiden ancaman keamanan (Critical / Warning) dalam basis data.
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>

        <!-- Technical Remediation Plan -->
        <div class="section-header">II. PROSEDUR OPERASIONAL STANDAR (SOP) ANJURAN MITIGASI TEKNIS</div>
        <ul class="mitigation-list">
            <li><strong>Penanganan Web Scraping:</strong> Aktifkan proteksi throttling IP Rate Limiting (maksimum 30 request/menit) dan tantangan Cloudflare WAF JS Challenge.</li>
            <li><strong>Pencegahan IDOR (Insecure Direct Object References):</strong> Wajibkan pengecekan otorisasi pengguna pada controller <code>$this-&gt;authorize('view', $booking)</code> dan ganti ID publik dengan UUID v4.</li>
            <li><strong>Mitigasi Brute Force:</strong> Enforce penguncian akun otomatis setelah 5 kali gagal login dan wajibkan penggunaan 2FA TOTP Authenticator.</li>
            <li><strong>Pencegahan SQL Injection &amp; XSS:</strong> Gunakan Prepared Statements (<code>PDO::prepare</code>) atau Laravel Eloquent ORM secara konsisten serta validasi header CSP.</li>
        </ul>

        <!-- Footer Signatures -->
        <div class="signature-section">
            <div style="font-size: 8.5pt; color: #6b7280; max-width: 450px;">
                Dokumen rekapitulasi SOP ini diterbitkan secara sah oleh <strong>Tim Security Pineustilu</strong> dan berlaku sebagai lampiran resmi audit keamanan sistem informasi.
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