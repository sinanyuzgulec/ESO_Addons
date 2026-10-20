# ESO_Addons

Bu depo, *The Elder Scrolls Online* (ESO) için geliştirilmiş özel arayüz, yaşam kalitesi (QoL) ve veri otomasyon araçlarını tek çatı altında toplayan monorepo projesidir.

Geliştirici: **@arcsinan** ([GitHub](https://github.com/sinanyuzgulec))

---

## 📦 Mevcut Araçlar & Eklentiler

### 1. [ARC_SetGlowGuard](./ARC_SetGlowGuard)
* **Kategori**: Oyun İçi Arayüz (AddOn)
* **Açıklama**: Giyili zırh, takı ve silah setlerini algılayarak aynı sete ait parçaları ortak canlı renklerle (Glow) parlatır. Yanlışlıkla set parçası çıkarılmasını, çantada kaybolmasını veya eksik parçayla gezilmesini önler.
* **Görsel Önizleme**:
  <p align="center">
    <img src="./ARC_SetGlowGuard/screenshots/equipped_preview.png" alt="ARC_SetGlowGuard In-Game Equipment Preview" width="240" />
  </p>
* **Önemli Özellikler**:
  - Giyili set parçalarını otomatik gruplandırıp renklendirme (Cyan, Amber, Mor, Zümrüt Yeşili vb.).
  - `I` tuşuna basıldığında Envanter ile Karakter Ekipman panelini (`ZO_Character`) yan yana açma.
  - Çantada duran eşleşen set parçalarını aynı renkte parlatma ve sol kenarına belirgin şerit ekleme.
  - Eksik set parçası uyarısı (örn. `4/5`).
  - LibAddonMenu-2.0 ayar paneli ve `@arcsinan` için oyun içi tek tıkla altın bağışlama sistemi.

### 2. [ARC_TTC_PriceTable_python_workaround](./ARC_TTC_PriceTable_python_workaround)
* **Kategori**: Harici Senkronizasyon & Otomasyon Aracı (CLI & Daemon)
* **Açıklama**: Tamriel Trade Centre (TTC) fiyat tablolarını (`PriceTableEU.lua` / `PriceTableNA.lua`) otomatik olarak indiren ve güncelleyen hafif, sıfır bağımlılıklı Python aracı.
* **Önemli Özellikler**:
  - Özellikle Linux (Steam Deck, Proton, Lutris) ve macOS kullanıcıları için Windows `.NET Client.exe` bağımlılığını tamamen ortadan kaldırır.
  - 12 saatte bir arka planda otomatik çalışan `systemd --user` servisi (Linux), Task Scheduler (Windows) ve `launchd` (macOS).
  - Güvenli LUA veri çıkarma ve arşiv doğrulama.
  - Geliştirici destek ve oyun içi altın bağış bilgilendirmesi (`--donate`).

---

## 🚀 Kurulum & Sembolik Bağlantılar (Symlink)

### ARC_SetGlowGuard AddOn Kurulumu:
Oyununuzun `AddOns` klasörüne sembolik bağlantı oluşturun:
```bash
ln -s "$HOME/Projeler/ESO_Addons/ARC_SetGlowGuard" "$HOME/Documents/Elder Scrolls Online/live/AddOns/ARC_SetGlowGuard"
```
Oyundayken sohbete `/reloadui` yazarak hemen kullanmaya başlayabilirsiniz.

### ARC_TTC_PriceTable_Sync Kurulumu:
```bash
cd "$HOME/Projeler/ESO_Addons/ARC_TTC_PriceTable_python_workaround"
# Durumu kontrol et
python3 main.py --status
# Hemen güncelle
python3 main.py --sync
# 12 saatte bir otomatik güncelleyen arka plan servisini kur
./setup_service.sh
```

---

## 💛 Geliştirici Desteği & Bağış

Eklenti ve araçları faydalı buluyorsanız geliştiriciye *The Elder Scrolls Online* içerisinde doğrudan altın bağışı gönderebilirsiniz:

- **Oyun İçi Alıcı**: `@arcsinan` (EU & NA Megaserver)
- **ARC_SetGlowGuard**: `Settings -> Addon Settings -> ARC_SetGlowGuard` menüsünden tek tıkla altın gönderme.
- **TTC Sync**: `python3 main.py --donate`
