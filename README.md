# PowerBarn Flasher

Browser-flasher voor PowerBarn (custom MeshCore) firmware op de **Heltec V3 (ESP32-S3)**, gebouwd op
[ESP Web Tools](https://esphome.github.io/esp-web-tools/) (WebSerial).

**Live:** https://jwdnl.github.io/PowerBarn-flasher/

## Gebruik
1. Open de live-pagina in **Chrome** of **Edge** (WebSerial is Chromium-only).
2. Sluit de Heltec V3 via USB aan; houd zo nodig de **BOOT**-knop ingedrukt bij het verbinden.
3. Klik **Install** en volg de stappen (poort kiezen → erase → flash).
4. Optioneel: vul **SSID + wachtwoord** in en klik **WiFi naar device sturen**. De pagina stuurt onze
   `set wifi.ssid` / `set wifi.pwd`-commando's over de seriële poort en herstart het device.
   > Dit werkt zodra de firmware met de tekst-console (firmware-Fase 4) erop staat.

De nRF52 **Seeed Solar Node** flash je los via **UF2** (drag-drop), niet via deze tool.

## Een nieuwe firmware-bin publiceren
De firmware-source staat (privé) in `PowerBarn-MC`. Bouw daar de Heltec-build en maak één merged
factory-bin, en publiceer die hierheen:

```powershell
# vanuit deze repo:
./publish-firmware.ps1 -BinPath "C:\pad\naar\merged.bin" -Version v0.16b
```

Het script kopieert de bin naar `firmware/powerbarn-heltec-v3-<versie>.bin`, commit en pusht.
Controleer dat `manifests/heltec-v3.json` naar de juiste bestandsnaam wijst.

## Structuur
- `index.html` — de flash-pagina (install-knop + WiFi-console)
- `manifests/heltec-v3.json` — ESP Web Tools manifest (ESP32-S3, merged bin @ offset 0)
- `firmware/` — gepubliceerde `.bin`'s
- `publish-firmware.ps1` — bin publiceren vanuit een PowerBarn-MC build
