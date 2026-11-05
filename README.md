# SiteLedger

Offline-first Flutter Android construction management app.

See SiteLedger_Spec.md for the full build spec and design/ for the 8 user references.

Requirements: Flutter stable, Dart 3, Android SDK.

Run:
``hbash
flutter create --org com.siteledger --project-name siteledger --platforms android .
flutter pub get
flutter run
```

Demo logins: admin/admin123, accountant/acc123, manager/manager123.

All records are stored locally using SQLite. No cloud sync is included by design.

BUILD VERIFICATION: The authoring environment did not have Flutter/Dart, so the source has not been analyzed, tested, or built into an APK yet. See IMPLEMENTATION_STATUS.md.