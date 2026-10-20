# ARC_SetGlowGuard (ESO Addon)

<p align="center">
  <img src="./screenshots/equipped_preview.png" alt="ARC_SetGlowGuard In-Game Preview" width="280" />
</p>

**ARC_SetGlowGuard**, *The Elder Scrolls Online* (ESO) oyuncularının set parçalarını yanlışlıkla çıkarmasını, çantasında kaybetmesini veya eksik setle gezmesini engellemek için geliştirilmiş hafif ve güçlü bir UI eklentisidir.

---

## 🌟 Özellikler

1. **Giyili Setleri Otomatik Eşleştirme ve Renklendirme (Glow)**:
   - Üzerinizde bulunan zırh, takı ve silah setlerini algılar.
   - Aynı sete ait olan tüm eşyaları aynı renkte (Cyan, Amber, Neon Mor, Zümrüt Yeşili vb.) canlı bir glow (parlama) efektiyle belirginleştirir.
   - Mythic eşyalar kendine has özel bir renkle parlar.

2. **'I' Tuşu Entegrasyonu (Envanter + Karakter Paneli)**:
   - 'I' tuşuna bastığınızda varsayılan olarak sol tarafa Karakter Ekipman paneli (`ZO_Character`) eklenir ve çantanızla yan yana açılır.
   - Böylece hem giydiğiniz set parçalarını hem de çantanızdaki eşyaları aynı anda, tek bakışta görebilirsiniz.
   - İstenirse bu özellik ayarlar menüsünden kapatılabilir.

3. **Çantadaki Eşleşen Set Parçalarının Parlaması**:
   - Yanlışlıkla setinizden bir parça çıkarıp çantanıza attığınızda, o eşya çantanızda giyili olan setinizin rengiyle parlar ve sol kenarında renkli şerit belirir.
   - Çantayı açar açmaz "Bu benim çıkardığım set parçam!" diyerek hemen fark edebilirsiniz.

4. **Eksik Set Uyarısı (Incomplete Alert)**:
   - Örneğin 5 parçalık bir setin sadece 4 parçasını taktıysanız veya yanlışlıkla bir parçasını çıkardıysanız, slotun üzerinde belirgin bir uyarı (örn. `4/5` veya `1/2`) görünür.

5. **Gelişmiş Ayarlar Menüsü (LibAddonMenu-2.0)**:
   - Eklentiyi açıp/kapatma.
   - Parlaklık şiddeti (Glow Intensity) ve parlama dokusu seçimi (Action Bar Glow, Soft Magic, Pulse).
   - Her set için özel renk seçici (Colorpicker).

6. **@arcsinan İçin Gold Donate Sistemi**:
   - Ayarlar panelinde yer alan tek tıkla altın bağışlama butonları (`5,000`, `25,000`, `100,000` Gold veya Özel Tutar).
   - Tıklandığında oyun içi posta ekranını (`mailSend`) otomatik açar, alıcıyı `@arcsinan`, konuyu `ARC_SetGlowGuard Donation` olarak doldurur ve altını ekler.

---

## 📁 Kurulum

Eklenti `/home/arcsinan/Projeler/eso_set_mark` dizininde oluşturulmuş ve ESO AddOns klasörüne (`Documents/Elder Scrolls Online/live/AddOns/ARC_SetGlowGuard`) sembolik bağlantı (symlink) ile bağlanmıştır.

Oyundayken eklentiyi yüklemek için sohbet satırına:
```text
/reloadui
```
yazmanız yeterlidir.

---

## ⚙️ Gereksinimler

- **LibAddonMenu-2.0** (Ayarlar paneli için - sisteminizde halihazırda kuruludur).
