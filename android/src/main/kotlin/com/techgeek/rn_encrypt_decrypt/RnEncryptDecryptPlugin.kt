package com.techgeek.rn_encrypt_decrypt

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tgio.rncryptor.RNCryptorNative

/** RnEncryptDecryptPlugin */
class RnEncryptDecryptPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "rn_encrypt_decrypt")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "encrypt") {
            val args = call.arguments() as Map<String, String>?
            val key: String? = args!!["key"]
            val data: String? = args!!["data"]
            val rncryptor = RNCryptorNative()
            val encryptData = String(rncryptor.encrypt(data!!, key!!))
            result.success(encryptData)
        } else if (call.method == "decrypt") {
            val args = call.arguments() as Map<String, String>?
            val key: String? = args!!["key"]
            val data: String? = args!!["data"]
            val rncryptor = RNCryptorNative()
            val decryptData = rncryptor.decrypt(data!!, key!!)
            result.success(decryptData)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
