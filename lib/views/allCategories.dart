import 'package:flutter/material.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/categories.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}
List<Widget>catergories=[
   Category(cat: 'assets/images/cat1.png',desc: 'Nike Sportswear Club Fleece',price: '99', isClicked: false,index: 1,),
   Category(cat: 'assets/images/cat2.png',desc: 'Trail Running Jacket Nike ',price: '99',isClicked: false,index: 2,),
   Category(cat: 'assets/images/cat3.png',desc: 'Training Top Nike Sport Clash',price: '99',isClicked: false,index: 3,),
   Category(cat: 'assets/images/cat4.png',desc: 'Trail Running Jacket Nike',price: '99',isClicked: false,index: 4,),
  Category(cat: 'assets/images/cat1.png',desc: 'Nike Sportswear Club Fleece',price: '99', isClicked: false,index: 1,),
  Category(cat: 'assets/images/cat2.png',desc: 'Trail Running Jacket Nike ',price: '99',isClicked: false,index: 2,),
  Category(cat: 'assets/images/cat3.png',desc: 'Training Top Nike Sport Clash',price: '99',isClicked: false,index: 3,),
  Category(cat: 'assets/images/cat4.png',desc: 'Trail Running Jacket Nike',price: '99',isClicked: false,index: 4,),

];
class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    const Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xFFF5F6FA),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Color(0xFF1D1E20),
                          )),
                    ),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New arrival collections",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        // color: Color(0xFF1D1E20)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "enjoy watching best arrival",
                    style: TextStyle(fontSize: 15, color: Color(0xFF8F959E)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
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
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor:primarycolor),
              child:const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 8.0, vertical: 17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                    SizedBox(width: 12,),
                    Text(
                      "Create Own Pack",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
        ),
            ],
          ),
        ),
      ),
    );
  }
}
