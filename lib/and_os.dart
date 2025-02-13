import 'and_os_platform_interface.dart';

class AndOs {
  /// Retrieves the platform version of the device.
  ///
  /// This method returns the version of the operating system running on the device.
  ///
  /// Example:
  /// ```dart
  /// String? version = await AndOs().getPlatformVersion();
  /// print('Platform Version: $version');
  /// ```
  Future<String?> getPlatformVersion() {
    return AndOsPlatform.instance.getPlatformVersion();
  }

  /// Checks if USB debugging (ADB) is enabled on the device.
  ///
  /// This method checks whether the ADB (Android Debug Bridge) option is enabled
  /// in the device's developer settings.
  ///
  /// Returns `true` if ADB is enabled, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isAdbEnabled = await AndOs().isAdbEnabled();
  /// print('ADB Enabled: $isAdbEnabled');
  /// ```
  Future<bool> isAdbEnabled() {
    return AndOsPlatform.instance.isAdbEnabled();
  }

  /// Checks if the device is rooted.
  ///
  /// This method checks for the presence of common files and directories
  /// that indicate the device has been rooted.
  ///
  /// Returns `true` if the device is rooted, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isRooted = await AndOs().isDeviceRooted();
  /// print('Device Rooted: $isRooted');
  /// ```
  Future<bool> isDeviceRooted() {
    return AndOsPlatform.instance.isDeviceRooted();
  }

  /// Checks if developer mode is enabled on the device.
  ///
  /// This method checks whether the developer mode is active on the device.
  ///
  /// Returns `true` if developer mode is enabled, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isDeveloperModeEnabled = await AndOs().isDeveloperModeEnabled();
  /// print('Developer Mode Enabled: $isDeveloperModeEnabled');
  /// ```
  Future<bool> isDeveloperModeEnabled() {
    return AndOsPlatform.instance.isDeveloperModeEnabled();
  }

  /// Checks if the app is debuggable.
  ///
  /// This method checks whether the app is running in debug mode by checking
  /// for the presence of the `FLAG_DEBUGGABLE` flag in the app's manifest.
  ///
  /// Returns `true` if the app is debuggable, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isDebuggable = await AndOs().isAppDebuggable();
  /// print('App Debuggable: $isDebuggable');
  /// ```
  Future<bool> isAppDebuggable() {
    return AndOsPlatform.instance.isAppDebuggable();
  }

  /// Checks if the app's signature matches the expected signature.
  ///
  /// This method verifies that the app's signature matches the provided
  /// base64-encoded SHA-256 signature. This is useful for detecting if the app
  /// has been tampered with or re-signed.
  ///
  /// [signature] The expected base64-encoded SHA-256 signature of the app.
  ///
  /// Returns `true` if the signature matches, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isValid = await AndOs().isAppSignatureValid('expectedSignature');
  /// print('Signature Valid: $isValid');
  /// ```
  Future<bool> isAppSignatureValid(String signature) {
    return AndOsPlatform.instance.isAppSignatureValid(signature);
  }

  /// Checks if Frida (a reverse engineering tool) is detected on the device.
  ///
  /// This method checks for the presence of Frida-related files on the device,
  /// which are commonly used for reverse engineering and dynamic instrumentation.
  ///
  /// Returns `true` if Frida is detected, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isFridaDetected = await AndOs().isFridaDetected();
  /// print('Frida Detected: $isFridaDetected');
  /// ```
  Future<bool> isFridaDetected() {
    return AndOsPlatform.instance.isFridaDetected();
  }

  /// Checks if the app is running on an emulator.
  ///
  /// This method checks various device properties to determine if the app is
  /// running on an emulator rather than a physical device.
  ///
  /// Returns `true` if the app is running on an emulator, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isEmulator = await AndOs().isEmulator();
  /// print('Running on Emulator: $isEmulator');
  /// ```
  Future<bool> isEmulator() {
    return AndOsPlatform.instance.isEmulator();
  }

  /// Checks if the app is running in debug mode on iOS.
  ///
  /// This method checks whether the app is being debugged on an iOS device.
  ///
  /// [bundleId] The bundle identifier of the app to check.
  ///
  /// Returns `true` if the app is in debug mode, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isDebugMode = await AndOs().isAppInDebugMode('com.example.app');
  /// print('App in Debug Mode: $isDebugMode');
  /// ```
  Future<bool> isAppInDebugMode(String bundleId) {
    return AndOsPlatform.instance.isAppInDebugMode(bundleId);
  }

  /// Checks if the app is running on an iOS emulator.
  ///
  /// This method checks whether the app is running on an iOS simulator.
  ///
  /// Returns `true` if the app is running on an emulator, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isEmulator = await AndOs().isRunningOnEmulator();
  /// print('Running on Emulator: $isEmulator');
  /// ```
  Future<bool> isRunningOnEmulator() {
    return AndOsPlatform.instance.isRunningOnEmulator();
  }

  /// Checks if the app's runtime has been tampered with.
  ///
  /// This method checks for signs of reverse engineering tools or tampering
  /// in the app's runtime environment.
  ///
  /// Returns `true` if tampering is detected, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isTampered = await AndOs().isRuntimeTampered();
  /// print('Runtime Tampered: $isTampered');
  /// ```
  Future<bool> isRuntimeTampered() {
    return AndOsPlatform.instance.isRuntimeTampered();
  }

  /// Checks if the app is being debugged on iOS.
  ///
  /// This method checks whether the app is currently being debugged on an iOS device.
  ///
  /// Returns `true` if the app is being debugged, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// bool isBeingDebugged = await AndOs().isAppBeingDebugged();
  /// print('App Being Debugged: $isBeingDebugged');
  /// ```
  Future<bool> isAppBeingDebugged() {
    return AndOsPlatform.instance.isAppBeingDebugged();
  }
}