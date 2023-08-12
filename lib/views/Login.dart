import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_commerce/Network/client_dio.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/cubit/login_cubit/login_cubit.dart';
import 'package:laza_commerce/views/categories.dart';
import 'package:laza_commerce/views/forgetPassword.dart';
import 'package:laza_commerce/views/layout_screen.dart';
import 'package:laza_commerce/views/snackBar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool checkedValue = false;
  bool isLoading = false;
  bool _isLoading=false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is SignInLoading) {
      _isLoading = true;
    } else if (state is SignInSuccess) {
      _isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LayoutScreen()));
      showSnackBar(context, state.successMessage);
    } else if (state is SignInFailure) {
      showSnackBar(context, state.errorMessage);
      _isLoading = false;
    }
  },
  child: Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
                    padding: EdgeInsets.only(left: 65.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              // color: Color(0xFF1D1E20)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please enter your data to continue",
                          style: TextStyle(
                              fontSize: 15, color: Color(0xFF8F959E)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .11,
                  ),
                  TextFieldModel(
                      title: "Email Address",
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
                  TextFieldModel(
                      title: "password",
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
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Forget()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Color(0xFFEA4335), fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    activeColor: primarycolor,
                    checkColor: Colors.white,
                    title: const Text("Remember Me "),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .12,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "By connecting your account confirm that you agree with our Term and Condition",
                      style: TextStyle(
                          fontSize: 15, color: Color(0xFF8F959E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _isLoading
                      ? const Center(
                      child: CircularProgressIndicator(color: primarycolor))
                      : Container(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .signInUser(
                            email: _emailController.text,
                            password:_passwordController.text,
                          );
                        }
                      },
                      child: Container(
                        height: 80,
                        color: primarycolor,
                        child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Color(0xFFFEFEFE), fontSize: 17),
                            )),
                      ),
                    ),
                  )
                ],
              ),
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
