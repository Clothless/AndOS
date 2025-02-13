# AndOs Security Checker

A Flutter package to check various security measures on Android and iOS devices. This package helps you detect common security vulnerabilities, such as:

- Rooted devices detection
- ADB (USB debugging) status checking
- Debug mode detection
- App signature verification
- Frida (reverse engineering tool) detection
- Emulator detection
- Runtime tampering detection

## Features

### Android

- Check if the device is rooted
- Check if ADB (USB debugging) is enabled
- Check if developer mode is enabled
- Check if the app is debuggable
- Verify the app's signature to detect tampering
- Detect if Frida (a reverse engineering tool) is present
- Check if the app is running on an emulator

### iOS

- Check if the app is running in debug mode
- Check if the app is running on an emulator
- Detect if the app's runtime has been tampered with
- Check if the app is being debugged

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  and_os: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

### Import the Package

```dart
import 'package:and_os/and_os.dart';
```

### Initialize the AndOs Class

```dart
final andOs = AndOs();
```

### Example Usage

```dart
// Check if the device is rooted
bool isRooted = await andOs.isDeviceRooted();
print('Device Rooted: $isRooted');

// Check if ADB is enabled
bool isAdbEnabled = await andOs.isAdbEnabled();
print('ADB Enabled: $isAdbEnabled');

// Check if the app is debuggable
bool isDebuggable = await andOs.isAppDebuggable();
print('App Debuggable: $isDebuggable');

// Verify the app's signature
bool isValidSignature = await andOs.isAppSignatureValid('expectedSignature');
print('Signature Valid: $isValidSignature');

// Detect Frida
bool isFridaDetected = await andOs.isFridaDetected();
print('Frida Detected: $isFridaDetected');

// Check if running on an emulator
bool isEmulator = await andOs.isEmulator();
print('Running on Emulator: $isEmulator');

// iOS: Check if the app is in debug mode
bool isDebugMode = await andOs.isAppInDebugMode('com.example.app');
print('App in Debug Mode: $isDebugMode');

// iOS: Check if the app is being debugged
bool isBeingDebugged = await andOs.isAppBeingDebugged();
print('App Being Debugged: $isBeingDebugged');
```

## API Reference

### Android Methods

| Method Name | Description |
|------------|-------------|
| `isDeviceRooted()` | Checks if the device is rooted |
| `isAdbEnabled()` | Checks if USB debugging (ADB) is enabled |
| `isDeveloperModeEnabled()` | Checks if developer mode is enabled |
| `isAppDebuggable()` | Checks if the app is debuggable |
| `isAppSignatureValid()` | Verifies the app's signature to detect tampering |
| `isFridaDetected()` | Detects if Frida (a reverse engineering tool) is present |
| `isEmulator()` | Checks if the app is running on an emulator |

### iOS Methods

| Method Name | Description |
|------------|-------------|
| `isAppInDebugMode()` | Checks if the app is running in debug mode |
| `isRunningOnEmulator()` | Checks if the app is running on an emulator |
| `isRuntimeTampered()` | Detects if the app's runtime has been tampered with |
| `isAppBeingDebugged()` | Checks if the app is being debugged |


## Contributing

Contributions are welcome! If you find a bug or want to add a new feature, please open an issue or submit a pull request.


## Support

If you find this package useful, consider giving it a ⭐️ on GitHub.
