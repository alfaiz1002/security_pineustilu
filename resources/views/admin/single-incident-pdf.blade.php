<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Forensik Insiden #{{ $log->id }} - Pineus Tilu</title>
    <style>
        @page {
            size: A4 portrait;
            margin: 15mm;
        }

        * { box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #0f172a;
            background-color: #ffffff;
            margin: 0;
            padding: 10px;
            font-size: 11px;
            line-height: 1.5;
        }

        .doc-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            border-bottom: 2.5px solid #0f172a;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }

        .company-brand {
            font-size: 16px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .sub-brand {
            font-size: 10px;
            color: #475569;
            font-weight: 600;
            margin-top: 2px;
        }

        .meta-box {
            text-align: right;
            font-size: 9.5px;
            color: #475569;
        }

        .confidential-tag {
            background-color: #7f1d1d;
            color: #ffffff;
            font-weight: bold;
            font-size: 8.5px;
            padding: 2px 6px;
            border-radius: 2px;
            text-transform: uppercase;
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

        .section-title {
            font-size: 11px;
            font-weight: 800;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            background-color: #f1f5f9;
            border-left: 4px solid #1e293b;
            padding: 6px 10px;
            margin: 14px 0 8px 0;
        }

        .grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin-bottom: 10px;
        }

        .data-row {
            margin-bottom: 6px;
        }

        .data-row label {
            font-size: 9px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            display: block;
        }

        .data-row .val {
            font-size: 11px;
            font-weight: 600;
            color: #0f172a;
        }

        .badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 9.5px;
            font-weight: 700;
            text-transform: uppercase;
        }

        .badge-CRITICAL { background-color: #fee2e2; color: #991b1b; border: 1px solid #f87171; }
        .badge-WARNING { background-color: #fef3c7; color: #92400e; border: 1px solid #fbbf24; }
        .badge-INFO { background-color: #dcfce7; color: #166534; border: 1px solid #4ade80; }

        .narrative-box {
            border: 1px solid #cbd5e1;
            background-color: #fafafa;
            border-radius: 4px;
            padding: 10px;
            font-size: 10.5px;
            color: #1e293b;
            margin-bottom: 12px;
        }

        .remediation-box {
            border: 1px solid #94a3b8;
            border-radius: 4px;
            background-color: #f8fafc;
            padding: 12px;
        }

        .remediation-box h5 {
            margin: 0 0 6px 0;
            font-size: 10.5px;
            color: #0f172a;
            text-transform: uppercase;
        }

        .remediation-box ul {
            margin: 0;
            padding-left: 18px;
            color: #334155;
            font-size: 10px;
        }

        .remediation-box li {
            margin-bottom: 5px;
        }

        .footer-signatures {
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
            font-size: 9px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            margin-bottom: 35px;
        }

        .sig-box .name {
            font-size: 10px;
            font-weight: 700;
            color: #0f172a;
            border-top: 1px solid #94a3b8;
            padding-top: 4px;
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
        }

        @media print {
            .print-btn-bar { display: none !important; }
            body { padding: 0; }
        }
    </style>
</head>
<body>

    <div class="print-btn-bar">
        <button onclick="window.print()" class="btn-print">Cetak Laporan Insiden ini</button>
    </div>

    <!-- Header -->
    <div class="doc-header">
        <div>
            <div class="company-brand">Pineus Tilu Cybersecurity Unit</div>
            <div class="sub-brand">Laporan Hasil Investigasi Insiden Keamanan Spesifik &bull; Referensi ID #{{ $log->id }}</div>
        </div>
        <div class="meta-box">
            <div><span class="confidential-tag">CONFIDENTIAL // INCIDENT REPORT</span></div>
            <div style="margin-top: 3px;">Tanggal Terbit: <strong>{{ now()->setTimezone('Asia/Jakarta')->format('d F Y, H:i:s \W\I\B') }}</strong></div>
            <div style="margin-top: 3px;">Hash Insiden: <span class="hash-code">PT-INC-{{ $reportHash }}</span></div>
        </div>
    </div>

    <!-- Section I: Incident Metadata -->
    <div class="section-title">I. IDENTITAS INSIDEN & METADATA BUKTI (INCIDENT METADATA)</div>
    <div class="grid-2">
        <div>
            <div class="data-row">
                <label>ID Insiden Log</label>
                <div class="val">#{{ $log->id }}</div>
            </div>
            <div class="data-row">
                <label>Waktu Kejadian (WIB)</label>
                <div class="val">{{ $log->created_at->setTimezone('Asia/Jakarta')->format('d F Y, H:i:s') }} WIB</div>
            </div>
            <div class="data-row">
                <label>Kategori Event</label>
                <div class="val">{{ ucfirst(str_replace('_', ' ', $log->event)) }}</div>
            </div>
        </div>
        <div>
            <div class="data-row">
                <label>Tingkat Keparahan (Severity Rating)</label>
                <div class="val">
                    <span class="badge badge-{{ $log->severity }}">
                        {{ $log->severity }}
                    </span>
                </div>
            </div>
            <div class="data-row">
                <label>Identitas User Terkait</label>
                <div class="val">{{ $log->user ? $log->user->name . ' (' . $log->user->email . ')' : 'Guest / Tidak Terautentikasi (Anonim)' }}</div>
            </div>
        </div>
    </div>

    <!-- Section II: Geographic & Device Analysis -->
    <div class="section-title">II. ANALISIS GEOGRAFIK & PERANGKAT PENGAKSES (FORENSIC ENVIRONMENT)</div>
    <div class="grid-2">
        <div>
            <div class="data-row">
                <label>IP Address & Lokasi Geografis</label>
                <div class="val">{{ \App\Services\UserAgentParser::formatIp($log->ip_address) }}</div>
            </div>
        </div>
        <div>
            <div class="data-row">
                <label>Perangkat & Browser (User-Agent Analysis)</label>
                <div class="val">
                    {{ \App\Services\UserAgentParser::parse(preg_match('/User-Agent:\s*([^\)]+)/i', $log->description, $m) ? $m[1] : request()->header('User-Agent')) }}
                </div>
            </div>
        </div>
    </div>

    <!-- Section III: Forensic Narrative -->
    <div class="section-title">III. DESKRIPSI TEKNIS KEJADIKAN & BARANG BUKTI (FORENSIC NARRATIVE)</div>
    <div class="narrative-box">
        <strong>Detail Narasi Peristiwa:</strong><br>
        {{ $log->description }}
    </div>

    <!-- Section IV: Specific Technical Remediation Plan -->
    <div class="section-title">IV. REKOMENDASI PENCEGAHAN & STRATEGI MITIGASI TEKNIS (REMEDIATION PLAN)</div>
    <div class="remediation-box">
        <h5>Langkah Tindakan Perbaikan & Pencegahan Terstruktur:</h5>
        <ul>
            @if(in_array($log->event, ['bot_scraping_attempt', 'unauthorized_access']))
                <li><strong>Enforce Rate Limiting:</strong> Terapkan throttling maksimal 30 request/menit untuk mencegah scraping otomatis.</li>
                <li><strong>WAF Filter:</strong> Aktifkan JavaScript Challenge Cloudflare WAF dan masukan IP penyerang ke dalam IP Blacklist.</li>
            @elseif(in_array($log->event, ['idor_attempt']))
                <li><strong>Strict Server Authorization:</strong> Wajibkan pengecekan hak akses di controller menggunakan `$this->authorize('view', $booking)`.</li>
                <li><strong>UUID Migration:</strong> Ganti ID inkremental angka di URL dengan UUID v4 untuk mencegah penembakan ID secara sekuensial.</li>
            @elseif(in_array($log->event, ['brute_force', 'login_failed']))
                <li><strong>Account Lockout Policy:</strong> Kunci akun sementara setelah 5 kali kegagalan login berturut-turut.</li>
                <li><strong>Multi-Factor Authentication:</strong> Wajibkan verifikasi TOTP 2FA untuk seluruh akun berhak akses tinggi/admin.</li>
            @elseif(in_array($log->event, ['csp_violation']))
                <li><strong>CSP Policy Audit:</strong> Audit skrip eksternal tak dikenal dan perketat arahan `script-src 'self'` pada header CSP.</li>
            @elseif(in_array($log->event, ['sql_injection_attempt']))
                <li><strong>Prepared Statements:</strong> Pastikan seluruh query database menggunakan Parameterized Queries PDO atau Eloquent ORM.</li>
            @else
                <li><strong>Continuous Audit Logging:</strong> Pertahankan pengawasan audit log secara kontinyu dan perbarui patch keamanan berkala.</li>
            @endif
            <li><strong>Audit & Monitoring:</strong> Lakukan pemantauan logs secara berkala dan simpan salinan cadangan bukti forensik.</li>
        </ul>
    </div>

    <!-- Signatures Footer -->
    <div class="footer-signatures">
        <div style="font-size: 8.5px; color: #64748b; max-width: 350px;">
            Dokumen ini divalidasi oleh <strong>Sistem Keamanan Siber Pineus Tilu</strong>.<br>
            Tanda tangan digital ini menyatakan bukti forensik di atas telah terverifikasi secara otentik.
        </div>

        <div class="sig-box">
            <div class="title">Disetujui Oleh Auditor Keamanan</div>
            <div class="name">Tim Security Capstone Design</div>
        </div>
    </div>

</body>
</html>
