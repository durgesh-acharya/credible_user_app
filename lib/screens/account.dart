// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Reedem.dart';

class Accounts extends StatefulWidget {
 
  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
String madeby;
bool loadervisible = true;
bool nodata = false;
     //get key
Future getkey()async{
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
var key = sharedPreferences.getString("mobile");
setState(() {
madeby = key.toString();
});
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getkey();
  }

  //get redeem reqeust
  Future getreedemrequest(String madeby)async{
    String url = "http://52.66.119.148/api/reedem/frommadeby/${madeby}";
    try{
      var response = await http.get(Uri.parse(url));
      var jsondata = jsonDecode(response.body);
         if(jsondata[0]["status"] == true){
        var jdata = jsondata[0]["data"];
        print(jdata);
        return jdata.map((json) => Reedem.fromJson(json)).toList();
      
      }else{
        setState(() {
          nodata = true;
          loadervisible = false;
        });
      }
    }on HttpException{
      print("http");
    }on SocketException{
      print("socket");
    }on PlatformException{
      print("Platform");
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          //when data
          FutureBuilder(
            future: getreedemrequest(madeby),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(!snapshot.hasData){
                return Visibility(
                visible: loadervisible,
                child: Center(child: CircularProgressIndicator(color: Colors.green,)
                      ),
              );
              }
              return ListView.builder(
                itemCount: snapshot.data.length == 0 ? 0 : snapshot.data.length,
                itemBuilder:(BuildContext context, int index){
                  return card(snapshot.data[index].rrId,snapshot.data[index].qrRupees.toDouble());
                });
            })
        ],
      ),
    );
  }

Widget card(int reedemid, double rupees){
  return Card(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 25.0,
                      color: Colors.green,
                      child : Text("Redeem Request id : ${reedemid}")
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text("INR : ${rupees}")
                        ],
                      ),
                    )
                  ],
                ),
              );
}
  
}