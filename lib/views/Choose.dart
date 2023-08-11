import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/onboarding.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  String image = "assets/images/man.png";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => changePhoto());
    return Scaffold(
      backgroundColor: primarycolor,
      body: Stack(
        children: [
          Image.asset(
            image,
            width: 375,
            height: 812,
          ),
          Positioned(
            bottom: 15,
            left: 30,
            child: Container(
              height: 244,
              width: 345,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     const Text("Look Good, Feel Good",
                      // (AppLocalizations.of(context)!.splash_title),
                      style: TextStyle(
                          color: Color(0xFF1D1E20),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                     const Text(
                       "Create your individual & unique style and look amazing everyday.",
                      // (AppLocalizations.of(context)!.splash_description),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnBoardingScreen(
                                            num: 1,
                                            percent: 0.30,
                                            percentage: 30,
                                          )));
                            },
                            child: buildGestureDetector(
                                colorBox: const Color(0xFFF5F6FA),
                                name: "Men",
                                // (AppLocalizations.of(context)!.men),
                                textColor: const Color(0xFF8F959E))),
                        const SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnBoardingScreen(
                                            num: 1,
                                            percent: 0.30,
                                            percentage: 30,
                                          )));
                            },
                            child: buildGestureDetector(
                              colorBox: primarycolor,
                              name:"Women",
                              // (AppLocalizations.of(context)!.women),
                              textColor: const Color(0xFFFFFFFF),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoardingScreen(
                                      num: 1,
                                      percent: 0.30,
                                      percentage: 30,
                                    )));
                      },
                      child:const Text(
                        'skip',
                        // (AppLocalizations.of(context)!.skip),
                        style:
                            TextStyle(color: Color(0xFF8F959E), fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector({
    required String name,
    required Color textColor,
    required Color colorBox,
  }) {
    return GestureDetector(
      child: Container(
        width: 152,
        height: 60,
        decoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: textColor, fontSize: 17),
          ),
        ),
      ),
    );
  }

  void changePhoto() {
    if (image == "assets/images/man.png") {
      image = "assets/images/female.png";
    } else {
      image = "assets/images/man.png";
    }
    setState(() {});
  }
}
