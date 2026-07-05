<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ActivityLogResource\Pages;
use App\Models\ActivityLog;
use Filament\Forms\Form;
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
     * Form kosong — resource ini tidak memiliki form create/edit.
     */
    public static function form(Form $form): Form
    {
        return $form->schema([]);
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
                        'login'                => 'success',
                        'login_failed'         => 'danger',
                        'otp_verified'         => 'info',
                        'otp_failed'           => 'warning',
                        'otp_sent'             => 'info',
                        'google_login'         => 'primary',
                        'unauthorized_access'  => 'danger',
                        'logout'               => 'gray',
                        'brute_force'          => 'danger',
                        'password_changed'     => 'warning',
                        'password_reset_request' => 'warning',
                        'role_changed'         => 'primary',
                        'sensitive_file_access' => 'danger',
                        'session_invalid'      => 'warning',
                        '2fa_success'          => 'success',
                        '2fa_failed'           => 'danger',
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
                    ->label('Lihat'),
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
