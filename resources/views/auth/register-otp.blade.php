<x-layouts.auth>
    <div class="min-h-screen flex items-center justify-center px-4 sm:px-6 lg:px-8 py-8 sm:py-12 relative z-10">
        <div class="w-full max-w-7xl mx-auto">
            <!-- Card Container -->
            <div class="bg-white rounded-3xl shadow-xl border-2 border-gray-100 overflow-hidden backdrop-blur-sm relative">
                {{-- Back Button - Top Left Corner --}}
                <a href="{{ url('/') }}"
                    class="absolute top-4 left-4 sm:top-6 sm:left-6 lg:top-8 lg:left-8 z-20 inline-flex items-center gap-2 text-gray-600 hover:text-[#017249] transition-all duration-200 group"
                    aria-label="Go back to home">
                    <div
                        class="p-2 sm:p-2.5 bg-gray-100 rounded-xl shadow-md border border-gray-200 group-hover:shadow-lg group-hover:bg-[#017249]/10 group-hover:border-[#017249]/20 group-hover:-translate-x-1 transition-all duration-200">
                        <svg class="w-5 h-5 sm:w-6 sm:h-6 text-gray-500 group-hover:text-[#017249] transition-colors duration-200"
                            fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                        </svg>
                    </div>
                    <span class="text-sm font-medium group-hover:text-[#017249] transition-colors duration-200">Back</span>
                </a>
                <div class="grid lg:grid-cols-5 gap-0">
                    <!-- Left Side - Branding (2 columns) -->
                    <div
                        class="hidden lg:flex lg:col-span-2 flex-col justify-center items-center bg-gradient-to-br from-[#017249] via-[#018556] to-[#01694a] p-12 text-white relative overflow-hidden">
                        <!-- Decorative circles -->
                        <div class="absolute top-0 right-0 w-64 h-64 bg-white opacity-10 rounded-full -mr-32 -mt-32">
                        </div>
                        <div class="absolute bottom-0 left-0 w-48 h-48 bg-white opacity-10 rounded-full -ml-24 -mb-24">
                        </div>

                        <div class="relative z-10 text-center space-y-8">
                            <div>
                                <img src="{{ asset('images/dashboard/logo.png') }}" alt="Pineus Tilu Logo"
                                    class="h-32 mx-auto brightness-0 invert drop-shadow-2xl">
                            </div>
                            <div class="space-y-4">
                                <h3 class="text-4xl font-bold" style="font-family: 'Bizon', sans-serif;">Welcome!</h3>
                                <p class="text-lg opacity-95 leading-relaxed">Join us and enjoy an unforgettable
                                    experience in nature</p>
                            </div>
                            <div class="space-y-4 pt-8">
                                <div
                                    class="flex items-center gap-4 bg-white/15 backdrop-blur-sm rounded-xl p-4 shadow-lg hover:bg-white/20 transition-all duration-200">
                                    <div
                                        class="flex-shrink-0 w-10 h-10 bg-white/25 rounded-full flex items-center justify-center shadow-md">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5 13l4 4L19 7" />
                                        </svg>
                                    </div>
                                    <span class="text-base font-medium">Easy and fast booking</span>
                                </div>
                                <div
                                    class="flex items-center gap-4 bg-white/15 backdrop-blur-sm rounded-xl p-4 shadow-lg hover:bg-white/20 transition-all duration-200">
                                    <div
                                        class="flex-shrink-0 w-10 h-10 bg-white/25 rounded-full flex items-center justify-center shadow-md">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5 13l4 4L19 7" />
                                        </svg>
                                    </div>
                                    <span class="text-base font-medium">Best glamping facilities</span>
                                </div>
                                <div
                                    class="flex items-center gap-4 bg-white/15 backdrop-blur-sm rounded-xl p-4 shadow-lg hover:bg-white/20 transition-all duration-200">
                                    <div
                                        class="flex-shrink-0 w-10 h-10 bg-white/25 rounded-full flex items-center justify-center shadow-md">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5 13l4 4L19 7" />
                                        </svg>
                                    </div>
                                    <span class="text-base font-medium">Amazing nature experience</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Side - Form (3 columns) -->
                    <div class="lg:col-span-3 p-6 sm:p-8 md:p-12 lg:p-16 pt-16 sm:pt-20 lg:pt-16">
                        <!-- Mobile Logo -->
                        <div class="lg:hidden text-center mb-6 sm:mb-8">
                            <img src="{{ asset('images/dashboard/logo.png') }}" alt="Pineus Tilu Logo"
                                class="h-20 sm:h-24 mx-auto mb-3 sm:mb-4">
                        </div>

                        <!-- Header -->
                        <div class="mb-6 sm:mb-8">
                            <h2 class="text-2xl sm:text-3xl lg:text-4xl font-bold text-[#017249] mb-2"
                                style="font-family: 'Bizon', sans-serif;">Create Account
                            </h2>
                            <p class="text-black text-sm sm:text-base">Create a new account to start your glamping
                                experience</p>
                        </div>

                        <!-- Session Status -->
                        <x-auth-session-status class="mb-6" :status="session('status')" />

                        <!-- Registration Form -->
                        <form method="POST" action="{{ route('register.store') }}" id="register-form" class="space-y-6">
                            @csrf
                            <input type="hidden" name="phone" id="full_phone">

                            <!-- Name & Email Row -->
                            <div class="grid md:grid-cols-2 gap-5">
                                <!-- Name Input -->
                                <div class="space-y-2">
                                    <label for="name"
                                        class="block text-xs sm:text-sm font-semibold text-gray-700">Full Name</label>
                                    <div class="relative group">
                                        <div
                                            class="absolute inset-y-0 left-0 pl-3 sm:pl-4 flex items-center pointer-events-none">
                                            <div
                                                class="bg-[#017249]/10 p-1.5 sm:p-2 rounded-2xl group-focus-within:bg-[#017249]/20 transition-colors duration-200">
                                                <svg class="h-3.5 w-3.5 sm:h-4 sm:w-4 text-[#017249]" fill="none"
                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                                </svg>
                                            </div>
                                        </div>
                                        <input id="name" name="name" type="text" value="{{ old('name') }}"
                                            required autofocus autocomplete="name" placeholder="Enter full name"
                                            class="block w-full pl-14 sm:pl-16 pr-4 py-3 sm:py-3.5 text-sm sm:text-base text-gray-900 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-[#017249]/20 focus:border-[#017249] transition-all duration-200 placeholder-gray-400 hover:border-gray-300 cursor-text" />
                                    </div>
                                    @error('name')
                                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                                    @enderror
                                </div>

                                <!-- Email Input -->
                                <div class="space-y-2">
                                    <label for="email"
                                        class="block text-xs sm:text-sm font-semibold text-gray-700">Email</label>
                                    <div class="relative group">
                                        <div
                                            class="absolute inset-y-0 left-0 pl-3 sm:pl-4 flex items-center pointer-events-none">
                                            <div
                                                class="bg-[#017249]/10 p-1.5 sm:p-2 rounded-2xl group-focus-within:bg-[#017249]/20 transition-colors duration-200">
                                                <svg class="h-3.5 w-3.5 sm:h-4 sm:w-4 text-[#017249]" fill="none"
                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
                                                </svg>
                                            </div>
                                        </div>
                                        <input id="email" name="email" type="email"
                                            value="{{ old('email') }}" required autocomplete="email"
                                            placeholder="email@domain.com"
                                            class="block w-full pl-14 sm:pl-16 pr-4 py-3 sm:py-3.5 text-sm sm:text-base text-gray-900 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-[#017249]/20 focus:border-[#017249] transition-all duration-200 placeholder-gray-400 hover:border-gray-300 cursor-text" />
                                    </div>
                                    @error('email')
                                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <!-- Phone Input with Country Code -->
                            <div class="space-y-2">
                                <label for="phone"
                                    class="block text-xs sm:text-sm font-semibold text-gray-700">Phone Number</label>
                                <div class="relative flex gap-2">
                                    <div class="relative">
                                        <select id="country_code" name="country_code"
                                            class="block w-24 sm:w-28 pl-3 pr-8 py-3 sm:py-3.5 text-gray-900 text-xs sm:text-sm border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-[#017249]/20 focus:border-[#017249] transition-all duration-200 hover:border-gray-300 cursor-pointer appearance-none bg-white">
                                            <option value="+62"
                                                {{ old('country_code', '+62') == '+62' ? 'selected' : '' }}>🇮🇩 +62
                                            </option>
                                            <option value="+60"
                                                {{ old('country_code') == '+60' ? 'selected' : '' }}>🇲🇾 +60</option>
                                            <option value="+65"
                                                {{ old('country_code') == '+65' ? 'selected' : '' }}>🇸🇬 +65</option>
                                            <option value="+66"
                                                {{ old('country_code') == '+66' ? 'selected' : '' }}>🇹🇭 +66</option>
                                            <option value="+84"
                                                {{ old('country_code') == '+84' ? 'selected' : '' }}>🇻🇳 +84</option>
                                            <option value="+63"
                                                {{ old('country_code') == '+63' ? 'selected' : '' }}>🇵🇭 +63</option>
                                            <option value="+1"
                                                {{ old('country_code') == '+1' ? 'selected' : '' }}>🇺🇸 +1</option>
                                            <option value="+44"
                                                {{ old('country_code') == '+44' ? 'selected' : '' }}>🇬🇧 +44</option>
                                            <option value="+61"
                                                {{ old('country_code') == '+61' ? 'selected' : '' }}>🇦🇺 +61</option>
                                            <option value="+81"
                                                {{ old('country_code') == '+81' ? 'selected' : '' }}>🇯🇵 +81</option>
                                            <option value="+82"
                                                {{ old('country_code') == '+82' ? 'selected' : '' }}>🇰🇷 +82</option>
                                            <option value="+86"
                                                {{ old('country_code') == '+86' ? 'selected' : '' }}>🇨🇳 +86</option>
                                        </select>
                                        <div
                                            class="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
                                            <svg class="h-4 w-4 text-gray-400" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M19 9l-7 7-7-7" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="relative flex-1 group">
                                        <div
                                            class="absolute inset-y-0 left-0 pl-3 sm:pl-4 flex items-center pointer-events-none">
                                            <div
                                                class="bg-[#017249]/10 p-1.5 sm:p-2 rounded-2xl group-focus-within:bg-[#017249]/20 transition-colors duration-200">
                                                <svg class="h-3.5 w-3.5 sm:h-4 sm:w-4 text-[#017249]" fill="none"
                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                                </svg>
                                            </div>
                                        </div>
                                        <input id="phone_input" name="phone_input" type="tel"
                                            value="{{ old('phone') }}" required autocomplete="tel"
                                            placeholder="812345678" pattern="[0-9]{8,13}"
                                            class="block w-full pl-14 sm:pl-16 pr-4 py-3 sm:py-3.5 text-sm sm:text-base text-gray-900 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-[#017249]/20 focus:border-[#017249] transition-all duration-200 placeholder-gray-400 hover:border-gray-300 cursor-text" />
                                    </div>
                                </div>
                                @error('phone')
                                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                                @enderror
                                @error('country_code')
                                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                                @enderror
                            </div>

                            <!-- Password Row -->
                            <div class="grid md:grid-cols-2 gap-5">
                                <!-- Password Input -->
                                <div class="space-y-2">
                                    <label for="password"
                                        class="block text-xs sm:text-sm font-semibold text-gray-700">Password</label>
                                    <div class="relative group">
                                        <div
                                            class="absolute inset-y-0 left-0 pl-3 sm:pl-4 flex items-center pointer-events-none">
                                            <div
                                                class="bg-[#017249]/10 p-1.5 sm:p-2 rounded-2xl group-focus-within:bg-[#017249]/20 transition-colors duration-200">
                                                <svg class="h-3.5 w-3.5 sm:h-4 sm:w-4 text-[#017249]" fill="none"
                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                                </svg>
                                            </div>
                                        </div>
                                        <input id="password" name="password" type="password" required
                                            autocomplete="new-password" placeholder="Min. 8 characters"
                                            class="block w-full pl-14 sm:pl-16 pr-12 py-3 sm:py-3.5 text-sm sm:text-base text-gray-900 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-[#017249]/20 focus:border-[#017249] transition-all duration-200 placeholder-gray-400 hover:border-gray-300 cursor-text" />
                                        <button type="button" data-toggle-password="password"
                                            class="absolute inset-y-0 right-0 pr-3 sm:pr-4 flex items-center hover:opacity-70 transition-opacity cursor-pointer"
                                            aria-label="Toggle password visibility">
                                            <svg id="eye-icon-password" class="h-4 w-4 sm:h-5 sm:w-5 text-[#017249]"
                                                fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                            </svg>
                                        </button>
                                    </div>
                                    @error('password')
                                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                                    @enderror

                                    <!-- Password Strength Indicator -->
                                    <div class="mt-3 px-1">
                                        <div class="flex justify-between items-center mb-1.5">
                                            <span class="text-xs font-semibold text-gray-600">Strength: <span id="strength-text" class="text-gray-400 font-normal">Empty</span></span>
                                            <span id="strength-percent" class="text-xs font-bold text-gray-500">0%</span>
                                        </div>
                                        <div class="w-full bg-gray-200 rounded-full h-1.5 mb-1 overflow-hidden">
                                            <div id="strength-bar" class="bg-gray-300 h-1.5 rounded-full transition-all duration-300 ease-out" style="width: 0%"></div>
                                        </div>
                                    </div>

                                    <div class="mt-2 text-xs text-gray-500 space-y-0.5 pl-1 bg-gray-50 p-2 rounded-lg border border-gray-100">
                                        <p class="font-semibold text-gray-600 mb-1">Password Criteria:</p>
                                        <ul class="list-disc pl-4 space-y-0.5">
                                            <li>Min. 8 characters</li>
                                            <li>Uppercase & lowercase</li>
                                            <li>At least one number</li>
                                            <li>At least one symbol (!@#$%^&*)</li>
                                        </ul>
                                    </div>
                                </div>

                                <!-- Confirm Password Input -->
                                <div class="space-y-2">
                                    <label for="password_confirmation"
                                        class="block text-xs sm:text-sm font-semibold text-gray-700">Confirm
                                        Password</label>
                                    <div class="relative group">
                                        <div
                                            class="absolute inset-y-0 left-0 pl-3 sm:pl-4 flex items-center pointer-events-none">
                                            <div
                                                class="bg-[#017249]/10 p-1.5 sm:p-2 rounded-2xl group-focus-within:bg-[#017249]/20 transition-colors duration-200">
                                                <svg class="h-3.5 w-3.5 sm:h-4 sm:w-4 text-[#017249]" fill="none"
                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                                                </svg>
                                            </div>
                                        </div>
                                        <input id="password_confirmation" name="password_confirmation"
                                            type="password" required autocomplete="new-password"
                                            placeholder="Repeat password"
                                            class="block w-full pl-14 sm:pl-16 pr-12 py-3 sm:py-3.5 text-sm sm:text-base text-gray-900 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-[#017249]/20 focus:border-[#017249] transition-all duration-200 placeholder-gray-400 hover:border-gray-300 cursor-text" />
                                        <button type="button" data-toggle-password="password_confirmation"
                                            class="absolute inset-y-0 right-0 pr-3 sm:pr-4 flex items-center hover:opacity-70 transition-opacity cursor-pointer"
                                            aria-label="Toggle password confirmation visibility">
                                            <svg id="eye-icon-password_confirmation"
                                                class="h-4 w-4 sm:h-5 sm:w-5 text-[#017249]" fill="none"
                                                stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                            </svg>
                                        </button>
                                    </div>
                                    @error('password_confirmation')
                                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <!-- OTP Method -->
                            <div class="space-y-2">
                                <label class="block text-xs sm:text-sm font-semibold text-gray-700">OTP Method</label>
                                <div class="grid grid-cols-2 gap-3 mt-1">
                                    <label class="relative flex items-center gap-2.5 p-3 sm:p-3.5 border-2 rounded-xl cursor-pointer transition-all duration-200 hover:border-[#017249]/40 hover:bg-[#017249]/5 group {{ old('otp_method', 'whatsapp') == 'whatsapp' ? 'border-[#017249] bg-[#017249]/5' : 'border-gray-200' }}">
                                        <input type="radio" name="otp_method" value="whatsapp"
                                            class="form-radio text-[#017249] focus:ring-[#017249] shrink-0" {{ old('otp_method', 'whatsapp') == 'whatsapp' ? 'checked' : '' }}>
                                        <div class="flex items-center gap-1.5">
                                            <svg class="w-4 h-4 text-green-600 shrink-0" fill="currentColor" viewBox="0 0 24 24">
                                                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347z"/>
                                                <path d="M12 2C6.478 2 2 6.478 2 12c0 1.89.525 3.66 1.438 5.168L2 22l4.832-1.438A9.955 9.955 0 0012 22c5.522 0 10-4.478 10-10S17.522 2 12 2zm0 18a7.96 7.96 0 01-4.29-1.248l-.308-.184-2.87.852.852-2.87-.184-.308A7.96 7.96 0 014 12c0-4.411 3.589-8 8-8s8 3.589 8 8-3.589 8-8 8z"/>
                                            </svg>
                                            <span class="text-xs sm:text-sm font-medium text-gray-700 group-hover:text-gray-900 transition-colors">WhatsApp</span>
                                        </div>
                                    </label>
                                    <label class="relative flex items-center gap-2.5 p-3 sm:p-3.5 border-2 rounded-xl cursor-pointer transition-all duration-200 hover:border-[#017249]/40 hover:bg-[#017249]/5 group {{ old('otp_method') == 'email' ? 'border-[#017249] bg-[#017249]/5' : 'border-gray-200' }}">
                                        <input type="radio" name="otp_method" value="email"
                                            class="form-radio text-[#017249] focus:ring-[#017249] shrink-0" {{ old('otp_method') == 'email' ? 'checked' : '' }}>
                                        <div class="flex items-center gap-1.5">
                                            <svg class="w-4 h-4 text-[#017249] shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                            </svg>
                                            <span class="text-xs sm:text-sm font-medium text-gray-700 group-hover:text-gray-900 transition-colors">Email</span>
                                        </div>
                                    </label>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="pt-4">
                                <button type="submit"
                                    class="group w-full bg-gradient-to-r from-[#017249] to-[#018556] hover:from-[#015a3a] hover:to-[#017249] text-white font-bold py-3.5 sm:py-4 px-6 rounded-xl shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-[#017249]/50 cursor-pointer">
                                    <span class="flex items-center justify-center gap-2 text-sm sm:text-base">
                                        <svg class="w-4 h-4 sm:w-5 sm:h-5" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" />
                                        </svg>
                                        Create Account
                                        <svg class="w-4 h-4 sm:w-5 sm:h-5 group-hover:translate-x-1 transition-transform duration-200"
                                            fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M13 7l5 5m0 0l-5 5m5-5H6" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                        </form>

                        <!-- Divider -->
                        <div class="relative my-6 sm:my-8">
                            <div class="absolute inset-0 flex items-center">
                                <div class="w-full border-t-2 border-gray-200"></div>
                            </div>
                            <div class="relative flex justify-center text-xs sm:text-sm">
                                <span class="px-3 sm:px-4 bg-white text-gray-600 font-semibold">Or register with</span>
                            </div>
                        </div>

                        <!-- Google Registration Button -->
                        <a href="{{ route('google.redirect') }}"
                            class="group w-full flex items-center justify-center gap-2 sm:gap-3 bg-white border-2 border-gray-200 hover:border-[#017249] hover:bg-gray-50 text-gray-700 font-semibold py-3 sm:py-3.5 px-4 rounded-xl shadow-sm hover:shadow-md hover:scale-[1.02] transition-all duration-200 cursor-pointer">
                            <svg class="w-4 h-4 sm:w-5 sm:h-5" viewBox="0 0 24 24" fill="none">
                                <path
                                    d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                                    fill="#4285F4" />
                                <path
                                    d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                                    fill="#34A853" />
                                <path
                                    d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
                                    fill="#FBBC05" />
                                <path
                                    d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                                    fill="#EA4335" />
                            </svg>
                            Register with Google
                        </a>

                        <!-- Login Link -->
                        @if (Route::has('login'))
                            <div class="text-center pt-6 pb-2">
                                <span class="text-gray-600 text-sm sm:text-base">Already have an account? </span>
                                <a href="{{ route('login') }}"
                                    class="inline-flex items-center gap-1 font-semibold text-[#017249] hover:text-[#015a3a] transition-all duration-200 text-sm sm:text-base group">
                                    Log in here
                                    <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform duration-200"
                                        fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M13 7l5 5m0 0l-5 5m5-5H6" />
                                    </svg>
                                </a>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password Strength
            const passwordInput = document.getElementById('password');
            const strengthBar = document.getElementById('strength-bar');
            const strengthText = document.getElementById('strength-text');
            const strengthPercent = document.getElementById('strength-percent');

            if (passwordInput) {
                passwordInput.addEventListener('input', function() {
                    const val = this.value;
                    let score = 0;

                    if (!val) {
                        strengthBar.style.width = '0%';
                        strengthBar.className = 'bg-gray-300 h-1.5 rounded-full transition-all duration-300 ease-out';
                        strengthText.textContent = 'Empty';
                        strengthText.className = 'text-gray-400 font-normal';
                        strengthPercent.textContent = '0%';
                        return;
                    }

                    // Calculate score based on criteria
                    if (val.length >= 8) score += 20;
                    if (/[A-Z]/.test(val)) score += 20;
                    if (/[a-z]/.test(val)) score += 20;
                    if (/[0-9]/.test(val)) score += 20;
                    if (/[^A-Za-z0-9]/.test(val)) score += 20;

                    // Update width and text
                    strengthBar.style.width = score + '%';
                    strengthPercent.textContent = score + '%';

                    // Determine color and label
                    let colorClass = '';
                    let label = '';
                    let labelColor = '';

                    if (score <= 25) {
                        label = 'Weak';
                        colorClass = 'bg-red-500';
                        labelColor = 'text-red-600';
                    } else if (score <= 50) {
                        label = 'Medium';
                        colorClass = 'bg-orange-500';
                        labelColor = 'text-orange-600';
                    } else if (score <= 75) {
                        label = 'Good';
                        colorClass = 'bg-yellow-500';
                        labelColor = 'text-yellow-600';
                    } else {
                        label = 'Strong';
                        colorClass = 'bg-green-500';
                        labelColor = 'text-green-600';
                    }

                    strengthBar.className = colorClass + ' h-1.5 rounded-full transition-all duration-300 ease-out';
                    strengthText.textContent = label;
                    strengthText.className = labelColor + ' font-semibold ml-1';
                });
            }

            // Phone concatenation
            const form = document.getElementById('register-form');
            const countryCode = document.getElementById('country_code');
            const phoneInput = document.getElementById('phone_input');
            const fullPhone = document.getElementById('full_phone');

            if (form) {
                form.addEventListener('submit', function(e) {
                    if (countryCode && phoneInput && fullPhone) {
                        let number = phoneInput.value.replace(/^0+/, ''); // remove leading zero
                        fullPhone.value = countryCode.value + number;
                    }
                });
            }
        });
    </script>
</x-layouts.auth>