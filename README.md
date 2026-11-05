# SiteLedger

Offline-first construction site management for Android, built with Flutter and SQLite.

## Features
- Role-based access: Admin, Accountant, Manager
- Site and worker management
- Attendance and wage calculations
- Purchases, income, expenses, and profit/loss
- Local SQLite storage; no cloud dependency for core app data

## Getting started
1. Install Flutter stable and Android Studio / Android SDK.
2. Run `flutter pub get`.
3. Run `flutter analyze`.
4. Run `flutter test`.
5. Run `flutter run` on an Android device or emulator.

## Demo accounts
- Admin: `admin` / `admin123`
- Accountant: `accountant` / `acc123`
- Manager: `manager` / `manager123`

> Demo credentials are for local development only. Replace them with secure account management before production release.

## Architecture
Flutter UI + SQLite local persistence. The app is designed to keep working offline. Supabase is intentionally not used for core records because the product specification requires offline-only behavior.
