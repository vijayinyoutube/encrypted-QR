import 'package:flutter/material.dart';
import 'package:encryption/AESEncryption/AES.dart';
import 'package:encryption/QR%20Scanner/ScanQR.dart';
import 'package:encryption/QR%20Generator/QRGenerator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AESEncryption encryption = new AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("QR Scan/Generate"),
      ),
      body: Container(
        child: Container(
          height: (MediaQuery.of(context).size.height),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height) -
                      AppBar().preferredSize.height -
                      kToolbarHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildImage(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildScanQRBtn(context),
                      SizedBox(
                        width: 25,
                      ),
                      buildGenerateQRBtn(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImage() => CircleAvatar(
      backgroundImage: AssetImage(
        "assets/images/QR.jpg",
      ),
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      radius: 150,
    );

Widget buildScanQRBtn(BuildContext context) => Hero(
      tag: "Scan QR",
      child: Container(
        width: ((MediaQuery.of(context).size.width) / 2) - 45,
        height: 50,
        child: ElevatedButton(
          child: Text(
            "Scan QR",
            style: TextStyle(fontSize: 17),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScanQR()));
          },
        ),
      ),
    );

Widget buildGenerateQRBtn(BuildContext context) => Container(
      width: ((MediaQuery.of(context).size.width) / 2) - 45,
      height: 50,
      child: ElevatedButton(
        child: Text(
          "Generate QR",
          style: TextStyle(fontSize: 17),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QRGenerator()));
        },
      ),
    );
