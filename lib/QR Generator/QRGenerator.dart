import 'GeneratedQR.dart';
import 'package:flutter/material.dart';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encryption/AESEncryption/AES.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({Key? key}) : super(key: key);

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

TextEditingController mycontroller = new TextEditingController();

class _QRGeneratorState extends State<QRGenerator> {
  AESEncryption encryption = new AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTextFormField(),
            buildGenerateQRBtn(),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField() => Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: mycontroller,
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
            labelText: "Enter the data for generating a QR",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            prefixIcon: Icon(
              Icons.link,
            ),
          ),
          onEditingComplete: navigate,
        ),
      );

  Widget buildGenerateQRBtn() => Container(
        width: ((MediaQuery.of(context).size.width) / 2) - 45,
        height: 35,
        child: ElevatedButton(
          child: Text(
            "Generate QR",
            style: TextStyle(fontSize: 17),
          ),
          onPressed: navigate,
        ),
      );

  void navigate() {
    // print("-----------------------------");
    // encrypt.Encrypted temp = encryption.encryptMsg(mycontroller.text);
    // //  String qrData = encryption.encryptMsg(mycontroller.text).base16();
    // var vj = encryption.decryptMsg(temp);
    // print(vj);
    // // print(qrData);
    // // print("Decrypted Text: ${encryption.decryptMsg(qrData)}");

    print("=============================");
    print(encryption.encryptMsg(mycontroller.text).base16);
    // print(encryption.getCode("bdf4ce76ac4e8787a346ac1a9c8a2e89").base16);
    print(encryption.decryptMsg(
        encryption.getCode1(encryption.encryptMsg(mycontroller.text).base16)));
    // print(encryption.decryptMsg());
    print("=============================");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneratedQR(encryption.encryptMsg(mycontroller.text).base16)));
  }
}
