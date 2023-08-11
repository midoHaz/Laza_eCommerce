import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/categories.dart';
import 'package:laza_commerce/views/Login.dart';
import 'package:laza_commerce/views/newPassword.dart';

class Verifecation extends StatefulWidget {
  const Verifecation({Key? key}) : super(key: key);

  @override
  State<Verifecation> createState() => _VerifecationState();
}

class _VerifecationState extends State<Verifecation> {
  final formKey = GlobalKey<FormState>();
  int number = 20;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () => changeseconds());
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xFFF5F6FA),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF1D1E20),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 85.0),
                    child: Text(
                      "Verifecation Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color(0xFF1D1E20)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Image.asset(
                      'assets/images/IMG.png',
                      width: 285,
                      height: 190,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 77,
                        height: 98,
                        child: TextFormField(
                          onSaved: (pin1) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Color(0xFFE7E8EA),width: 1.0)),
                            hintText: '0',
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 77,
                        height: 98,
                        child: TextFormField(
                          onSaved: (pin2) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Color(0xFFE7E8EA),width: 1.0)),
                            hintText: '0',
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 77,
                        height: 98,
                        child: TextFormField(
                          onSaved: (pin3) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Color(0xFFE7E8EA),width: 1.0)),
                            hintText: '0',
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 77,
                        height: 98,
                        child: TextFormField(
                          onSaved: (pin4) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Color(0xFFE7E8EA),width: 1.0)),
                            hintText: '0',
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 95.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '00:$number',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          const TextSpan(
                            text: ' resend confirmation code.',
                            style: TextStyle(
                              color: Color(0xFF8F959E),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const NewPass()),
                        );
                      }
                    },
                    child: Container(
                      height: 80,
                      color: primarycolor,
                      child: const Center(
                          child: Text(
                        'Confirm Code',
                        style:
                            TextStyle(color: Color(0xFFFEFEFE), fontSize: 17),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeseconds() {
    if (number > 0) {
      number--;
    }
    setState(() {});
  }
}
