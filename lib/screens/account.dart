import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            
            Stack(
           children: [
           greenbox("Total Earnings"),
           whitebox(1000)
           ],
            ),
            SizedBox(height: 15.0,),
              Stack(
           children: [
           greenbox("Reedemed Amount"),
           whitebox(100)
           ],
            ),
            SizedBox(height: 15.0,),
              Stack(
           children: [
           greenbox("Yet to Reedemed"),
           whitebox(1200)
           ],
            )
          ],
        ),
      ),
    );
  }

  Widget greenbox(String title){
    return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 150.0,
                  width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 15.0, // soften the shadow
        spreadRadius: 5.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 5  horizontally
          5.0, // Move to bottom 5 Vertically
        ),
      )
    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top :18.0,left: 12.0),
                  child:RichText(text: TextSpan(
                    text: title,
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                  )),
                ),
              ),
            );
  }

  Widget whitebox(double amount){
    return  Padding(
              padding: const EdgeInsets.only(top :70.0,right: 8.0,left: 8.0),
              child: Container(
                  height: 150.0,
                  width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 15.0, // soften the shadow
        spreadRadius: 5.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 5  horizontally
          5.0, // Move to bottom 5 Vertically
        ),
      )
    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left :12.0,top: 35.0),
                      child: RichText(text:TextSpan(
                        text: "Rs ${amount}",
                        style: TextStyle(color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0
                        )
                      )),
                    ),
                  ],
                ),
              ),
            );
  }
}