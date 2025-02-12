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
}
