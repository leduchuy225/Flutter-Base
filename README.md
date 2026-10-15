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

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
