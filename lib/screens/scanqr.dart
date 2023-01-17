

import 'dart:io';

import 'package:credible_steel/screens/qrresult.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});
  

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'qrKey');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  if(Platform.isAndroid){
       controller!.pauseCamera();
  }
  controller!.resumeCamera();
  }
  
  @override
  Widget build(BuildContext context) {
    controller?.pauseCamera();
    controller?.resumeCamera();
    return Scaffold(
      body: QRView(
       
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.green,
        ),
        key: qrKey, 
        onQRViewCreated: (QRViewController controller){
            setState(() {
              this.controller = controller;

              controller.scannedDataStream.listen((barcode) { 
                setState(() {
                  this.barcode = barcode;
                });
                controller.pauseCamera();
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  QrResult(barcode),
    ),
  );
              });
            });
        })
    );
  }
}

