import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/Login.dart';

class NewPass extends StatefulWidget {
  const NewPass({Key? key}) : super(key: key);

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final _passController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                     "New Password",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 28,
                         color: Color(0xFF1D1E20)),
                     textAlign: TextAlign.center,
                   ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  TextFieldModel(
                      title: "password",
                      control: _passController,
                      hint: "*************",
                      type: TextInputType.visiblePassword,
                      obsecureText: true,
                      valid: (value) {
                        if (_passController.text.length < 6 ||
                            _passController.text.length == 0) {
                          return "Enter 8 digit or more for password";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldModel(
                      title: "Confirm password",
                      control: _passwordController,
                      hint: "*************",
                      type: TextInputType.visiblePassword,
                      obsecureText: true,
                      valid: (value) {
                        if (_passwordController.text.length < 6 ||
                            _passwordController.text.length == 0) {
                          return "Enter 8 digit or more for password";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 260,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65.0),
                    child: Text(
                      "Please write your new password.",
                      style: TextStyle(fontSize: 15, color: Color(0xFF8F959E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const Login()),
                        );
                      }
                    },
                    child: Container(
                      height: 80,
                      color: primarycolor,
                      child: const Center(
                          child: Text(
                            'Reset Password',
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
  Widget TextFieldModel({
    required String title,
    required TextEditingController control,
    required Function? valid,
    required String hint,
    required bool obsecureText,
    required TextInputType type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        children: [
          _TextFieldModelTitle(title),
          const SizedBox(
            height: 3,
          ),
          TextFormField(
            keyboardType: type,
            obscureText: obsecureText,
            controller: control,
            validator: (value) {
              return valid!(value);
            },
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }

  Widget _TextFieldModelTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF8F959E),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
