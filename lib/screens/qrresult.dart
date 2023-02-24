// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:credible_steel/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

class QrResult extends StatefulWidget {

  String barcode;
  QrResult(this.barcode);
  @override
  State<QrResult> createState() => _QrResultState();
}

class _QrResultState extends State<QrResult> {
  QRViewController controller;
  Future getbarcoddata(String qrunique)async{
    try{
      var response = await http.get(Uri.parse("http://52.66.119.148/api/qr/usestatus/${qrunique}"));
      var jsondata = jsonDecode(response.body);
    
      if(jsondata[0]["status"] == true){
        var jdata = jsondata[0]["data"];
        print(jdata);
      print("yay");
      
      }else{
      print("no");
      }

    }on SocketException{
      print("socket");
    }on HttpException{
      print("http");
    }on PlatformException{
      print("platform");
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller?.stopCamera();
    Future.delayed(Duration(seconds: 2),(){
       getbarcoddata(widget.barcode);
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
          child: Text(widget.barcode.toString()),
      ),
      ElevatedButton(onPressed: (){
      //     Navigator.of(context).push(
      // MaterialPageRoute(
      //     builder: (context) =>  DashBoard(),
      // ));
     
      }, child: Text("Go to Home"))
            ],
          ),
        ),
      ),
    );
  }
}