import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:encryption/AESEncryption/AES.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQR extends StatefulWidget {
  ScanQR({Key? key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _ScanQRState extends State<ScanQR> {
  AESEncryption encryption = new AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Scan QR",
      child: Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    qrData,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(Icons.launch_outlined),
                    onPressed: hasdata
                        ? () async {
                            if (await canLaunch(qrData)) {
                              print(qrData);
                              await launch(qrData);
                            } else {
                              throw 'Could not launch ';
                            }
                          }
                        : null,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                width: ((MediaQuery.of(context).size.width) / 2) - 45,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    "Scan QR",
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () async {
                    var data = await FlutterBarcodeScanner.scanBarcode(
                        "red", "Cancel", true, ScanMode.QR);
                    setState(() {
                      qrData = data.toString();
                      hasdata = true;
                      qrData = encryption
                          .decryptMsg(encryption.getCode(qrData))
                          .toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
