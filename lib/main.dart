import 'dart:async';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "Press the Scan button below!!";

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
    return Scaffold(
      appBar: AppBar(
        title: Text("SCAN-ME"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gradienttextfield(
              controller: name,
              radius: 40,
              height: 60,
              width: 400,
              colors: const [
                Color.fromARGB(255, 167, 209, 238),
                Color.fromARGB(255, 93, 190, 242)
              ],
              text: result,
              fontColor: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
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
    );
  }
}
