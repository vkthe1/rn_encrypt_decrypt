
import 'encrypt_decrypt_platform_interface.dart';

class EncryptDecrypt {
  Future<String?> getPlatformVersion() {
    return EncryptDecryptPlatform.instance.getPlatformVersion();
  }
  Future<String?> decrypt(String key,String data){
    return EncryptDecryptPlatform.instance.decrypt(key, data);
  }
  Future<String?> encrypt(String key,String data){
    return EncryptDecryptPlatform.instance.encrypt(key, data);
  }
}
