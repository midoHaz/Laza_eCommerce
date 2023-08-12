import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_commerce/Network/client_dio.dart';
import 'package:laza_commerce/Reset_cubit/reset_cubit.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/categories.dart';
import 'package:laza_commerce/views/Login.dart';
import 'package:laza_commerce/views/snackBar.dart';
import 'package:laza_commerce/views/verifecation.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetCubit, ResetState>(
  listener: (context, state) {
    if (state is ResetLoading) {
      _isLoading = true;
    } else if (state is ResetSuccess) {
      _isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Verifecation()));
      showSnackBar(context, state.successMessage);
    } else if (state is ResetFailure) {
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
                      "Forget Password",
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
                    child: Image.asset('assets/images/IMG.png',width:285 ,height:190 ,),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFieldModel(
                      title: "Email Address",
                      control: _emailController,
                      hint: "name.example1648@gmail.com",
                      type: TextInputType.emailAddress,
                      obsecureText: false,
                      valid: (value) {
                        if (_emailController.text.length < 20 ||
                            _emailController.text.length == 0) {
                          return "Enter A valid email address";
                        }
                        return null;
                      }),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*.20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Please write your email to receive a confirmation code to set a new password. ",
                      style: TextStyle(fontSize: 15, color: Color(0xFF8F959E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 InkWell(
                    onTap: () async {
                      if(formKey.currentState!.validate()){
                        BlocProvider.of<ResetCubit>(context)
                            .resetPassword(
                           emailController: _emailController,
                        );
                      }
                    },
                    child: Container(
                      height: 80,
                      color: primarycolor,
                      child: const Center(
                          child: Text(
                            'Confirm Mail',
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
