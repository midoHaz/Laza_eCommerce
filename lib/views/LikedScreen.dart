import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/categories.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}
List<Widget>catergories=[
  Category(cat: 'assets/images/cat1.png',desc: 'Nike Sportswear Club Fleece',price: '99', isClicked: false,index: 1,),
  Category(cat: 'assets/images/cat2.png',desc: 'Trail Running Jacket Nike ',price: '99',isClicked: false,index: 2,),
  Category(cat: 'assets/images/cat3.png',desc: 'Training Top Nike Sport Clash',price: '99',isClicked: false,index: 3,),
  Category(cat: 'assets/images/cat4.png',desc: 'Trail Running Jacket Nike',price: '99',isClicked: false,index: 4,),
];
class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Favorite Items',
                      style: TextStyle(
                        // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 520,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GridView.builder(
                    // shrinkWrap: true,
                    //   physics:const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 0.670
                      ),
                      itemCount: catergories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return catergories[index];
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
