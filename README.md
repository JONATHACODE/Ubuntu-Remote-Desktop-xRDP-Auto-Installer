# Ubuntu Remote Desktop (xRDP) Auto Installer

Script otomatis untuk menginstall XFCE Desktop Environment dan xRDP server pada Ubuntu VPS, memungkinkan akses remote desktop melalui Windows Remote Desktop Connection.

## 📋 Fitur

- ✅ Instalasi otomatis XFCE Desktop Environment
- ✅ Konfigurasi xRDP server
- ✅ Setup firewall (port 3389)
- ✅ Optimasi sistem VPS
- ✅ Konfigurasi otomatis untuk semua user
- ✅ Support Windows Remote Desktop Connection

## 🖥️ Sistem Requirement

- **OS**: Ubuntu 18.04 / 20.04 / 22.04 / 24.04
- **RAM**: Minimal 1GB (Rekomendasi 2GB+)
- **Storage**: Minimal 10GB free space
- **Access**: Root atau sudo privileges

## 🚀 Cara Penggunaan

### 1. Download Script

```bash
wget https://raw.githubusercontent.com/JONATHACODE/Ubuntu-Remote-Desktop-xRDP-Auto-Installer/refs/heads/main/ubunturemote.sh
```

atau

```bash
curl -O https://raw.githubusercontent.com/JONATHACODE/Ubuntu-Remote-Desktop-xRDP-Auto-Installer/refs/heads/main/ubunturemote.sh
```

### 2. Berikan Permission Execute

```bash
chmod +x ubunturemote.sh
```

### 3. Jalankan Script

```bash
sudo ./ubunturemote.sh
```

atau jika sudah login sebagai root:

```bash
./ubunturemote.sh
```

### 4. Tunggu Proses Instalasi

Script akan otomatis:
- Update & upgrade sistem
- Install XFCE dan komponen pendukung
- Konfigurasi xRDP
- Setup firewall
- Enable services

## 🔌 Cara Koneksi

### Dari Windows

1. Buka **Remote Desktop Connection** (tekan `Win + R`, ketik `mstsc`)
2. Masukkan **IP Address VPS** Anda
3. Klik **Connect**
4. Login dengan **username dan password SSH** VPS Anda
5. Pilih session type: **Xorg**

### Dari Linux

```bash
rdesktop IP_VPS:3389
```

atau gunakan Remmina

### Dari MacOS

Install **Microsoft Remote Desktop** dari App Store, kemudian koneksi ke IP VPS port 3389

## 🛠️ Troubleshooting

### Cek Status xRDP

```bash
sudo systemctl status xrdp
```

### Restart xRDP Service

```bash
sudo systemctl restart xrdp
```

### Lihat Log Error

```bash
tail -f /var/log/xrdp.log
```

### Cek Firewall

```bash
sudo ufw status
```

### Jika Tidak Bisa Koneksi

1. Pastikan port 3389 terbuka:
   ```bash
   sudo ufw allow 3389/tcp
   ```

2. Cek apakah xRDP running:
   ```bash
   sudo systemctl start xrdp
   ```

3. Cek IP VPS Anda:
   ```bash
   curl ifconfig.me
   ```

## 📦 Package yang Terinstall

- **xfce4** - Desktop Environment
- **xfce4-goodies** - Extra plugins untuk XFCE
- **xorg** - X Window System
- **dbus-x11** - D-Bus X11 protocol bindings
- **xrdp** - Remote Desktop Protocol server
- **lightdm** - Display Manager
- **htop** - Process monitoring
- **wget & curl** - Download utilities

## 🔒 Keamanan

⚠️ **Penting untuk Produksi:**

1. **Ganti Password Default**
   ```bash
   passwd
   ```

2. **Setup SSH Key Authentication**
3. **Disable Password Authentication di SSH**
4. **Gunakan Firewall dengan Strict Rules**
5. **Update Sistem Secara Berkala**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

## 🔧 Uninstall

Jika ingin menghapus instalasi:

```bash
sudo apt remove --purge xfce4 xfce4-goodies xrdp lightdm -y
sudo apt autoremove -y
```

## 📝 Catatan

- Script ini dioptimasi untuk VPS dengan resource terbatas
- XFCE dipilih karena ringan dan cepat
- Port default xRDP adalah **3389**
- Pastikan provider VPS Anda tidak memblokir port 3389

## 🤝 Kontribusi

Pull requests are welcome! Untuk perubahan besar, silakan buka issue terlebih dahulu untuk diskusi.

## 📄 License

[MIT](https://choosealicense.com/licenses/mit/)

## ⭐ Support

Jika script ini membantu, berikan ⭐ pada repository ini!

---

**Dibuat dengan ❤️ untuk komunitas**

