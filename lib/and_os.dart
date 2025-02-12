
import 'and_os_platform_interface.dart';

class AndOs {
  Future<String?> getPlatformVersion() {
    return AndOsPlatform.instance.getPlatformVersion();
  }

  Future<bool> isAdbEnabled() {
    return AndOsPlatform.instance.isAdbEnabled();
  }

  Future<bool> isDeviceRooted() {
    return AndOsPlatform.instance.isDeviceRooted();
  }

  Future<bool> isDeveloperModeEnabled() {
    return AndOsPlatform.instance.isDeveloperModeEnabled();
  }

  Future<bool> isAppDebuggable() {
    return AndOsPlatform.instance.isAppDebuggable();
  }

  Future<bool> isAppSignatureValid(String signature) {
    return AndOsPlatform.instance.isAppSignatureValid(signature);
  }

  Future<bool> isFridaDetected() {
    return AndOsPlatform.instance.isFridaDetected();
  }

  Future<bool> isEmulator() {
    return AndOsPlatform.instance.isEmulator();
  }
}
