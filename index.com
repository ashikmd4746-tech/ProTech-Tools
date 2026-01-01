<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Ashik Creative Tools</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="theme-color" content="#0f2027">

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:Segoe UI,sans-serif}
body{
background:linear-gradient(160deg,#0f2027,#203a43,#2c5364);
min-height:100vh;color:#fff;
display:flex;justify-content:center;align-items:center}

/* LOGIN */
.login-box{
width:90%;max-width:360px;
background:rgba(255,255,255,0.1);
padding:25px;border-radius:20px;
box-shadow:0 0 25px rgba(0,255,213,.4);
text-align:center}
.login-box h2{margin-bottom:20px}
.login-box input{
width:100%;padding:12px;margin:10px 0;
border:none;border-radius:10px;outline:none}
.login-box button{
width:100%;padding:12px;
border:none;border-radius:12px;
background:#00ffd5;font-weight:bold;cursor:pointer}
.error{color:#ff6b6b;margin-top:10px}

/* APP */
.app{display:none;width:100%;max-width:430px;padding:15px}
h1{text-align:center;margin:15px 0;text-shadow:0 0 15px #00ffd5}
.section-title{margin:20px 5px 10px;font-weight:bold}
.tools{display:grid;grid-template-columns:1fr 1fr;gap:15px}
.tool{
background:rgba(255,255,255,0.1);
border-radius:18px;padding:20px;
text-align:center;cursor:pointer;
box-shadow:0 8px 20px rgba(0,255,213,.25);
transition:.3s}
.tool:hover{transform:scale(1.05)}
.footer{text-align:center;margin:20px 0;font-size:12px;opacity:.7}

/* MODAL */
.modal{
display:none;position:fixed;
top:0;left:0;width:100%;height:100%;
background:rgba(0,0,0,.85);
justify-content:center;align-items:center;z-index:999}
.modal-content{
background:#0f2027;
width:92%;max-width:520px;
padding:20px;border-radius:20px;
max-height:85vh;overflow:auto}
.cmd{
background:#000;padding:12px;margin:12px 0;
border-radius:12px;font-size:13px;white-space:pre-line}
.copy-btn{
background:#00ffd5;border:none;
padding:10px;width:100%;
border-radius:12px;font-weight:bold;cursor:pointer;margin-bottom:10px}
.close-btn{
margin-top:10px;width:100%;
padding:10px;border-radius:12px;
background:#00ffd5;border:none;font-weight:bold}
</style>
</head>

<body>

<!-- LOGIN -->
<div class="login-box" id="loginBox">
<h2>🔐 Login</h2>
<input id="username" placeholder="Username">
<input id="password" type="password" placeholder="Password">
<button onclick="login()">Login</button>
<div class="error" id="error"></div>
</div>

<!-- APP -->
<div class="app" id="app">
<h1>🚀 Ashik Creative Tools</h1>

<div class="section-title">📥 Video Downloader</div>
<div class="tools">
<div class="tool" onclick="openLink('https://fdown.net/download.php')">FB Video</div>
<div class="tool" onclick="openLink('https://vidssave.com/yt')">YouTube</div>
<div class="tool" onclick="openLink('https://ssstik.io/en-1')">TikTok</div>
<div class="tool" onclick="openLink('https://pindown.io/en1')">Pinterest</div>
</div>

<div class="section-title">⚙️ Termux Tools</div>
<div class="tools">
<div class="tool" onclick="openLink('https://f-droid.org/en/packages/com.termux/')">Termux App</div>
<div class="tool" onclick="showBasic()">Basic Setup</div>
<div class="tool" onclick="showAdvanced()">Advanced</div>
</div>

<div class="footer">© 2025 Ashik Creative Tools</div>
</div>

<!-- MODAL -->
<div class="modal" id="modal">
<div class="modal-content" id="modalContent"></div>
</div>

<script>
function login(){
if(username.value==="ashik" && password.value==="bbbb"){
loginBox.style.display="none";
app.style.display="block";
}else{error.innerText="❌ Wrong Username or Password";}
}
function openLink(u){window.open(u,"_blank")}
function copyText(t){navigator.clipboard.writeText(t);alert("Copied ✅")}

/* BASIC */
function showBasic(){
modalShow(`
<h3>⚙️ Termux Full Basic Setup</h3>
<div class="cmd">
termux-change-repo

pkg update && pkg upgrade -y

termux-setup-storage

pkg install git -y
pkg install python -y
pkg install python2 -y
pkg install pip -y
pkg install wget -y
pkg install curl -y
pkg install nano -y
pkg install unzip -y
pkg install zip -y
pkg install clang -y
pkg install make -y
pkg install openssl -y
pkg install openssh -y

pip install --upgrade pip
pip install requests
pip install mechanize
pip install bs4
pip install rich
</div>

<button class="copy-btn" onclick="copyText(\`termux-change-repo

pkg update && pkg upgrade -y

termux-setup-storage

pkg install git -y
pkg install python -y
pkg install python2 -y
pkg install pip -y
pkg install wget -y
pkg install curl -y
pkg install nano -y
pkg install unzip -y
pkg install zip -y
pkg install clang -y
pkg install make -y
pkg install openssl -y
pkg install openssh -y

pip install --upgrade pip
pip install requests
pip install mechanize
pip install bs4
pip install rich\`)">COPY ALL BASIC COMMANDS</button>

<button class="close-btn" onclick="closeModal()">Close</button>
`)
}

/* ADVANCED */
function showAdvanced(){
modalShow(`
<h3>🔥 Termux Advanced Commands</h3>

<div class="cmd">1️⃣ FB UID Lookup</div>
<button class="copy-btn" onclick="copyText(\`pkg install git
pkg install python
git clone https://github.com/SHIHAB-X/FB-RECOVERY
cd FB-RECOVERY
pip install -r requirements.txt
python Recovery.py
cd FB-RECOVERY
python Recovery.py\`)">COPY</button>

<div class="cmd">2️⃣ FB Create Tool</div>
<button class="copy-btn" onclick="copyText(\`rm -rf OLD-CLONE
git clone https://github.com/SHIHAB-X/OLD-CLONE
cd OLD-CLONE
pip install -r requirements.txt
python OLD-CLONE.py\`)">COPY</button>

<div class="cmd">3️⃣ SMS Bomber</div>
<button class="copy-btn" onclick="copyText(\`pip install requests
git clone https://github.com/bdmasumvai/MasumVaiBD-sms-bomber-.git
cd MasumVaiBD-sms-bomber-
python masumvaibdgifts.py\`)">COPY</button>

<div class="cmd">4️⃣ IP Unblock</div>
<button class="copy-btn" onclick="copyText('https://check.spamhaus.org/')">COPY LINK</button>

<div class="cmd">5️⃣ FB UID Lookup Site</div>
<button class="copy-btn" onclick="copyText('https://lookup-id.com/')">COPY LINK</button>

<div class="cmd">6️⃣ FB ID Report</div>
<button class="copy-btn" onclick="copyText(\`apt update && apt upgrade -y
pkg install git python python2 -y
pip2 install mechanize requests
git clone https://github.com/IlayTamvan/Report.git
cd Report
chmod +x *
unzip Report.zip
python2 Report.py\`)">COPY</button>

<div class="cmd">7️⃣ Termux Fire</div>
<button class="copy-btn" onclick="copyText(\`pkg install libcaca -y
cacafire\`)">COPY</button>

<div class="cmd">8️⃣ Kali Linux</div>
<button class="copy-btn" onclick="copyText(\`pkg update && pkg upgrade -y
pkg install wget -y
wget https://offs.ec/2MceZWr -O install-nethunter-termux
chmod +x install-nethunter-termux
./install-nethunter-termux\`)">COPY</button>

<div class="cmd">9️⃣ IP Hopper</div>
<button class="copy-btn" onclick="copyText(\`apt update && apt upgrade -y
pkg install bash git tor privoxy netcat-openbsd curl -y
git clone https://github.com/thakur2309/IP-HOPPRR-.git
cd IP-HOPPRR-
bash setup.sh
bash iphopper.sh\`)">COPY</button>

<button class="close-btn" onclick="closeModal()">Close</button>
`)
}

function modalShow(h){
modal.style.display="flex";
modalContent.innerHTML=h;
}
function closeModal(){modal.style.display="none";}
</script>

</body>
</html>
