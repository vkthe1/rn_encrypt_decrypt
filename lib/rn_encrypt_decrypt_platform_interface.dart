import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rn_encrypt_decrypt_method_channel.dart';

abstract class RnEncryptDecryptPlatform extends PlatformInterface {
  /// Constructs a RnEncryptDecryptPlatform.
  RnEncryptDecryptPlatform() : super(token: _token);

  static final Object _token = Object();

  static RnEncryptDecryptPlatform _instance = MethodChannelRnEncryptDecrypt();

  /// The default instance of [RnEncryptDecryptPlatform] to use.
  ///
  /// Defaults to [MethodChannelRnEncryptDecrypt].
  static RnEncryptDecryptPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RnEncryptDecryptPlatform] when
  /// they register themselves.
  static set instance(RnEncryptDecryptPlatform instance) {
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
