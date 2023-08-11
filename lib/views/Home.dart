import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/Choose.dart';

class Home extends StatefulWidget {
  final String image;
  final Color color;
  const Home({super.key,required this.image,required this.color});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   if(widget.image=='assets/images/Logo.png'){
     Timer(const Duration(seconds: 3), () {
       Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>const Home(image:'assets/images/Logo2.png',color:Colors.white,)));
     });
   }

    if (widget.image=="assets/images/Logo2.png") {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const ChooseScreen()),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: widget.color,
      body: Center(child: Image.asset(widget.image,width: 59,height: 36,)),
    );
  }
}
