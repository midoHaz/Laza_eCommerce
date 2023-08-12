import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/cubit/card_cubit/card_cubit.dart';
import 'package:laza_commerce/views/layout_screen.dart';
import 'package:laza_commerce/views/order_confirm.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardCubit>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cart',
                          style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffDEDEDE)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/cat1.png',
                            height: 110,
                            width: 110,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Men\'s Tie-Dye T-Shirt',
                                style: TextStyle(fontSize: 13),
                              ),
                              const Text(
                                'Nike Sportswear',
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                ' \$45 (-\$4.00 Tax)',
                                style: TextStyle(
                                    fontSize: 11, color: Color(0xff8F959E)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      cubit.incrementItem();
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Color(0xffFFFFFF),
                                      child: Icon(Icons.keyboard_arrow_up),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  BlocBuilder<CardCubit, CardState>(
                                    builder: (context, state) {
                                      return Text(
                                        '${cubit.count}',
                                        style: const TextStyle(fontSize: 13),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  GestureDetector(onTap: (){
                                    cubit.decrementItem();
                                  },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Color(0xffFFFFFF),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xffFFFFFF),
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffDEDEDE)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/cat2.png',
                            height: 110,
                            width: 110,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Men\'s Tie-Dye T-Shirt',
                                style: TextStyle(fontSize: 13),
                              ),
                              const Text(
                                'Nike Sportswear',
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                ' \$45 (-\$4.00 Tax)',
                                style: TextStyle(
                                    fontSize: 11, color: Color(0xff8F959E)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      cubit.incrementItem2();
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Color(0xffFFFFFF),
                                      child: Icon(Icons.keyboard_arrow_up),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  BlocBuilder<CardCubit, CardState>(
                                    builder: (context, state) {
                                      return Text(
                                        '${cubit.count2}',
                                        style: const TextStyle(fontSize: 13),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  GestureDetector(onTap: (){
                                    cubit.decrementItem2();
                                  },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Color(0xffFFFFFF),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xffFFFFFF),
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Delivery Address",
                    style: TextStyle(
                        // color: Color(0xFF1D1E20),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/map.png',
                          ),
                          Positioned(
                            top: 15,
                            left: 15,
                            child: Image.asset(
                              'assets/images/map2.png',
                            ),
                          ),
                          Positioned(
                            top: 18,
                            left: 18,
                            child: Image.asset(
                              'assets/images/Location.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Samanoud,Gharbeia,Egypt',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ' Azizia',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff8F959E)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xff4AC76D),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                        // color: Color(0xFF1D1E20),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Image.asset(
                              'assets/images/visaf.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visa Classic',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '**** 7690',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff8F959E)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xff4AC76D),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Order Info",
                    style: TextStyle(
                        // color: Color(0xFF1D1E20),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$110",
                        style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Shipping cost",
                        style: TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$10",
                        style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$120",
                        style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderConfirmView()));
                },
                child: Container(
                  height: 80,
                  color: primarycolor,
                  child: const Center(
                      child: Text(
                    'Checkout',
                    style: TextStyle(color: Color(0xFFFEFEFE), fontSize: 17),
                  )),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
