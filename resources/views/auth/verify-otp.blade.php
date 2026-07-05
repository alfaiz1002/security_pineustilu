<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verifikasi OTP</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#f5f0e8] min-h-screen flex items-center justify-center p-4 font-sans">
    <div class="bg-white rounded-2xl shadow-xl w-full max-w-4xl flex flex-col md:flex-row overflow-hidden">
        
        <!-- PANEL KIRI -->
        <div class="md:w-1/2 bg-[#1a3d2b] p-10 flex flex-col items-center justify-center text-center relative overflow-hidden">
            <!-- Decorative circles -->
            <div class="absolute top-0 left-0 w-full h-full opacity-10 pointer-events-none">
                <div class="absolute -top-20 -left-20 w-64 h-64 rounded-full border-[20px] border-white"></div>
                <div class="absolute -bottom-20 -right-20 w-64 h-64 rounded-full border-[20px] border-white"></div>
            </div>
            
            <div class="relative z-10 flex flex-col items-center">
                <img src="{{ asset('images/dashboard/logo.png') }}" alt="Pineus Tilu Logo" class="h-32 mb-10 brightness-0 invert drop-shadow-2xl object-contain">
                <!-- Shield Icon -->
                <div class="bg-white/10 p-4 rounded-full mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-12 h-12 text-[#f5f0e8]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12c0 1.268-.63 2.39-1.593 3.068a3.745 3.745 0 01-1.043 3.296 3.745 3.745 0 01-3.296 1.043A3.745 3.745 0 0112 21c-1.268 0-2.39-.63-3.068-1.593a3.746 3.746 0 01-3.296-1.043 3.745 3.745 0 01-1.043-3.296A3.745 3.745 0 013 12c0-1.268.63-2.39 1.593-3.068a3.745 3.745 0 011.043-3.296 3.746 3.746 0 013.296-1.043A3.746 3.746 0 0112 3c1.268 0 2.39.63 3.068 1.593a3.746 3.746 0 013.296 1.043 3.746 3.746 0 011.043 3.296A3.745 3.745 0 0121 12z" />
                    </svg>
                </div>
                
                <p class="text-[#f5f0e8] opacity-90 text-sm max-w-[250px]">
                    Verifikasi identitas Anda untuk keamanan akun
                </p>
            </div>
        </div>

        <!-- PANEL KANAN -->
        <div class="md:w-1/2 p-8 md:p-12 flex flex-col justify-center bg-white">
            
            <!-- Progress Step -->
            <div class="mb-8">
                <div class="flex items-center justify-between text-xs font-semibold text-gray-400 mb-2">
                    <span>Login</span>
                    <span class="text-[#1a3d2b]">Verifikasi OTP</span>
                    <span>Masuk</span>
                </div>
                <div class="w-full bg-gray-200 h-1 rounded-full overflow-hidden flex">
                    <div class="bg-[#1a3d2b] h-full w-2/3 rounded-full"></div>
                </div>
            </div>

            <h2 class="text-3xl font-bold text-gray-800 mb-2">Verifikasi OTP</h2>
            
            @if(session('verify_otp_method') === 'email')
                <p class="text-gray-500 mb-6 text-sm">Kode 6 digit telah dikirimkan ke Email Anda:<br><strong class="text-gray-800">{{ session('verify_email') }}</strong></p>
            @else
                <p class="text-gray-500 mb-6 text-sm">Kode 6 digit telah dikirimkan ke WhatsApp Anda:<br><strong class="text-gray-800">{{ session('verify_phone') }}</strong></p>
            @endif
            
            @if ($errors->any())
                <div class="bg-red-50 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded text-sm">
                    <ul class="list-disc pl-4">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @if (session('warning'))
                <div class="bg-yellow-50 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-6 rounded text-sm font-medium">
                    {{ session('warning') }}
                </div>
            @endif

            <form action="{{ route('otp.verify') }}" method="POST" id="otpForm">
                @csrf
                <input type="hidden" name="phone" id="phone" value="{{ session('verify_phone') }}">
                <input type="hidden" id="otp_method" value="{{ session('verify_otp_method', 'whatsapp') }}">
                <input type="hidden" name="otp" id="real-otp-input" required pattern="\d{6}">
                
                <div class="flex justify-between gap-2 mb-8" id="otp-container">
                    <input type="text" inputmode="numeric" maxlength="1" class="w-12 h-14 md:w-14 md:h-16 text-center text-2xl font-bold border-2 border-gray-200 rounded-lg focus:border-[#1a3d2b] focus:ring-0 focus:outline-none otp-input text-gray-800 transition-colors bg-gray-50 focus:bg-white" required>
                    <input type="text" inputmode="numeric" maxlength="1" class="w-12 h-14 md:w-14 md:h-16 text-center text-2xl font-bold border-2 border-gray-200 rounded-lg focus:border-[#1a3d2b] focus:ring-0 focus:outline-none otp-input text-gray-800 transition-colors bg-gray-50 focus:bg-white" required>
                    <input type="text" inputmode="numeric" maxlength="1" class="w-12 h-14 md:w-14 md:h-16 text-center text-2xl font-bold border-2 border-gray-200 rounded-lg focus:border-[#1a3d2b] focus:ring-0 focus:outline-none otp-input text-gray-800 transition-colors bg-gray-50 focus:bg-white" required>
                    <input type="text" inputmode="numeric" maxlength="1" class="w-12 h-14 md:w-14 md:h-16 text-center text-2xl font-bold border-2 border-gray-200 rounded-lg focus:border-[#1a3d2b] focus:ring-0 focus:outline-none otp-input text-gray-800 transition-colors bg-gray-50 focus:bg-white" required>
                    <input type="text" inputmode="numeric" maxlength="1" class="w-12 h-14 md:w-14 md:h-16 text-center text-2xl font-bold border-2 border-gray-200 rounded-lg focus:border-[#1a3d2b] focus:ring-0 focus:outline-none otp-input text-gray-800 transition-colors bg-gray-50 focus:bg-white" required>
                    <input type="text" inputmode="numeric" maxlength="1" class="w-12 h-14 md:w-14 md:h-16 text-center text-2xl font-bold border-2 border-gray-200 rounded-lg focus:border-[#1a3d2b] focus:ring-0 focus:outline-none otp-input text-gray-800 transition-colors bg-gray-50 focus:bg-white" required>
                </div>

                <button type="submit" class="w-full bg-[#1a3d2b] hover:bg-[#122a1d] text-white font-bold py-3.5 px-4 rounded-lg focus:outline-none transition-colors shadow-lg flex items-center justify-center gap-2 mb-2 group">
                    Verifikasi sekarang <span class="group-hover:translate-x-1 transition-transform">&rarr;</span>
                </button>
            </form>

            <div class="mt-4 text-sm text-gray-600 text-center flex flex-col items-center">
                <div>
                    Belum terima kode? 
                    <button type="button" id="resendBtn" onclick="resendOtp()" class="text-[#1a3d2b] font-bold hover:underline focus:outline-none ml-1">
                        Kirim ulang
                    </button>
                </div>
                <p id="resendMessage" class="hidden text-xs mt-2"></p>
                <div id="fallbackContainerWrapper" class="w-full mt-2"></div>
            </div>

        </div>
    </div>

    <!-- SCRIPT LOGIC -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // OTP 6 Boxes Logic
            const inputs = document.querySelectorAll('.otp-input');
            const realInput = document.getElementById('real-otp-input');
            const form = document.getElementById('otpForm');

            function updateRealInput() {
                let val = '';
                inputs.forEach(inp => val += inp.value);
                realInput.value = val;
            }

            inputs.forEach((input, index) => {
                input.addEventListener('input', function(e) {
                    this.value = this.value.replace(/[^0-9]/g, '');
                    if (this.value.length === 1 && index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                    updateRealInput();
                });

                input.addEventListener('keydown', function(e) {
                    if (e.key === 'Backspace' && !this.value && index > 0) {
                        inputs[index - 1].focus();
                        inputs[index - 1].value = ''; // Optional: clear previous box
                    }
                });

                input.addEventListener('paste', function(e) {
                    e.preventDefault();
                    const pastedData = e.clipboardData.getData('text').replace(/[^0-9]/g, '').slice(0, 6);
                    if (pastedData) {
                        for (let i = 0; i < pastedData.length; i++) {
                            if (inputs[i]) {
                                inputs[i].value = pastedData[i];
                            }
                        }
                        updateRealInput();
                        const nextFocus = Math.min(pastedData.length, 5);
                        inputs[nextFocus].focus();
                    }
                });
            });

            form.addEventListener('submit', function(e) {
                updateRealInput();
                if (realInput.value.length < 6) {
                    e.preventDefault();
                    alert('Mohon masukkan 6 digit kode OTP secara lengkap.');
                }
            });

            // Cooldown Logic
            const serverCooldown = {{ $cooldownSeconds ?? 0 }};
            if (serverCooldown > 0) {
                startCooldown(serverCooldown);
            }
        });

        function startCooldown(seconds) {
            if (seconds <= 0) return;

            const btn = document.getElementById('resendBtn');
            btn.disabled = true;
            btn.classList.add('opacity-50', 'cursor-not-allowed');
            btn.innerText = `Kirim ulang (${seconds}s)`;
            
            const interval = setInterval(() => {
                seconds--;
                btn.innerText = `Kirim ulang (${seconds}s)`;
                if (seconds <= 0) {
                    clearInterval(interval);
                    btn.disabled = false;
                    btn.classList.remove('opacity-50', 'cursor-not-allowed');
                    btn.innerText = 'Kirim ulang';
                }
            }, 1000);
        }

        function resendOtp(fallbackMethod = null) {
            const btn = document.getElementById('resendBtn');
            const msg = document.getElementById('resendMessage');
            const phone = document.getElementById('phone').value;
            const fallbackContainerWa = document.getElementById('fallbackContainerWa');
            const fallbackContainerEmail = document.getElementById('fallbackContainerEmail');
            
            let method = document.getElementById('otp_method').value;
            if (fallbackMethod) {
                method = fallbackMethod;
                document.getElementById('otp_method').value = method;
            }
            
            const csrfTkn = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            btn.disabled = true;
            btn.innerText = 'Mengirim...';
            msg.classList.add('hidden');
            if(fallbackContainerWa) fallbackContainerWa.classList.add('hidden');
            if(fallbackContainerEmail) fallbackContainerEmail.classList.add('hidden');

            fetch('{{ route("otp.resend") }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfTkn,
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ phone: phone, method: method })
            })
            .then(response => {
                const contentType = response.headers.get('content-type') || '';
                if (contentType.includes('application/json')) {
                    return response.json().then(data => ({status: response.status, body: data}));
                }
                return response.text().then(() => ({
                    status: response.status,
                    body: {
                        success: false,
                        message: response.status === 429
                            ? 'Terlalu banyak permintaan. Silakan coba lagi nanti.'
                            : 'Terjadi kesalahan pada server.'
                    }
                }));
            })
            .then(res => {
                msg.classList.remove('hidden');
                if (res.status === 200) {
                    msg.className = "text-xs mt-2 text-green-600";
                    msg.innerText = res.body.message;
                    startCooldown(60);
                } else if (res.status === 429 && res.body.retry_after) {
                    msg.className = "text-xs mt-2 text-yellow-600";
                    msg.innerText = res.body.message;
                    startCooldown(res.body.retry_after);
                } else {
                    msg.className = "text-xs mt-2 text-red-600";
                    msg.innerText = res.body.message || "Gagal mengirim ulang";
                    btn.disabled = false;
                    btn.innerText = 'Kirim ulang';

                    const wrapper = document.getElementById('fallbackContainerWrapper');

                    if (res.body.suggest_email) {
                        if(!document.getElementById('fallbackContainerEmail')) {
                            const container = document.createElement('div');
                            container.id = 'fallbackContainerEmail';
                            container.className = 'mt-3 w-full';
                            container.innerHTML = `<button type="button" onclick="resendOtp('email')" class="text-sm text-white bg-gray-600 hover:bg-gray-700 font-semibold py-2 px-4 rounded shadow w-full transition-colors">Coba verifikasi melalui Email</button>`;
                            wrapper.appendChild(container);
                        } else {
                            document.getElementById('fallbackContainerEmail').classList.remove('hidden');
                        }
                    }

                    if (res.body.suggest_whatsapp) {
                        if(!document.getElementById('fallbackContainerWa')) {
                            const container = document.createElement('div');
                            container.id = 'fallbackContainerWa';
                            container.className = 'mt-3 w-full';
                            container.innerHTML = `<button type="button" onclick="resendOtp('whatsapp')" class="text-sm text-white bg-green-600 hover:bg-green-700 font-semibold py-2 px-4 rounded shadow w-full transition-colors">Coba verifikasi melalui WhatsApp</button>`;
                            wrapper.appendChild(container);
                        } else {
                            document.getElementById('fallbackContainerWa').classList.remove('hidden');
                        }
                    }
                }
            })
            .catch(err => {
                btn.disabled = false;
                btn.innerText = 'Kirim ulang';
                msg.classList.remove('hidden');
                msg.className = "text-xs mt-2 text-red-600";
                msg.innerText = 'Terjadi kesalahan sistem. Silakan coba lagi.';
            });
        }
    </script>
</body>
</html>
