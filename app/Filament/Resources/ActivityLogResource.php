<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ActivityLogResource\Pages;
use App\Models\ActivityLog;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Infolists;
use Filament\Infolists\Infolist;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class ActivityLogResource extends Resource
{
    protected static ?string $model = ActivityLog::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';

    protected static ?string $navigationLabel = 'Audit Log';

    protected static ?string $navigationGroup = 'Pengaturan';

    protected static ?string $modelLabel = 'Audit Log';

    protected static ?string $pluralModelLabel = 'Audit Logs';

    protected static ?int $navigationSort = 99;

    /**
     * Hanya super-admin yang dapat mengakses resource ini.
     */
    public static function canAccess(): bool
    {
        return Auth::check() && Auth::user()->hasRole('super-admin');
    }

    /**
     * Resource ini read-only — tidak ada aksi create/edit/delete.
     */
    public static function canCreate(): bool
    {
        return false;
    }

    public static function canEdit($record): bool
    {
        return false;
    }

    public static function canDelete($record): bool
    {
        return false;
    }

    public static function canDeleteAny(): bool
    {
        return false;
    }

    /**
     * Schema modal View Audit Log (Read-Only).
     */
    public static function form(Form $form): Form
    {
        return $form->schema([]);
    }

    /**
     * Modern Infolist Schema untuk Modal View Audit Log.
     */
    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                Infolists\Components\Section::make('Informasi Keamanan & Status Event')
                    ->schema([
                        Infolists\Components\Grid::make(2)
                            ->schema([
                                Infolists\Components\TextEntry::make('event')
                                    ->label('Kategori Event')
                                    ->badge()
                                    ->color(fn (string $state): string => match ($state) {
                                        'login', '2fa_success', 'payment_success', 'reschedule_approved', 'cancellation_approved' => 'success',
                                        'login_failed', 'unauthorized_access', 'brute_force', 'sensitive_file_access', '2fa_failed', 'idor_attempt', 'sql_injection_attempt', 'ssrf_attempt', 'privilege_escalation', 'payment_failed', 'account_locked', 'bot_scraping_attempt' => 'danger',
                                        'otp_verified', 'otp_sent', 'google_login', 'log_exported', 'payment_webhook_received', 'reschedule_requested', 'cancellation_requested', 'morikafe_menu_downloaded' => 'info',
                                        'otp_failed', 'password_changed', 'password_reset_request', 'session_invalid', 'csp_violation', 'config_changed', 'debug_access', 'session_expired', 'concurrent_session', 'rate_limit_exceeded', 'reschedule_rejected', 'cancellation_rejected', 'account_unlocked' => 'warning',
                                        'role_changed'         => 'primary',
                                        'logout'               => 'gray',
                                        default                => 'gray',
                                    })
                                    ->formatStateUsing(fn (string $state): string => match ($state) {
                                        'login'                => 'Login',
                                        'login_failed'         => 'Login Gagal',
                                        'otp_verified'         => 'OTP Berhasil',
                                        'otp_failed'           => 'OTP Gagal',
                                        'otp_sent'             => 'OTP Dikirim',
                                        'google_login'         => 'Google Login',
                                        'unauthorized_access'  => 'Akses Tidak Sah',
                                        'logout'               => 'Logout',
                                        'brute_force'          => 'Brute Force',
                                        'password_changed'     => 'Ganti Password',
                                        'password_reset_request' => 'Reset Password',
                                        'role_changed'         => 'Ubah Role',
                                        'sensitive_file_access' => 'Akses File Sensitif',
                                        'session_invalid'      => 'Session Invalid',
                                        '2fa_success'          => '2FA Berhasil',
                                        '2fa_failed'           => '2FA Gagal',
                                        'csp_violation'        => 'Pelanggaran CSP',
                                        'idor_attempt'         => 'Percobaan IDOR',
                                        'sql_injection_attempt'=> 'SQL Injection',
                                        'ssrf_attempt'         => 'Percobaan SSRF',
                                        'bot_scraping_attempt' => 'Percobaan Bot Scraping',
                                        'morikafe_menu_downloaded' => 'Unduh Menu Morikafe',
                                        'payment_success'      => 'Pembayaran Berhasil',
                                        'payment_failed'       => 'Pembayaran Gagal',
                                        'payment_webhook_received' => 'Webhook Midtrans',
                                        'reschedule_requested' => 'Pengajuan Reschedule',
                                        'reschedule_approved'  => 'Reschedule Disetujui',
                                        'reschedule_rejected'  => 'Reschedule Ditolak',
                                        'cancellation_requested' => 'Pengajuan Pembatalan',
                                        'cancellation_approved'  => 'Pembatalan Disetujui',
                                        'cancellation_rejected'  => 'Pembatalan Ditolak',
                                        default                => ucfirst(str_replace('_', ' ', $state)),
                                    }),

                                Infolists\Components\TextEntry::make('severity')
                                    ->label('Tingkat Keparahan (Severity)')
                                    ->badge()
                                    ->color(fn (string $state): string => match ($state) {
                                        'CRITICAL' => 'danger',
                                        'WARNING'  => 'warning',
                                        'INFO'     => 'success',
                                        default    => 'gray',
                                    })
                                    ->formatStateUsing(fn (string $state): string => match ($state) {
                                        'CRITICAL' => '🔴 CRITICAL',
                                        'WARNING'  => '🟡 WARNING',
                                        'INFO'     => '🟢 INFO',
                                        default    => $state,
                                    }),
                            ]),
                    ]),

                Infolists\Components\Section::make('Rincian Pengakses, Perangkat & Lokasi IP')
                    ->schema([
                        Infolists\Components\Grid::make(2)
                            ->schema([
                                Infolists\Components\TextEntry::make('created_at')
                                    ->label('Waktu Kejadian')
                                    ->dateTime('d M Y, H:i:s \W\I\B')
                                    ->icon('heroicon-m-clock'),

                                Infolists\Components\TextEntry::make('ip_address')
                                    ->label('IP Address & Lokasi')
                                    ->html()
                                    ->formatStateUsing(fn (?string $state): string => \App\Services\UserAgentParser::formatIpHtml($state))
                                    ->copyable()
                                    ->copyMessage('IP address disalin!'),

                                Infolists\Components\TextEntry::make('description')
                                    ->label('Perangkat & Browser')
                                    ->icon('heroicon-m-computer-desktop')
                                    ->formatStateUsing(function ($state, ActivityLog $record): string {
                                        if (preg_match('/User-Agent:\s*([^\)]+)/i', $record->description, $matches)) {
                                            return \App\Services\UserAgentParser::parse($matches[1]);
                                        }
                                        return \App\Services\UserAgentParser::parse(request()->header('User-Agent'));
                                    }),

                                Infolists\Components\TextEntry::make('user.name')
                                    ->label('Nama User')
                                    ->placeholder('Guest / Tidak Terautentikasi')
                                    ->icon('heroicon-m-user'),

                                Infolists\Components\TextEntry::make('user.email')
                                    ->label('Email User')
                                    ->placeholder('-')
                                    ->icon('heroicon-m-envelope'),
                            ]),
                    ]),

                Infolists\Components\Section::make('Deskripsi Detail Kejadian Security')
                    ->schema([
                        Infolists\Components\TextEntry::make('description')
                            ->label('')
                            ->columnSpanFull()
                            ->markdown(),
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Waktu')
                    ->dateTime('d M Y, H:i:s')
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('user.name')
                    ->label('User')
                    ->searchable()
                    ->sortable()
                    ->placeholder('Guest')
                    ->description(fn (ActivityLog $record): string => $record->user_id
                        ? ($record->user->email ?? '')
                        : 'Tidak terautentikasi'),

                Tables\Columns\BadgeColumn::make('event')
                    ->label('Event')
                    ->searchable()
                    ->color(fn (string $state): string => match ($state) {
                        'login', '2fa_success', 'payment_success', 'reschedule_approved', 'cancellation_approved' => 'success',
                        'login_failed', 'unauthorized_access', 'brute_force', 'sensitive_file_access', '2fa_failed', 'idor_attempt', 'sql_injection_attempt', 'ssrf_attempt', 'privilege_escalation', 'payment_failed', 'account_locked', 'bot_scraping_attempt' => 'danger',
                        'otp_verified', 'otp_sent', 'google_login', 'log_exported', 'payment_webhook_received', 'reschedule_requested', 'cancellation_requested', 'morikafe_menu_downloaded' => 'info',
                        'otp_failed', 'password_changed', 'password_reset_request', 'session_invalid', 'csp_violation', 'config_changed', 'debug_access', 'session_expired', 'concurrent_session', 'rate_limit_exceeded', 'reschedule_rejected', 'cancellation_rejected', 'account_unlocked' => 'warning',
                        'role_changed'         => 'primary',
                        'logout'               => 'gray',
                        default                => 'gray',
                    })
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'login'                => 'Login',
                        'login_failed'         => 'Login Gagal',
                        'otp_verified'         => 'OTP Berhasil',
                        'otp_failed'           => 'OTP Gagal',
                        'otp_sent'             => 'OTP Dikirim',
                        'google_login'         => 'Google Login',
                        'unauthorized_access'  => 'Akses Tidak Sah',
                        'logout'               => 'Logout',
                        'brute_force'          => 'Brute Force',
                        'password_changed'     => 'Ganti Password',
                        'password_reset_request' => 'Reset Password',
                        'role_changed'         => 'Ubah Role',
                        'sensitive_file_access' => 'Akses File Sensitif',
                        'session_invalid'      => 'Session Invalid',
                        '2fa_success'          => '2FA Berhasil',
                        '2fa_failed'           => '2FA Gagal',
                        'csp_violation'        => 'Pelanggaran CSP',
                        'idor_attempt'         => 'Percobaan IDOR',
                        'sql_injection_attempt'=> 'SQL Injection',
                        'ssrf_attempt'         => 'Percobaan SSRF',
                        'bot_scraping_attempt' => 'Percobaan Bot Scraping',
                        'morikafe_menu_downloaded' => 'Unduh Menu Morikafe',
                        'payment_success'      => 'Pembayaran Berhasil',
                        'payment_failed'       => 'Pembayaran Gagal',
                        'payment_webhook_received' => 'Webhook Midtrans',
                        'reschedule_requested' => 'Pengajuan Reschedule',
                        'reschedule_approved'  => 'Reschedule Disetujui',
                        'reschedule_rejected'  => 'Reschedule Ditolak',
                        'cancellation_requested' => 'Pengajuan Pembatalan',
                        'cancellation_approved'  => 'Pembatalan Disetujui',
                        'cancellation_rejected'  => 'Pembatalan Ditolak',
                        default                => ucfirst(str_replace('_', ' ', $state)),
                    }),

                Tables\Columns\BadgeColumn::make('severity')
                    ->label('Severity')
                    ->sortable()
                    ->color(fn (string $state): string => match ($state) {
                        'CRITICAL' => 'danger',
                        'WARNING'  => 'warning',
                        'INFO'     => 'success',
                        default    => 'gray',
                    })
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'CRITICAL' => '🔴 CRITICAL',
                        'WARNING'  => '🟡 WARNING',
                        'INFO'     => '🟢 INFO',
                        default    => $state,
                    }),

                Tables\Columns\TextColumn::make('description')
                    ->label('Deskripsi')
                    ->wrap()
                    ->searchable(),

                Tables\Columns\TextColumn::make('ip_address')
                    ->label('IP Address')
                    ->copyable()
                    ->copyMessage('IP address disalin')
                    ->placeholder('-'),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                SelectFilter::make('event')
                    ->label('Filter Event')
                    ->options([
                        'login'                  => 'Login',
                        'login_failed'           => 'Login Gagal',
                        'otp_verified'           => 'OTP Berhasil',
                        'otp_failed'             => 'OTP Gagal',
                        'otp_sent'               => 'OTP Dikirim',
                        'google_login'           => 'Google Login',
                        'logout'                 => 'Logout',
                        'brute_force'            => 'Brute Force',
                        'password_changed'       => 'Ganti Password',
                        'password_reset_request' => 'Reset Password',
                        'role_changed'           => 'Ubah Role',
                        'sensitive_file_access'  => 'Akses File Sensitif',
                        'session_invalid'        => 'Session Invalid',
                        '2fa_success'            => '2FA Berhasil',
                        '2fa_failed'             => '2FA Gagal',
                        'unauthorized_access'    => 'Akses Tidak Sah',
                        'csp_violation'          => 'Pelanggaran CSP',
                        'idor_attempt'           => 'Percobaan IDOR',
                        'sql_injection_attempt'  => 'SQL Injection',
                        'payment_success'        => 'Pembayaran Berhasil',
                        'payment_failed'         => 'Pembayaran Gagal',
                    ])
                    ->native(false),

                SelectFilter::make('severity')
                    ->label('Filter Severity')
                    ->options([
                        'INFO'     => 'INFO',
                        'WARNING'  => 'WARNING',
                        'CRITICAL' => 'CRITICAL',
                    ])
                    ->native(false),

                Filter::make('created_at')
                    ->label('Filter Tanggal')
                    ->form([
                        \Filament\Forms\Components\DatePicker::make('from')
                            ->label('Dari Tanggal')
                            ->native(false),
                        \Filament\Forms\Components\DatePicker::make('until')
                            ->label('Sampai Tanggal')
                            ->native(false),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['from'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['until'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    }),
            ])
            ->actions([
                Tables\Actions\ViewAction::make()
                    ->label('Lihat')
                    ->extraModalFooterActions(fn (ActivityLog $record): array => [
                        Tables\Actions\Action::make('download_pdf')
                            ->label('Cetak Laporan Forensik Insiden (PDF)')
                            ->icon('heroicon-m-document-text')
                            ->color('danger')
                            ->visible(fn (ActivityLog $record): bool => in_array($record->severity, ['CRITICAL', 'WARNING']))
                            ->url(fn (ActivityLog $record): string => route('admin.audit-log.single-pdf', $record->id))
                            ->openUrlInNewTab(),
                    ]),
            ])
            ->bulkActions([])
            ->paginated([25, 50, 100]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListActivityLogs::route('/'),
        ];
    }

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::whereDate('created_at', today())->count() ?: null;
    }

    public static function getNavigationBadgeColor(): ?string
    {
        return 'warning';
    }
}
