import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'encrypt_decrypt_method_channel.dart';

abstract class EncryptDecryptPlatform extends PlatformInterface {
  /// Constructs a EncryptDecryptPlatform.
  EncryptDecryptPlatform() : super(token: _token);

  static final Object _token = Object();

  static EncryptDecryptPlatform _instance = MethodChannelEncryptDecrypt();

  /// The default instance of [EncryptDecryptPlatform] to use.
  ///
  /// Defaults to [MethodChannelEncryptDecrypt].
  static EncryptDecryptPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EncryptDecryptPlatform] when
  /// they register themselves.
  static set instance(EncryptDecryptPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> decrypt(String key,String data){
    throw UnimplementedError('decrypt(key,data) has not been implemented.');
  }

  Future<String?> encrypt(String key,String data){
    throw UnimplementedError('encrypt(key,data) has not been implemented.');
  }
}
