import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/Login.dart';
import 'package:laza_commerce/views/signup.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dash extends StatelessWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Stack(
          children:[ Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFFF5F6FA),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back,color: Color(0xFF1D1E20),)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                 child: Text('Let\'s Get Started'
                   // (AppLocalizations.of(context)!.started)
                   ,style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 28,color: Color(0xFF1D1E20)
                  ),),
               ),
                const SizedBox(
                  height: 120,
                ),
                buildButton(color:  const Color(0xFF4267B2),image: 'assets/images/Facebook.png',text: 'FaceBook',ontap: (){
                  launchUrlString('https://web.facebook.com');
                }),
                const SizedBox(
                  height: 12,
                ),
                buildButton(color:  const Color(0xFF1DA1F2),image: 'assets/images/Twitter.png',text: 'Twitter',ontap: (){
                  launchUrlString('https://twitter.com');
                }),
                const SizedBox(
                  height: 12,
                ),
                buildButton(color:  const Color(0xFFEA4335),image: 'assets/images/Google.png',text: 'Google',ontap: (){
                  launchUrlString('https://www.google.com.eg/?hl=ar');
                }),

              ],
            ),
          ),
            Positioned(bottom:0 ,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         const Text('Already have an account?',
                          // (AppLocalizations.of(context)!.already),
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                          },
                          child:  const Text(
                            'Signin',
                            // (AppLocalizations.of(context)!.signin),
                            style: TextStyle(
                              color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>  const SignUp()
                          ),

                        );
                      },
                      child: Container(
                        height: 80,
                        color: primarycolor,
                        child: const Center(child: Text(
                          "Create an Account"
                          // (AppLocalizations.of(context)!.create)
                          ,style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 17),)) ,
                      ),
                    )
                  ],
                ),
              ),
            )

          ]
        ),
      ),
    );
  }
  Widget buildButton({
  required String text,
   required String image,
    required Color color,
    required ontap,
}) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  onPressed:ontap,
                  style: ElevatedButton.styleFrom(
                      backgroundColor:color),
                  child:Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(image,width: 30,height: 30,),
                        const SizedBox(width: 12,),
                        Text(
                          text,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  )),
            );
  }
}
