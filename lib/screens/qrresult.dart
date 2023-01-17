import 'package:credible_steel/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrResult extends StatefulWidget {

  Barcode? barcode;
  QrResult(this.barcode);
  @override
  State<QrResult> createState() => _QrResultState();
}

class _QrResultState extends State<QrResult> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
          child: Text(widget.barcode!.code.toString()),
      ),
      ElevatedButton(onPressed: (){
          Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>  DashBoard(),
      ));
      }, child: Text("Go to Home"))
            ],
          ),
        ),
      ),
    );
  }
}