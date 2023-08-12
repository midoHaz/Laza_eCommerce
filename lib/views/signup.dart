import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_commerce/Network/client_dio.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/sighup_cubit/sighup_cubit.dart';
import 'package:laza_commerce/views/Login.dart';
import 'package:laza_commerce/views/snackBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? email;
  String?  password;
  bool isLoading = false;
  bool isCorrect = true;
  bool checkedValue = false;
  bool _isLoading=false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit,SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          _isLoading = true;
        } else if (state is SignupSuccess) {
          _isLoading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
          showSnackBar(context, state.successMessage);
        } else if (state is SignupFailure) {
          showSnackBar(context, state.errorMessage);
          _isLoading = false;
        }
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xFFF5F6FA),
                            child: IconButton(onPressed: () {
                              Navigator.pop(context);
                            },
                                icon: const Icon(
                                  Icons.arrow_back, color: Color(0xFF1D1E20),)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text("sign up",
                            // (AppLocalizations.of(context)!.signup),
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 28, color: Color(0xFF1D1E20)
                            ),),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .15,
                        ),
                        TextField(title: "user name",
                            // (AppLocalizations.of(context)!.username),
                            control: _userController,
                            hint: "Mohamed Hamza",
                            type: TextInputType.text,
                            obsecureText: false,
                            valid: (value) {
                              if (_userController.text.length < 3 || value
                                  .isEmpty) {
                                return "Enter A valid user name ";
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(title: 'password',
                            // (AppLocalizations.of(context)!.password),
                            control: _passwordController,
                            hint: "*************",
                            type: TextInputType.visiblePassword,
                            obsecureText: true,
                            valid: (value) {
                              if (_passwordController.text.length < 8 ||
                                  _passwordController.text.length == 0) {
                                return "Enter 8 digit or more for password";
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(title: "email",
                            // (AppLocalizations.of(context)!.email),
                            control: _emailController,
                            hint: "user.example8569@gmail.com",
                            type: TextInputType.emailAddress,
                            obsecureText: false,
                            valid: (value) {
                              if (_emailController.text.length < 15 ||
                                  _emailController.text.length == 0) {
                                return "Enter a Valid email password";
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(title: "phone",
                            // (AppLocalizations.of(context)!.),
                            control: _phoneController,
                            hint: "01234567891",
                            type: TextInputType.phone,
                            obsecureText: false,
                            valid: (value) {
                              if (_phoneController.text.length < 11 ||
                                  _phoneController.text.length == 0) {
                                return "Enter a Valid phone number";
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        CheckboxListTile(
                          activeColor: primarycolor,
                          checkColor: Colors.white,
                          title: Text(
                            // (AppLocalizations.of(context)!.remember)
                              "remember"
                          ),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(bottom: 0,
                    child: isLoading
                        ? const Center(
                        child: CircularProgressIndicator(color: primarycolor))
                        : Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignupCubit>(context)
                                  .signUpUser(
                                email: _emailController.text,
                                password:_passwordController.text,
                              );
                            }
                          },
                          child: Container(
                            height: 80,
                            color: primarycolor,
                            child: const Center(child: Text("sign up",
                              // (AppLocalizations.of(context)!.title_signup),
                              style: TextStyle(
                                  color: Color(0xFFFEFEFE), fontSize: 17),)),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding TextField({
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
          _textFieldTitle(title),
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

  Widget _textFieldTitle(String text) {
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
