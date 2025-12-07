#!/bin/bash
# Auto Install XFCE + xRDP Ubuntu VPS - Jalankan sebagai root atau dengan sudo

echo "=== Mulai Auto Install Desktop + RDP Ubuntu VPS ==="
sudo apt update && sudo apt upgrade -y
sudo apt install -y xfce4 xfce4-goodies xorg dbus-x11 xrdp lightdm wget curl

# Konfigurasi sesi XFCE untuk semua user
echo "xfce4-session" | sudo tee /etc/xrdp/startwm.sh
sudo chmod +x /etc/xrdp/startwm.sh

# Buat konfigurasi user session
echo "xfce4-session" > ~/.xsession
chmod 755 ~/.xsession

# Add xrdp ke grup ssl-cert
sudo adduser xrdp ssl-cert

# Start & enable services
sudo systemctl start xrdp
sudo systemctl enable xrdp
sudo systemctl start lightdm
sudo systemctl enable lightdm

# Konfigurasi firewall
sudo ufw allow 3389/tcp 2>/dev/null || true
sudo ufw --force enable 2>/dev/null || true
sudo ufw allow ssh 2>/dev/null || true

# Optimasi VPS (opsional)
sudo apt install -y htop nano curl

echo "=== INSTALASI SELESAI! ==="
echo "IP VPS: $(curl -s ifconfig.me)"
echo "Port RDP: 3389"
echo "Username/Password: SSH credentials Anda"
echo "Koneksi: mstsc.exe -> masukkan IP VPS"
echo ""
echo "Status xRDP: sudo systemctl status xrdp"
echo "Log error: tail -f /var/log/xrdp.log"
