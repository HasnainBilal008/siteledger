# Contributing to SiteLedger

Thanks for helping improve SiteLedger. Keep changes focused and preserve the offline-first requirement unless the product owner approves a change.

## Development checks

```powershell
flutter doctor -v
flutter pub get
flutter analyze
flutter test
```

For Android changes, also run `flutter build apk --release` and test on an emulator or physical device.

## Pull request checklist

- Explain the user problem and the change.
- Keep operational data local; do not introduce cloud calls or internet permissions without approval.
- Add or update tests for calculations, database changes, and role permissions.
- Include screenshots for UI changes.
- Do not commit passwords, signing keys, keystores, private business data, or generated build output.
- Update documentation when setup or behavior changes.

## Bug reports

Include device/Android version, Flutter version, reproduction steps, expected and actual behavior, and complete error output. Remove private worker, customer, and financial information from logs and screenshots.
