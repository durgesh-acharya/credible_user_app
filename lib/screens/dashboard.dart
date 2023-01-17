import 'package:credible_steel/screens/account.dart';
import 'package:credible_steel/screens/product.dart';
import 'package:credible_steel/screens/scanqr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  final screens = [
    Products(),
    ScanQr(),
    Accounts()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14,fontWeight: FontWeight.w500)
          )
        ),
        child: NavigationBar(
          height: 80,
          backgroundColor: Colors.white10,
          selectedIndex: index,
          onDestinationSelected: ((index) => setState(() {
            this.index = index;
          })),
          destinations: [
          NavigationDestination(icon: FaIcon(FontAwesomeIcons.cartShopping,color: index == 0 ? Colors.green : Colors.grey),label: '',),
          NavigationDestination(icon: FaIcon(FontAwesomeIcons.qrcode,color:index == 1 ? Colors.green : Colors.grey),label: '',),
          NavigationDestination(icon: FaIcon(FontAwesomeIcons.history,color: index == 2 ? Colors.green : Colors.grey), label: ''),
        ]),
      ),
    );
  }
}