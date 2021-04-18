import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encryption/AESEncryption/AES.dart';
import 'package:encryption/QR%20Generator/GeneratedQR.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AESEncryption encryption = new AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Generate QR",
            style: TextStyle(fontSize: 17),
          ),
          onPressed: navigate,
        ),
      ),
    );
  }

  void navigate() {
    var vj = encryption.encryptMsg().base16 is encrypt.Encrypted
        ? encryption.encryptMsg().base16
        : encryption.encryptMsg();
    print("-----------------------------");
    print("Encrypted Text: ${encryption.encryptMsg().base16}");
    print("Decrypted Text: ${encryption.decryptMsg(vj)}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratedQR(encryption.encryptMsg().base16)));
  }
}
