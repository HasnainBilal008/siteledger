# Testing and acceptance checklist

## Automated checks

Run from the project root:

```powershell
flutter pub get
flutter analyze
flutter test
```

Add regression tests when changing wage calculations, database operations, role permissions, or financial totals.

## Manual Android acceptance test

- [ ] Fresh install launches without a crash.
- [ ] Demo login works only in a demo build; first account setup works in a non-demo build.
- [ ] Admin can manage sites and users.
- [ ] Manager can perform permitted site, worker, and attendance tasks without unrestricted financial access.
- [ ] Accountant can access permitted wage and financial reports.
- [ ] Present, Half, and Absent attendance calculate expected wages.
- [ ] Attendance in/out times are retained.
- [ ] Payment sheets reconcile with attendance for each selected period.
- [ ] Purchase quantity multiplied by rate gives the expected amount.
- [ ] Income, expenses, wages, purchases, and profit/loss totals reconcile.
- [ ] Daily graph matches recorded income and expenses.
- [ ] Data remains after app restart.
- [ ] Core workflows work with Wi-Fi and mobile data disabled.
- [ ] App behavior is checked after device restart.
