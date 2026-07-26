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
            font-family: 'Times New Roman', Times, serif;
            color: #000000;
            background-color: #e5e7eb;
            margin: 0;
            padding: 30px 15px;
            font-size: 11pt;
            line-height: 1.45;
            display: flex;
            justify-content: center;
        }

        /* Centered Realistic A4 Landscape Paper Sheet Preview */
        .a4-document-landscape {
            width: 297mm;
            min-height: 210mm;
            background-color: #ffffff;
            padding: 18mm 18mm 18mm 18mm;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            border: 1px solid #9ca3af;
            position: relative;
        }

        /* Kop Surat Formal Hitam-Putih Double Line */
        .kop-surat {
            border-bottom: 3px double #000000;
            padding-bottom: 10px;
            margin-bottom: 18px;
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
            margin-top: 3px;
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
            margin-bottom: 18px;
        }

        .doc-title-container h2 {
            font-size: 13pt;
            font-weight: bold;
            color: #000000;
            text-transform: uppercase;
            text-decoration: underline;
            margin: 0 0 4px 0;
            letter-spacing: 0.5px;
        }

        .doc-title-container p {
            font-size: 10pt;
            color: #000000;
            margin: 0;
        }

        /* Summary Grid */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-bottom: 18px;
        }

        .card {
            border: 1px solid #000000;
            padding: 8px 12px;
            background-color: #ffffff;
        }

        .card label {
            font-size: 9pt;
            font-weight: bold;
            color: #000000;
            text-transform: uppercase;
            display: block;
            margin-bottom: 2px;
        }

        .card .number {
            font-size: 16pt;
            font-weight: bold;
            color: #000000;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 9.5pt;
        }

        th {
            background-color: #ffffff;
            color: #000000;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 9pt;
            padding: 7px 8px;
            text-align: left;
            border: 1px solid #000000;
        }

        td {
            padding: 6px 8px;
            border: 1px solid #000000;
            color: #000000;
            vertical-align: top;
            background-color: #ffffff;
        }

        .severity-tag {
            font-weight: bold;
            text-transform: uppercase;
            border: 1px solid #000000;
            padding: 2px 5px;
            display: inline-block;
            font-size: 8.5pt;
            background-color: #ffffff;
            color: #000000;
        }

        /* SOP Mitigation Plan */
        .mitigation-box {
            border: 1px solid #000000;
            background-color: #ffffff;
            padding: 10px 14px;
            margin-top: 18px;
            page-break-inside: avoid;
        }

        .mitigation-box h4 {
            margin: 0 0 6px 0;
            font-size: 10pt;
            color: #000000;
            text-transform: uppercase;
            text-decoration: underline;
        }

        .mitigation-box ol {
            margin: 0;
            padding-left: 18px;
            color: #000000;
            font-size: 9.5pt;
        }

        .mitigation-box li {
            margin-bottom: 4px;
            text-align: justify;
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
            font-size: 9.5pt;
            font-weight: bold;
            color: #000000;
            text-transform: uppercase;
            margin-bottom: 35px;
        }

        .sig-box .name {
            font-size: 10.5pt;
            font-weight: bold;
            color: #000000;
            border-top: 1px solid #000000;
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
            Cetak / Simpan Dokumen SOP (PDF)
        </button>
    </div>

    <!-- Centered A4 Landscape Document Preview Container -->
    <div class="a4-document-landscape">

        <!-- Kop Surat Resmi -->
        <div class="kop-surat">
            <div>
                <div class="kop-brand">Tim Security Pineustilu</div>
                <div class="kop-sub">Standar Operasional Prosedur (SOP) Audit Keamanan Sistem &amp; Forensik Digital</div>
            </div>
            <div class="kop-meta">
                <div>Klasifikasi: <strong>RAHASIA / INTERNAL AUDIT</strong></div>
                <div style="margin-top: 4px;">Kode Registrasi Audit: <span class="ref-code">PT-SEC-{{ $reportHash }}</span></div>
            </div>
        </div>

        <!-- Title -->
        <div class="doc-title-container">
            <h2>LAPORAN REKAPITULASI AUDIT ANCAMAN KEAMANAN &amp; MITIGASI TEKNIS</h2>
            <p>Rekapitulasi Berkas Barang Bukti Insiden Keamanan Berkatagori Kritis &amp; Peringatan &bull; Diterbitkan Pada {{ now()->setTimezone('Asia/Jakarta')->format('d F Y - H:i:s') }} WIB</p>
        </div>

        <!-- Summary Grid -->
        <div class="summary-grid">
            <div class="summary-card total">
                <label>Total Insiden Evaluasi</label>
                <div class="number">{{ number_format($totalCount) }}</div>
            </div>
            <div class="summary-card critical">
                <label>Insiden Kritis (Critical)</label>
                <div class="number">{{ number_format($criticalCount) }}</div>
            </div>
            <div class="summary-card warning">
                <label>Peringatan Security (Warning)</label>
                <div class="number">{{ number_format($warningCount) }}</div>
            </div>
        </div>

        <!-- Forensic Table -->
        <h4 style="font-size: 10.5pt; font-weight: bold; color: #000000; text-transform: uppercase; margin: 10px 0 6px 0;">
            I. REKAPITULASI BARANG BUKTI ANCAMAN KEAMANAN SIBER
        </h4>

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
                    <th>DESKRIPSI NARASI EKSPLISIT BUKTI KEJADIAN</th>
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
                        <td>
                            <span class="severity-tag">
                                [ {{ $log->severity }} ]
                            </span>
                        </td>
                        <td>{{ $ipLocation }}</td>
                        <td>{{ $deviceInfo }}</td>
                        <td>{{ $log->user ? $log->user->name : 'Guest (Anonim)' }}</td>
                        <td>{{ $log->description }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="8" style="text-align: center; color: #000000; padding: 15px;">
                            Tidak ada catatan insiden ancaman keamanan (Critical / Warning) dalam basis data.
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>

        <!-- Technical Remediation Plan -->
        <div class="mitigation-box">
            <h4>II. PROSEDUR OPERASIONAL STANDAR (SOP) ANJURAN MITIGASI TEKNIS</h4>
            <ol>
                <li><strong>Penerapan Pembatasan Laju Request (Rate Limiting):</strong> Terapkan batasan maksimum 30 request per menit per alamat IP pada endpoint publik guna menghentikan aktivitas web scraping otomatis.</li>
                <li><strong>Pencegahan IDOR (Insecure Direct Object References):</strong> Wajibkan verifikasi hak akses pengguna pada controller `$this->authorize('view', $booking)` dan ganti ID publik dengan format UUID v4.</li>
                <li><strong>Mitigasi Brute Force:</strong> Enforce penguncian akun otomatis setelah 5 kali gagal login dan wajibkan penggunaan 2FA TOTP Authenticator.</li>
                <li><strong>Pencegahan SQL Injection &amp; XSS:</strong> Gunakan Prepared Statements (`PDO::prepare`) atau Laravel Eloquent ORM secara konsisten serta validasi header CSP.</li>
            </ol>
        </div>

        <!-- Footer Signatures -->
        <div class="signature-section">
            <div style="font-size: 8.5pt; color: #000000; max-width: 450px;">
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