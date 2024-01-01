# encrypt_decrypt

## Platform Support

| Android | iOS 
| :-----: | :-:
|   ✅    | ✅

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:encrypt_decrypt/encrypt_decrypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _encryptDecryptPlugin = EncryptDecrypt();
  final TextEditingController _textMessageToEncrypt=TextEditingController(text: 'I am a software Developer with keen interest to learn new tech.');
  final TextEditingController _textKey=TextEditingController(text: 'techgeek.cloud');
  //Map Data to Encrypt


  @override
  void initState() {
    super.initState();
  }

  _encryption({required String key, required String data}) {
    return _encryptDecryptPlugin.encrypt(key,data);
  }

  _decryption({required String key, required String data}) {
    return _encryptDecryptPlugin.decrypt(key,data);
  }

  String displayData = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encrypt Decrypt',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RnCrypt App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(controller: _textKey),
              const SizedBox(height: 10,),
              TextField(controller: _textMessageToEncrypt,maxLines: 4),
              const SizedBox(height: 10,),
              Text(
                displayData,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () async {
                      /// Encode your data into with [jsonEncode] before encrpting it
                      displayData = await _encryption(key: _textKey.text, data: _textMessageToEncrypt.text);
                      setState(() {});
                    },
                    child: const Text('Perform Encryption'),
                  ),
                  FilledButton(
                    onPressed: () async {
                      _textMessageToEncrypt.text=await _decryption(key: _textKey.text, data: displayData);
                      setState(() {});
                    },
                    child: const Text('Perform Decryption'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
```
