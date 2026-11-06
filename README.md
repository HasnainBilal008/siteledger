# SiteLedger

**Offline-first construction site and workforce management for Android.**

SiteLedger is a Flutter project for managing construction sites, workers, daily attendance and wages, purchases, income, expenses, and profit/loss reporting. The intended product stores its operational data locally in SQLite and does not depend on a cloud backend.

> **Repository status:** This GitHub repository still contains the initial UI prototype. The fuller SQLite-backed implementation has been prepared separately and must be synchronized into this repository before the project can be considered feature-complete. See [Implementation status](IMPLEMENTATION_STATUS.md).

## Planned app capabilities

- Site creation, editing, status, and location tracking.
- Admin, Accountant, and Manager roles.
- Worker profiles and daily attendance, including in/out times.
- Daily wage calculation and period-based payment sheets.
- Material purchases and expense records.
- Site-wise and combined income, expenses, and profit/loss.
- Daily income-versus-expense graph.
- Offline-first local SQLite storage.

## Requirements

- Flutter stable SDK (Dart 3).
- Android Studio with Android SDK and command-line tools.
- Android emulator or physical Android device.

## Prepare and run

From the project root in PowerShell:

```powershell
flutter create --org com.siteledger --project-name siteledger --platforms=android .
flutter pub get
flutter run
```

If an `android/` directory already exists, skip the `flutter create` command.

## Build a release APK

```powershell
flutter analyze
flutter test
flutter build apk --release
```

APK output:

```text
build\app\outputs\flutter-apk\app-release.apk
```

## Demo accounts

The prototype contains hard-coded demo-only credentials:

| Role | Username | Password |
|---|---|---|
| Admin | `admin` | `admin123` |
| Accountant | `accountant` | `acc123` |
| Manager | `manager` | `manager123` |

These credentials are for demonstration only. The prototype login is not production authentication.

## Documentation

- [Implementation status](IMPLEMENTATION_STATUS.md)
- [Product specification](SiteLedger_Spec.md)
- [Build guide](docs/BUILDING.md)
- [Contributing](CONTRIBUTING.md)

## Data and privacy

The intended full app uses local SQLite storage. This repository's current prototype does not yet implement the complete data model or workflows. Do not use it for real business records. Keep private data, signing keys, and passwords out of Git.

## License

No open-source license has been selected. Until one is added, reuse and redistribution are not automatically granted.
