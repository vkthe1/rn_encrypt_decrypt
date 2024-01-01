
import 'rn_encrypt_decrypt_platform_interface.dart';

class RnEncryptDecrypt {
  Future<String?> getPlatformVersion() {
    return RnEncryptDecryptPlatform.instance.getPlatformVersion();
  }
  Future<String?> decrypt(String key,String data){
    return RnEncryptDecryptPlatform.instance.decrypt(key, data);
  }
  Future<String?> encrypt(String key,String data){
    return RnEncryptDecryptPlatform.instance.encrypt(key, data);
  }
}
