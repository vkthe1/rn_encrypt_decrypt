import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'rn_encrypt_decrypt_platform_interface.dart';

/// An implementation of [RnEncryptDecryptPlatform] that uses method channels.
class MethodChannelRnEncryptDecrypt extends RnEncryptDecryptPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rn_encrypt_decrypt');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> decrypt(String key, String data) async{
    final args = {"key": key, "data": data};
    final dataString= await methodChannel.invokeMethod<String>('decrypt',args);
    return dataString;
  }

  @override
  Future<String?> encrypt(String key, String data) async{
    final args = {"key": key, "data": data};
    final dataString= await methodChannel.invokeMethod<String>('encrypt',args);
    return dataString;
  }
}
