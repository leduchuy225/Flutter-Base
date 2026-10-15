# flutter_base

A new Flutter project.

## Getting Started

### Flutter SDK and iOS

Use the project-pinned Flutter SDK (3.47.7) through [FVM](https://fvm.app/):

```sh
fvm install
fvm flutter pub get
cd ios
pod install
cd ..
fvm flutter run
```

When using VS Code, select `.fvm/flutter_sdk` as the Flutter SDK.

The iOS runner uses Flutter's scene-based lifecycle and requires Flutter 3.41
or newer. Xcode 27 requires UIScene adoption; increasing the deployment target
in the Podfile alone does not resolve launch failures. Plugin registration
occurs when the implicit Flutter engine initializes, while Firebase is configured
in the application delegate before scene creation. Native dependencies continue
to use CocoaPods; automatic Swift Package Manager migration is disabled for
this project.

### Android builds

Use `fvm flutter build apk --dart-define=ENV=DEV` for development or
`fvm flutter build apk --release --dart-define=ENV=PROD` for production.
The corresponding VS Code tasks also copy the APK to `app-release.apk` in
the project root.

The Android build uses Gradle 8.14.4, Android Gradle Plugin 8.11.1, and Kotlin
2.2.20 to meet Flutter 3.47.7's minimum requirements while retaining AGP 8.
Flutter reports future-support warnings for these versions; they do not prevent
building. Do not bypass build dependency validation to use the older toolchain.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
