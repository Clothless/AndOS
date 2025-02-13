import 'package:flutter_test/flutter_test.dart';
import 'package:and_os/and_os.dart';
import 'package:and_os/and_os_platform_interface.dart';
import 'package:and_os/and_os_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndOsPlatform
    with MockPlatformInterfaceMixin
    implements AndOsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> isAdbEnabled() => Future.value(true);

  @override
  Future<bool> isDeviceRooted() => Future.value(true);

  @override
  Future<bool> isDeveloperModeEnabled() => Future.value(true);

  @override
  Future<bool> isAppDebuggable() => Future.value(true);

  @override
  Future<bool> isAppSignatureValid(String signature) async {
    await Future.delayed(const Duration(seconds: 2));
    if (signature == 'valid') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> isFridaDetected() => Future.value(true);

  @override
  Future<bool> isEmulator() => Future.value(true);

  @override
  Future<bool> isAppBeingDebugged() {
    // TODO: implement isAppBeingDebugged
    throw UnimplementedError();
  }

  @override
  Future<bool> isAppInDebugMode(String bundleId) {
    // TODO: implement isAppInDebugMode
    throw UnimplementedError();
  }

  @override
  Future<bool> isRunningOnEmulator() {
    // TODO: implement isRunningOnEmulator
    throw UnimplementedError();
  }

  @override
  Future<bool> isRuntimeTampered() {
    // TODO: implement isRuntimeTampered
    throw UnimplementedError();
  }
}

void main() {
  final AndOsPlatform initialPlatform = AndOsPlatform.instance;

  test('$MethodChannelAndOs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndOs>());
  });

  test('getPlatformVersion', () async {
    AndOs andOsPlugin = AndOs();
    MockAndOsPlatform fakePlatform = MockAndOsPlatform();
    AndOsPlatform.instance = fakePlatform;

    expect(await andOsPlugin.getPlatformVersion(), '42');
  });

  test('isAppSignatureValid', () async {
    AndOs andOsPlugin = AndOs();
    MockAndOsPlatform fakePlatform = MockAndOsPlatform();
    AndOsPlatform.instance = fakePlatform;

    expect(await andOsPlugin.isAppSignatureValid("valid"), true);
    expect(await andOsPlugin.isAppSignatureValid("sdfsdf"), false);
  });
}
