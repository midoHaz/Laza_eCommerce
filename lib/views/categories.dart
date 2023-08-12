import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/cubit/dark_cubit/dark_cubit.dart';
import 'package:laza_commerce/cubit/language_cubit/language_cubit.dart';
import 'package:laza_commerce/views/Card_Screen.dart';
import 'package:laza_commerce/views/allCategories.dart';
import 'package:laza_commerce/views/dashboard.dart';
import 'package:laza_commerce/views/itemDetails.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

List<Widget> brands = [
  const Brand(image: 'assets/images/Adidas.png', brand: "Adidas"),
  const Brand(image: 'assets/images/Vector.png', brand: "Nike"),
  const Brand(image: 'assets/images/fila-9 1.png', brand: "Fila"),
  const Brand(image: 'assets/images/puma-logo 1.png', brand: "Puma"),
];
List<Widget>catergories=[
   Category(cat: 'assets/images/cat1.png',desc: 'Nike Sportswear Club Fleece',price: '99',isClicked: false,index: 1,),
  Category(cat: 'assets/images/cat2.png',desc: 'Trail Running Jacket Nike ',price: '99',isClicked: false,index: 2),
   Category(cat: 'assets/images/cat3.png',desc: 'Training Top Nike Sport Clash',price: '99',isClicked: false,index: 3),
   Category(cat: 'assets/images/cat4.png',desc: 'Trail Running Jacket Nike',price: '99',isClicked: false,index: 4),
];

class _CategoriesState extends State<Categories> {
  final _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey ,
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
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
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: const Icon(
                              Icons.list,
                              color: Color(0xFF1D1E20),
                            )),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFF5F6FA),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CardScreen()));
                            },
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
                      "Hello",
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
                      "Welcome to laza.",
                      style: TextStyle(fontSize: 15, color: Color(0xFF8F959E)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 285,
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF8F959E),
                          ),
                          hintText: "Search...",
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
                      width: 20,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primarycolor,
                      ),
                      child: Image.asset(
                        'assets/images/Voice.png',
                        color: const Color(0xFFFEFEFE),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'Choose Brand',
                      style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: TextStyle(color: Color(0xFF8F959E), fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return brands[index];
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: brands.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'New Arrival',
                      style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const AllCategories()),
                        );
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(color: Color(0xFF8F959E), fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
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
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              const Spacer(),
              CircleAvatar(
                backgroundColor: const Color(0xffF5F5F5),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:  const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/Frame 1 1.png'),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohamed hamza',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Verified Profile',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8F959E)
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children:
                            [
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Color(0xff4AC76D),
                              ),
                              Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.white,
                              ),
                            ],
                          ),

                        ],
                      ),

                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Text(
                      '3 Order',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8F959E)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (){
                  context.read<DarkCubit>().toggleTheme();
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.wb_sunny_outlined,
                    color: Color(0xff1D1E20),
                    size: 25,
                  ),
                  title: Text(
                    "Dark Mode",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
               GestureDetector(
                 onTap: (){
                   context.read<LanguageCubit>().changeLanguage();
                 },
                 child: const ListTile(
                  leading: Icon(
                    Icons.sports_basketball_outlined,
                    color: Color(0xff1D1E20),
                    size: 25,
                  ),
                  title: Text(
                    "Language",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),
                  ),
              ),
               ),
              const ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Color(0xff1D1E20),
                  size: 25,
                ),
                title: Text(
                  "Account Information",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: Color(0xff1D1E20),
                  size: 25,
                ),
                title: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xff1D1E20),
                  size: 25,
                ),
                title: Text(
                  "Order",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  color: Color(0xff1D1E20),
                  size: 25,
                ),
                title: Text(
                  "Wishlist",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  color: Color(0xff1D1E20),
                  size: 25,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: (){
                  Get.offAll(const Dash());
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.login_outlined,
                    color: Color(0xffFF5757),
                    size: 25,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFF5757)
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(7),
    );
  }
}

class Category extends StatefulWidget {
  Category({
    super.key, required this.cat, required this.desc, required this.price, required this.isClicked,required this.index,
  });
  final String cat;
  final String desc;
  final String price;
  bool isClicked;
  final int index;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemDetail(index : widget.index)));
      },
      onDoubleTap: (){
        widget.isClicked=!widget.isClicked;
        setState(() {
        });
      },
      child: Stack(children: [
        Container(
          width: 160,
          height: 262,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.cat),
              const SizedBox(
                height: 7,
              ),
              Text(
                '${widget.desc} \n Fleece',
                style:
                const TextStyle(
                    // color: Color(0xFF1D1E20)
                    fontSize: 11),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                '\$${widget.price}',
                style: const TextStyle(
                    // color: Color(0xFF1D1E20),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(top: 20,right: 30,width: 20,height: 20,child:widget.isClicked?Image.asset('assets/images/Heart.png',color:Colors.red,):Image.asset('assets/images/Heart.png',) ),
      ]),
    );
  }
}

class Brand extends StatelessWidget {
  const Brand({
    super.key,
    required this.image,
    required this.brand,
  });

  final String image;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF5F6FA),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Container(
              height: 23,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFFFFFFFF),
              ),
              child: Center(
                  child: Image.asset(
                image,
                color: const Color(0xFF1D1E20),
              )),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              brand,
              style: const TextStyle(
                  color: Color(0xFF1D1E20),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
