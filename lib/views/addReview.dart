import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:laza_commerce/Helper/hive_helper.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/cubit/login_cubit.dart';
import 'package:laza_commerce/views/showReviews.dart';

class AddReview extends StatefulWidget {
  const AddReview({Key? key}) : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final formkey=GlobalKey<FormState>();
  double star =2;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Row(
                        children: [
                          CircleAvatar(
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
                          const SizedBox(
                            width: 100,
                          ),
                          const Text(
                            'Add Review',
                            style: TextStyle(
                                // color: Color(0xFF1D1E20),
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Name',
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Type your name ..",
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
                      height: 25,
                    ),
                    const Text(
                      'How was your experience ?',
                      style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 10,
                        controller: _descController,
                        decoration: InputDecoration(
                          hintText: "Describe your experience?",
                          filled: true,
                          // fillColor: const Color(0xFFF5F6FA),
                          border: _buildOutlineInputBorder(),
                          focusedBorder: _buildOutlineInputBorder(),
                          enabledBorder: _buildOutlineInputBorder(),
                          errorBorder: _buildOutlineInputBorder(),
                          disabledBorder: _buildOutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Star',
                      style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text('0.0'),
                        Container(
                          width: 325,
                          child: BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return Slider(
                                  activeColor: primarycolor,
                                  inactiveColor: const Color(0xFFF5F6FA),
                                  value:star,
                                  max: 5.0,
                                  min: 0.0,
                                  onChanged: (value) {
                                    star=value;
                                    setState(() {

                                    });
                                  });
                            },
                          ),
                        ),
                        const Text('5.0'),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .095,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () async {
                    HiveHelper().addReview(_nameController.text, _descController.text,4.0);
                    Get.snackbar(
                        "Review submitted", "thanks for your time.",
                        backgroundColor: Colors.green);
                  },
                  child: Container(
                    height: 80,
                    color: primarycolor,
                    child: const Center(
                        child: Text(
                      'Submit Review',
                      style: TextStyle(color: Color(0xFFFEFEFE), fontSize: 17),
                    )),
                  ),
                ),
              )
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
