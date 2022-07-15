import 'dart:async';
/*import 'package:gradient_textfield/gradient_textfield.dart';*/
import 'package:simple_gradient_text/simple_gradient_text.dart';
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
        title: Text("TATA-SCAN"),
        centerTitle: true,
      ),
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
                Colors.blue,
                Colors.red,
                Colors.teal,
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
    );
  }
}
