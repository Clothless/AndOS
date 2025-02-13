import 'package:flutter/services.dart';

import 'and_os_platform_interface.dart';

/// An implementation of [AndOsPlatform] that uses method channels.
class MethodChannelAndOs extends AndOsPlatform {
  /// The method channel used to interact with the native platform.
  static const _channel = MethodChannel('and_os');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> isAdbEnabled() async {
    try {
      final result = await _channel.invokeMethod('isAdbEnabled');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isDeviceRooted() async {
    try {
      final result = await _channel.invokeMethod('isDeviceRooted');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }


  @override
  Future<bool> isDeveloperModeEnabled() async {
    try {
      final result = await _channel.invokeMethod('isDeveloperModeEnabled');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isAppDebuggable() async {
    try {
      final result = await _channel.invokeMethod('isAppDebuggable');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isAppSignatureValid(String signature) async {
    try {
      final result = await _channel
          .invokeMethod('isAppSignatureValid', {"signature": signature});
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isFridaDetected() async {
    try {
      final result = await _channel.invokeMethod('isFridaDetected');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isEmulator() async {
    try {
      final result = await _channel.invokeMethod('isEmulator');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isAppInDebugMode(String bundleId) async {
    try {
      final result = await _channel.invokeMethod('isAppInDebugMode');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isRunningOnEmulator() async {
    try {
      final result = await _channel.invokeMethod('isRunningOnEmulator');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isRuntimeTampered() async {
    try {
      final result = await _channel.invokeMethod('isRuntimeTampered');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isAppBeingDebugged() async {
    try {
      final result = await _channel.invokeMethod('isAppBeingDebugged');
      return result;
    } on PlatformException catch (_) {
      throw UnimplementedError();
    } catch (e) {
      return false;
    }
  }
}
