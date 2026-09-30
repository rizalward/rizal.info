# ЯBOWZR Android offshoot

This is the Android face of the same CHANNEL Я shell. The APK is the stable
native host; the packaged gold egg is the offline fallback.

## Remote update boundary

The Android host checks the live feed at:

`https://rizal.info/rbowzr/android/updates/index.json`

Future shell assets, `.RZL` eggs, and revealed tiles can be published there
without rebuilding the APK. A new APK is required only when native host code,
permissions, or Android intent registration changes.

The current transport egg remains the same cross-device package:

`CHANNEL-YA-SUPER-DYNAMIC-PYGMY.rzl`

It retains the embedded gold-dragon-egg identity and platform adapters for
Android, iOS, iPadOS, Linux, and macOS.
