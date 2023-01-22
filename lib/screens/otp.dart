import 'package:credible_steel/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String? _mobilenumber;

  OTPScreen(this._mobilenumber);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  
  Widget pinput(){
    return  Pinput(
                    length: 6,
                    onSubmitted: (String pin) => print(pin),
                  );
  }

  Widget submitbutton(){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 45.0,
        child: ElevatedButton(
          child: Text("Submit OTP"),
        onPressed: () {
          Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const DashBoard()));
        },
   
  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pinput(),
            SizedBox(height: 15.0,),
            submitbutton()
          ],
        ),
        ),
      ));
      
    
  }
}