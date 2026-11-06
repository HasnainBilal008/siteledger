# Architecture overview

The target application is a single-device Flutter app. Core workflows are intended to run without a server or network connection.

## Main source areas

- `lib/main.dart`: app startup, state, navigation, and screens.
- `lib/db/database.dart`: SQLite schema, persistence, local accounts, sessions, and demo seed data.
- `lib/calc.dart`: pure calculation helpers such as daily wage calculations.
- `lib/permissions.dart`: role permission rules for Admin, Accountant, and Manager.
- `lib/theme.dart`: shared theme and design tokens.

These paths describe the prepared full implementation and should be checked against the files present after source synchronization.

## Data model

The intended local SQLite schema contains users, app session state, sites, workers, attendance, purchases, and income/expense entries. Worker and transaction records are related to sites through foreign keys. Attendance is intended to be unique per worker and date.

## Boundaries

There is no cloud synchronization or remote database in the product requirements. Local storage is not a substitute for tested backup/restore functionality or comprehensive device security. Review authentication and data protection before production use.
