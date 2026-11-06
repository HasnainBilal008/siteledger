# SiteLedger — Product specification

## Goal

Build an Android application for small construction teams to manage multiple sites, labour, attendance, wages, purchases, income, expenses, and profitability. Core workflows must work fully offline.

## User roles

- **Admin:** manage sites and users and access all reports.
- **Accountant:** record and review financial information and wage/payment reports.
- **Manager:** manage assigned site operations, workers, and attendance without unrestricted access to financial totals.

Exact role permissions must be enforced in the application, not only hidden in the interface.

## Functional requirements

1. Site management: create, edit, and delete sites; store name, location, start/end dates, and status.
2. Workers: create and manage workers per site, including agreed daily wage.
3. Attendance: record each worker's daily status (Present, Half, or Absent) and in/out times.
4. Wages: calculate daily wages from the worker's rate and attendance status.
5. Payment sheets: show individual and total wages over daily, weekly, monthly, and custom periods.
6. Purchases: record material/item, quantity, unit, rate, date, and calculated amount.
7. Income and expenses: record dated financial entries against a site.
8. Profit and loss: calculate site-wise and combined income, wages, purchases, other expenses, and net result.
9. Progress graph: compare daily income and expenses over a selected period.
10. Local accounts: support Admin, Accountant, and Manager roles.

## Offline and data requirements

- Store app records in a local SQLite database.
- Core features must work with Wi-Fi and mobile data disabled.
- No cloud backend or synchronization is required.
- Use database foreign keys and constraints to protect relationships and prevent duplicate attendance for a worker/date.
- Clearly communicate that uninstalling or clearing app data may remove local records; a backup/export feature is a future requirement.

## Non-functional requirements

- Provide a clear, consistent mobile interface.
- Validate required fields and date ranges.
- Use integer currency amounts where appropriate and consistent rounding rules for wage calculations.
- Include tests for wage calculations, permissions, and financial totals.
- Do not ship demo credentials as production authentication.

## Acceptance criteria

A tester must be able to create a site, add workers, record attendance and in/out times, verify calculated wages, record purchases and financial entries, reconcile profit/loss, and view the daily income-versus-expense graph. Data must remain available after app restart and core workflows must remain usable offline.

The design references supplied with the project are stored in the `design/` directory when the complete source package is synchronized.
