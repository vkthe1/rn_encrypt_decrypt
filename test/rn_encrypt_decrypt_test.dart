import 'package:flutter_test/flutter_test.dart';
import 'package:rn_encrypt_decrypt/rn_encrypt_decrypt.dart';
import 'package:rn_encrypt_decrypt/rn_encrypt_decrypt_platform_interface.dart';
import 'package:rn_encrypt_decrypt/rn_encrypt_decrypt_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRnEncryptDecryptPlatform
    with MockPlatformInterfaceMixin
    implements RnEncryptDecryptPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> decrypt(String key, String data) {
    return Future.value('43');
  }

  @override
  Future<String?> encrypt(String key, String data) {
    return Future.value('44');
  }
}

void main() {
  final RnEncryptDecryptPlatform initialPlatform = RnEncryptDecryptPlatform.instance;

  test('$MethodChannelRnEncryptDecrypt is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRnEncryptDecrypt>());
  });

  test('getPlatformVersion', () async {
    RnEncryptDecrypt rnEncryptDecryptPlugin = RnEncryptDecrypt();
    MockRnEncryptDecryptPlatform fakePlatform = MockRnEncryptDecryptPlatform();
    RnEncryptDecryptPlatform.instance = fakePlatform;

    expect(await rnEncryptDecryptPlugin.getPlatformVersion(), '42');
  });
}
