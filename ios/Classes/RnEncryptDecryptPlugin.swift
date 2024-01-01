import Flutter
import UIKit
import RNCryptor

public class RnEncryptDecryptPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "rn_encrypt_decrypt", binaryMessenger: registrar.messenger())
        let instance = RnEncryptDecryptPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "encrypt"){
            guard let args = call.arguments as? [String:String] else {return};
            let key = args["key"]!;
            let jsonData = args["data"]!;
            let rawData = Data(jsonData.utf8)
            do {
                let ciphertext = RNCryptor.encrypt(data: rawData, withPassword: key);
                result("\(ciphertext.base64EncodedString().utf8)");
            } catch {
                result(nil)
            }
            
        } else if(call.method == "decrypt"){
            guard let args = call.arguments as? [String:String] else {return};
            let key = args["key"]!;
            let encryptString = args["data"]!;
            
            do {
                let responseString = Data(base64Encoded: encryptString)
                let decryptData = try RNCryptor.decrypt(data: responseString!, withPassword: key);
                print(decryptData);
                let dict=String(decoding: decryptData, as: UTF8.self);
//                 let dict = try JSONSerialization.jsonObject(with: decryptData, options: [.fragmentsAllowed])
                result(dict);
            } catch {
                result("")
            }
        }else{
            result("iOS " + UIDevice.current.systemVersion)
        }
    }
}
