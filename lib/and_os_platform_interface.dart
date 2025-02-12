import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'and_os_method_channel.dart';

abstract class AndOsPlatform extends PlatformInterface {
  /// Constructs a AndOsPlatform.
  AndOsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndOsPlatform _instance = MethodChannelAndOs();

  /// The default instance of [AndOsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndOs].
  static AndOsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndOsPlatform] when
  /// they register themselves.
  static set instance(AndOsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isAdbEnabled() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isDeviceRooted() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isDeveloperModeEnabled() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isAppDebuggable() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isAppSignatureValid(String signature) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isFridaDetected() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isEmulator() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isAppInDebugMode(String bundleId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isRunningOnEmulator() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isRuntimeTampered() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isAppBeingDebugged() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
