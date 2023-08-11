import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_commerce/consts.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({Key? key}) : super(key: key);

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  final _nameController = TextEditingController();
  final _cardController = TextEditingController();
  final _expController = TextEditingController();
  final _csvController = TextEditingController();
  bool checkedValue = false;
  final formkey = GlobalKey<FormState>();
  List<Widget> Cards = [
    Image.asset('assets/images/Card 1.png',width: 300,height: 185,),
    Image.asset('assets/images/Card 2.png',width: 300,height: 185),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                                'Payment',
                                style: TextStyle(
                                  // color: Color(0xFF1D1E20),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width:double.infinity,
                          height: 200,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Cards[index],
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                              itemCount: Cards.length),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Card Owner',
                          style: TextStyle(
                            // color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 55,
                          width: double.infinity,
                          child: TextFormField(
                            validator: (value) {
                        if (_nameController.text.length < 3) {
                        return "Enter a Valid name please (first ,last )";
                        }
                        return null;
                        },
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Mohamed",
                              filled: true,
                              border: _buildOutlineInputBorder(),
                              focusedBorder: _buildOutlineInputBorder(),
                              enabledBorder: _buildOutlineInputBorder(),
                              errorBorder: _buildOutlineInputBorder(),
                              disabledBorder: _buildOutlineInputBorder(),

                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Card number',
                          style: TextStyle(
                            // color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 55,
                          width: double.infinity,
                          child: TextFormField(
                            validator: (value) {
                              if (_cardController.text.length < 16) {
                                return "Enter a Valid 16 digit";
                              }
                              return null;
                            },
                            controller: _cardController,
                            decoration: InputDecoration(
                              hintText: "5624 9874 2364 1426",
                              filled: true,
                              border: _buildOutlineInputBorder(),
                              focusedBorder: _buildOutlineInputBorder(),
                              enabledBorder: _buildOutlineInputBorder(),
                              errorBorder: _buildOutlineInputBorder(),
                              disabledBorder: _buildOutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'EXP',
                                  style: TextStyle(
                                    // color: Color(0xFF1D1E20),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 55,
                                  width: 180,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (_expController.text.length < 5) {
                                        return "Enter a Valid exp date";
                                      }
                                      return null;
                                    },
                                    controller: _expController,
                                    decoration: InputDecoration(
                                      hintText: "21/06",
                                      filled: true,
                                      border: _buildOutlineInputBorder(),
                                      focusedBorder: _buildOutlineInputBorder(),
                                      enabledBorder: _buildOutlineInputBorder(),
                                      errorBorder: _buildOutlineInputBorder(),
                                      disabledBorder: _buildOutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'CVV',
                                  style: TextStyle(
                                    // color: Color(0xFF1D1E20),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 55,
                                  width:180,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (_csvController.text.length < 4) {
                                        return "Enter a Valid csv";
                                      }
                                      return null;
                                    },
                                    controller: _csvController,
                                    decoration: InputDecoration(
                                      hintText: "7765",
                                      filled: true,
                                      border: _buildOutlineInputBorder(),
                                      focusedBorder: _buildOutlineInputBorder(),
                                      enabledBorder: _buildOutlineInputBorder(),
                                      errorBorder: _buildOutlineInputBorder(),
                                      disabledBorder: _buildOutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () async {
                       if(formkey.currentState!.validate()){
                         Get.snackbar("Card Saved", "thanks for your time.",
                             backgroundColor: Colors.green);
                       }
                      },
                      child: Container(
                        height: 80,
                        color: primarycolor,
                        child: const Center(
                            child: Text(
                              'Save Card',
                              style: TextStyle(color: Color(0xFFFEFEFE), fontSize: 17),
                            )),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )),
    );
  }
  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(7),
    );
  }
}
