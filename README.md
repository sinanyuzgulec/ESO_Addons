# ESO_Addons

Bu depo, *The Elder Scrolls Online* (ESO) için geliştirilmiş özel arayüz ve yaşam kalitesi (QoL) eklentilerini tek çatı altında toplayan monorepo projesidir.

Geliştirici: **@arcsinan** ([GitHub](https://github.com/sinanyuzgulec))

---

## 📦 Mevcut Eklentiler

### 1. [ARC_SetGlowGuard](./ARC_SetGlowGuard)
* **Açıklama**: Giyili zırh, takı ve silah setlerini algılayarak aynı sete ait parçaları ortak canlı renklerle (Glow) parlatır. Yanlışlıkla set parçası çıkarılmasını, çantada kaybolmasını veya eksik parçayla gezilmesini önler.
* **Özellikler**:
  - Giyili set parçalarını otomatik gruplandırıp renklendirme.
  - 'I' tuşuna basıldığında Envanter ile Karakter Ekipman panelini yan yana açma.
  - Çantada duran eşleşen set parçalarını aynı renkte parlatma ve kenar şeridi ekleme.
  - Eksik set parçası uyarısı (örn. `4/5`).
  - LibAddonMenu-2.0 ayar paneli ve `@arcsinan` için oyun içi gold bağış sistemi.

---

## 🚀 Kurulum & Sembolik Bağlantı (Symlink)

Herhangi bir eklentiyi ESO oyununuza eklemek için ilgili eklenti klasörünü oyunun `AddOns` dizinine bağlamanız yeterlidir:

```bash
# ARC_SetGlowGuard için:
ln -s "$HOME/Projeler/ESO_Addons/ARC_SetGlowGuard" "$HOME/Documents/Elder Scrolls Online/live/AddOns/ARC_SetGlowGuard"
```

Oyundayken sohbete:
```text
/reloadui
```
yazarak eklentileri anında yükleyebilirsiniz.
