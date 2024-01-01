import 'package:flutter_test/flutter_test.dart';
import 'package:encrypt_decrypt/encrypt_decrypt.dart';
import 'package:encrypt_decrypt/encrypt_decrypt_platform_interface.dart';
import 'package:encrypt_decrypt/encrypt_decrypt_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEncryptDecryptPlatform
    with MockPlatformInterfaceMixin
    implements EncryptDecryptPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> decrypt(String key, String data) {
    // TODO: implement decrypt
    return Future.value('44');
  }

  @override
  Future<String?> encrypt(String key, String data) {
    // TODO: implement encrypt
    return Future.value('45');
  }
}

void main() {
  final EncryptDecryptPlatform initialPlatform = EncryptDecryptPlatform.instance;

  test('$MethodChannelEncryptDecrypt is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEncryptDecrypt>());
  });

  test('getPlatformVersion', () async {
    EncryptDecrypt encryptDecryptPlugin = EncryptDecrypt();
    MockEncryptDecryptPlatform fakePlatform = MockEncryptDecryptPlatform();
    EncryptDecryptPlatform.instance = fakePlatform;

    expect(await encryptDecryptPlugin.getPlatformVersion(), '42');
  });
}
