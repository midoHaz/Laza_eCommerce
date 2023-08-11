import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/dashboard.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  int num;
  double percent;
  double percentage;
  OnBoardingScreen({
    super.key,
    required this.num,
    required this.percent,
    required this.percentage,
  });

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<String> descriptions=[
    ".Fashion is an international language",
    ".Shopping is the best sport to relieve stress",
    "Think out the box for models"
  ];

  List<String> more=[
    "Enjoy your lovely moments, this is how to appreciate them",
    "Each new day in life is a new chance to be better, happier and smarter. Do not lose the Chance",
    "More and more models we provide feel free to share with us any model that you think"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding${widget.num}.png",height: 300,),
            const SizedBox(height: 50,),
            Text(descriptions[widget.num-1],style: const TextStyle(
                fontSize: 30
            ),textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            Text(more[widget.num-1],style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            GestureDetector(
                onTap: (){
                  if(widget.num<3){
                    widget.num =widget.num+1;
                    widget.percent=widget.percent+0.35;
                    widget.percentage=widget.percentage+35;
                    setState(() {
                    });

                  }else{
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>  const Dash()
                      ),

                    );
                  }

                },
                child:CircularPercentIndicator(
                  radius: 50.0,
                  lineWidth: 7.0,
                  percent: widget.percent,
                  center:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5.0,),
                      const Icon(Icons.arrow_forward_outlined,color: primarycolor,size: 30,)
                    ],
                  ),
                  progressColor:primarycolor,
                ))

          ],
        ),
      ),
    );
  }
}
