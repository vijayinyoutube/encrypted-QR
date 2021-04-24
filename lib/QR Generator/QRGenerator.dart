import 'GeneratedQR.dart';
import 'package:flutter/material.dart';
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneratedQR(encryption.encryptMsg(mycontroller.text).base16)));
  }
}
