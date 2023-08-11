import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/Card_Screen.dart';
import 'package:laza_commerce/views/LikedScreen.dart';
import 'package:laza_commerce/views/Payment_screen.dart';
import 'package:laza_commerce/views/categories.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex=0;
  List<Widget>Screens=[
    const Categories(),
    const LikedScreen(),
    const CardScreen(),
    const VisaScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.transparent,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: primarycolor,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          Image.asset('assets/images/Heart.png',width: 30,height: 30,color: Colors.black,),
          const Icon(Icons.shopping_bag_outlined, size: 30),
          const Icon(Icons.wallet, size: 30),
        ],
        onTap: (index) {
          selectedIndex=index;
          setState(() {

          });
        },
      ),
      body: Screens[selectedIndex],
    );
  }
}
