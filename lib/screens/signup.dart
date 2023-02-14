// @dart=2.9
import 'package:credible_steel/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
 String mobile;
 SignupScreen(this.mobile);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       
        children: [
          SizedBox(height: 145.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("As we dont find an account associate to ${widget.mobile}, we require some information from you !!",style: TextStyle(fontSize: 18.0),),
          ),
          SizedBox(height: 45.0),
          // name text field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        
      ),
      filled: true,
      
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: "Enter your Name",
      fillColor: Colors.white70),
),
          ),
          // Enter your city
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        
      ),
      filled: true,
      
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: "Enter your City",
      fillColor: Colors.white70),
),
          ),
            // Enter your defalut upi id

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        
      ),
      filled: true,
      
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: "Enter your Default UPI id",
      fillColor: Colors.white70),
),
          ),

          SizedBox(height: 25.0,),
          // ok button

          Padding(padding: EdgeInsets.all(8.0),
          child: GestureDetector(
           onTap: (() async{
             Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DashBoard(widget.mobile)),
  );
           }),
            child: Container(
              color: Colors.lightGreen,
              height: 40.0,
              width: double.infinity,
              child: Center(child: Text("Add", style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
            )),
          )
        ],
      ),

    
      
      ),);
  }
}