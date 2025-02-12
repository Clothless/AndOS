import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'and_os_platform_interface.dart';

/// An implementation of [AndOsPlatform] that uses method channels.
class MethodChannelAndOs extends AndOsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const _channel = MethodChannel('and_os');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  // For Android
  // isAdbEnabled checks if the adb options is activated on the device
  // @returns bool
  @override
  Future<bool> isAdbEnabled() async {
    try {
      final result = await _channel.invokeMethod('isAdbEnabled');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For Android
  // isDeviceRooted checks if the device is rooted or not
  // it checks for the following directories:
  //
  // "/system/app/Superuser.apk",
  // "/sbin/su",
  // "/system/bin/su",
  // "/system/xbin/su",
  // "/data/local/xbin/su",
  // "/data/local/bin/su",
  // "/system/sd/xbin/su",
  // "/system/bin/failsafe/su",
  // "/data/local/su"
  //
  // @returns bool
  @override
  Future<bool> isDeviceRooted() async {
    try {
      final result = await _channel.invokeMethod('isDeviceRooted');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For Android
  // isDeveloperModeEnabled checks if the developer mode is active on the device
  // @returns bool
  @override
  Future<bool> isDeveloperModeEnabled() async {
    try {
      final result = await _channel.invokeMethod('isDeveloperModeEnabled');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For Android
  // isAppDebuggable checks if the app is debuggable
  // it checks for the "FLAG_DEBUGGABLE" presence in the app
  // @returns bool
  @override
  Future<bool> isAppDebuggable() async {
    try {
      final result = await _channel.invokeMethod('isAppDebuggable');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For Android
  // isAppSignatureValid checks the app signature in base64
  // it means that the app was decompiled, changed somehow, and compiled again and signed with a new signature
  // when creating a signature with keystore you'll get SHA256 signature
  // convert it to base64 and pass it to the function
  // @returns bool
  @override
  Future<bool> isAppSignatureValid(String signature) async {
    try {
      final result = await _channel
          .invokeMethod('isAppSignatureValid', {"signature": signature!});
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For Android & IOS
  // Frida is an open source tool that is used for reverse engineering
  // isFridaDetected checks if the frida-server is injected in the device
  // @returns bool
  @override
  Future<bool> isFridaDetected() async {
    try {
      final result = await _channel.invokeMethod('isFridaDetected');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For Android
  // isEmulator checks if the app is running on real device or an emulator
  // it checks if the model contains some words, ex (generic, unknown, emulator etc...)
  // it also checks the fingerprint, manufacturer, brand, product
  // @returns bool
  @override
  Future<bool> isEmulator() async {
    try {
      final result = await _channel.invokeMethod('isEmulator');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For IOS
  // isAppInDebugMode is used to check if the app is being debugged
  // @returns bool
  @override
  Future<bool> isAppInDebugMode(String bundleId) async {
    try {
      final result = await _channel.invokeMethod('isAppInDebugMode');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For IOS
  // isRunningOnEmulator checks if the app is running on real device or an emulator
  // @returns bool
  @override
  Future<bool> isRunningOnEmulator() async {
    try {
      final result = await _channel.invokeMethod('isRunningOnEmulator');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For IOS
  // isRuntimeTampered Checking for reverse engineering tools
  // @returns bool
  @override
  Future<bool> isRuntimeTampered() async {
    try {
      final result = await _channel.invokeMethod('isRuntimeTampered');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  // For IOS
  // isAppBeingDebugged is used to check if the app is running in debug mode
  // it's somehow the equivalent of checking adb in android
  // @returns bool
  @override
  Future<bool> isAppBeingDebugged() async {
    try {
      final result = await _channel.invokeMethod('isAppBeingDebugged');
      return result;
    } on PlatformException catch (e) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }
}
