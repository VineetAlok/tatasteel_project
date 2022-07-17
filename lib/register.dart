import 'dart:async';
/*import 'package:gradient_textfield/gradient_textfield.dart';*/
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:tatasteel_project/login.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  String result = "Press Scan button";

  get name => null;
  Future _scanQR() async {
    try {
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", false, ScanMode.DEFAULT);
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      result = 'Failed to get platform version.';
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData.dark();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text("TATA-SCAN"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                result,
                style: const TextStyle(
                  fontSize: 40.0,
                ),
                colors: const [
                  Color.fromARGB(255, 3, 38, 65),
                  Color.fromARGB(255, 245, 102, 54),
                  Color.fromARGB(255, 1, 19, 3),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera_alt),
          label: Text("Scan"),
          onPressed: _scanQR,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
