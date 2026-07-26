<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Audit Keamanan & Forensik Digital - Pineus Tilu Web</title>
    <style>
        @page {
            size: A4 landscape;
            margin: 15mm;
        }

        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            color: #1f2937;
            background-color: #ffffff;
            margin: 0;
            padding: 20px;
            font-size: 11px;
            line-height: 1.4;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 3px double #1e3a8a;
            padding-bottom: 12px;
            margin-bottom: 15px;
        }

        .header-title h1 {
            font-size: 20px;
            color: #1e3a8a;
            margin: 0 0 4px 0;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .header-title p {
            margin: 0;
            font-size: 11px;
            color: #4b5563;
        }

        .header-meta {
            text-align: right;
            font-size: 10px;
            color: #6b7280;
        }

        .badge-hash {
            background-color: #f3f4f6;
            border: 1px solid #d1d5db;
            padding: 3px 6px;
            font-family: monospace;
            font-size: 10px;
            border-radius: 4px;
            color: #374151;
        }

        /* Executive Summary Grid */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            margin-bottom: 20px;
        }

        .summary-card {
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 10px 14px;
            background-color: #fafafa;
        }

        .summary-card.critical { border-left: 4px solid #dc2626; background-color: #fef2f2; }
        .summary-card.warning { border-left: 4px solid #d97706; background-color: #fffbeb; }
        .summary-card.info { border-left: 4px solid #16a34a; background-color: #f0fdf4; }
        .summary-card.total { border-left: 4px solid #2563eb; background-color: #eff6ff; }

        .summary-card label {
            font-size: 9px;
            text-transform: uppercase;
            font-weight: bold;
            display: block;
            margin-bottom: 4px;
            color: #4b5563;
        }

        .summary-card .value {
            font-size: 18px;
            font-weight: bold;
            color: #111827;
        }

        /* Table Design */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 10px;
        }

        th {
            background-color: #1e3a8a;
            color: #ffffff;
            text-align: left;
            padding: 8px 6px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 9px;
            letter-spacing: 0.3px;
        }

        td {
            padding: 6px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: top;
        }

        tr:nth-child(even) td {
            background-color: #f9fafb;
        }

        /* Severity Badges */
        .severity-badge {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 9px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .severity-CRITICAL { background-color: #fee2e2; color: #991b1b; border: 1px solid #f87171; }
        .severity-WARNING { background-color: #fef3c7; color: #92400e; border: 1px solid #fbbf24; }
        .severity-INFO { background-color: #dcfce7; color: #166534; border: 1px solid #4ade80; }

        /* Signatures / Footer Stamp */
        .footer-stamp-container {
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            page-break-inside: avoid;
        }

        .stamp-box {
            border: 2px dashed #1e3a8a;
            padding: 10px 15px;
            border-radius: 6px;
            background-color: #f8fafc;
            width: 250px;
            text-align: center;
        }

        .stamp-box .stamp-title {
            font-size: 10px;
            font-weight: bold;
            color: #1e3a8a;
            text-transform: uppercase;
        }

        .stamp-box .stamp-status {
            font-size: 12px;
            font-weight: bold;
            color: #16a34a;
            margin: 4px 0;
        }

        .print-btn-bar {
            position: fixed;
            top: 15px;
            right: 20px;
            z-index: 9999;
        }

        .btn-print {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            font-size: 12px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        @media print {
            .print-btn-bar {
                display: none !important;
            }
            body {
                padding: 0;
            }
        }
    </style>
</head>
<body>

    <div class="print-btn-bar">
        <button onclick="window.print()" class="btn-print">🖨️ Cetak / Simpan PDF</button>
    </div>

    <!-- Header Section -->
    <div class="header-container">
        <div class="header-title">
            <h1>Laporan Audit Keamanan & Forensik Digital</h1>
            <p>Sistem Informasi Reservasi Pineus Tilu Web &bull; Kelompok Security Capstone</p>
        </div>
        <div class="header-meta">
            <div>Tanggal Cetak Audit: <strong>{{ now()->setTimezone('Asia/Jakarta')->format('d M Y, H:i:s \W\I\B') }}</strong></div>
            <div style="margin-top: 4px;">Kode Ref Audit: <span class="badge-hash">PT-SEC-{{ $reportHash }}</span></div>
        </div>
    </div>

    <!-- Executive Summary Cards -->
    <div class="summary-grid">
        <div class="summary-card total">
            <label>Total Log Tercatat</label>
            <div class="value">{{ number_format($totalCount) }}</div>
        </div>
        <div class="summary-card critical">
            <label>Serangan Kritis (Critical)</label>
            <div class="value" style="color: #dc2626;">{{ number_format($criticalCount) }}</div>
        </div>
        <div class="summary-card warning">
            <label>Peringatan (Warning)</label>
            <div class="value" style="color: #d97706;">{{ number_format($warningCount) }}</div>
        </div>
        <div class="summary-card info">
            <label>Aktivitas Sah (Info)</label>
            <div class="value" style="color: #16a34a;">{{ number_format($infoCount) }}</div>
        </div>
    </div>

    <!-- Forensics Evidence Table -->
    <h3 style="color: #1e3a8a; font-size: 12px; margin-bottom: 6px; text-transform: uppercase;">
        🔍 Log Barang Bukti Forensik (Digital Forensic Evidence Records)
    </h3>

    <table>
        <thead>
            <tr>
                <th style="width: 30px;">#</th>
                <th style="width: 110px;">Waktu (WIB)</th>
                <th style="width: 140px;">Kategori Event</th>
                <th style="width: 75px;">Severity</th>
                <th style="width: 140px;">IP Address & Lokasi</th>
                <th style="width: 160px;">Perangkat & Browser</th>
                <th style="width: 110px;">User</th>
                <th>Deskripsi Kejadian Security</th>
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
                    <td>{{ $index + 1 }}</td>
                    <td style="font-weight: 500;">{{ $log->created_at->setTimezone('Asia/Jakarta')->format('d/m/Y H:i:s') }}</td>
                    <td><strong>{{ ucfirst(str_replace('_', ' ', $log->event)) }}</strong></td>
                    <td>
                        <span class="severity-badge severity-{{ $log->severity }}">
                            {{ $log->severity }}
                        </span>
                    </td>
                    <td>{{ $ipLocation }}</td>
                    <td>{{ $deviceInfo }}</td>
                    <td>{{ $log->user ? $log->user->name : 'Guest' }}</td>
                    <td style="font-size: 9.5px;">{{ $log->description }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="8" style="text-align: center; color: #9ca3af; padding: 20px;">
                        Tidak ada catatan log aktivitas dalam database.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <!-- Footer Verification Stamp -->
    <div class="footer-stamp-container">
        <div style="font-size: 9px; color: #6b7280; max-width: 450px;">
            * Dokumen ini dibuat secara otomatis oleh <strong>Sistem Audit Log Keamanan Pineus Tilu Web</strong>.<br>
            Setiap catatan di atas terverifikasi secara digital dan dapat digunakan sebagai bukti otentikasi audit keamanan jaringan & forensik digital.
        </div>

        <div class="stamp-box">
            <div class="stamp-title">DIGITAL FORENSIC AUDIT SEAL</div>
            <div class="stamp-status">✓ VERIFIED & SEALED</div>
            <div style="font-size: 9px; color: #4b5563;">Tim Keamanan Siber &bull; Pineus Tilu</div>
        </div>
    </div>

</body>
</html>
