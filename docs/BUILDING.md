# Building SiteLedger for Android

## Prerequisites

Install Flutter stable and Android Studio with Android SDK and command-line tools. Run `flutter doctor -v` and resolve Android toolchain issues.

## Generate Android files

From the repository root:

```powershell
flutter create --org com.siteledger --project-name siteledger --platforms=android .
```

Only run this if the `android/` folder is missing. Review generated files before committing them.

## Resolve and verify

```powershell
flutter pub get
flutter analyze
flutter test
```

## Build APK

```powershell
flutter build apk --release
```

The APK is written to `build\app\outputs\flutter-apk\app-release.apk`.

Before distributing, test a fresh install and an upgrade, verify role permissions and financial calculations, confirm offline behavior, and configure release signing securely. Never commit signing keys or passwords.
