import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/views/Card_Screen.dart';
import 'package:laza_commerce/views/showReviews.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({required this.index, Key? key}) : super(key: key);
  final int index;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  late Map<int, List<String>> indexToImages;
  List<String> images1 = [
    'assets/images/shape1.png',
    'assets/images/shape2.png',
    'assets/images/shape3.png',
    'assets/images/item1.png',
  ];
  List<String> images2 = [
    'assets/images/cat2.png',
    'assets/images/cat2.png',
    'assets/images/cat2.png',
    'assets/images/cat2.png',
  ];
  List<String> images3 = [
    'assets/images/cat3.png',
    'assets/images/cat3.png',
    'assets/images/cat3.png',
    'assets/images/cat3.png',
  ];
  List<String> images4 = [
    'assets/images/cat4.png',
    'assets/images/cat4.png',
    'assets/images/cat4.png',
    'assets/images/cat4.png',
  ];
  List<Widget> sizes = [
    const SizeGuide(
      text: 'S',
    ),
    const SizeGuide(
      text: 'M',
    ),
    const SizeGuide(
      text: 'L',
    ),
    const SizeGuide(
      text: 'XL',
    ),
    const SizeGuide(
      text: '2XL',
    ),
  ];

  @override
  void initState() {
    super.initState();

    indexToImages = {
      1: images1,
      2: images2,
      3: images3,
      4: images4,
    };
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = indexToImages[widget.index] ?? [];
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Image.asset(
                  'assets/images/cat${widget.index}.png',
                  width: double.infinity,
                  height: 395,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFFFFFFF),
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
                        backgroundColor: const Color(0xFFFFFFFF),
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
                Positioned(
                  right: 147,
                  bottom: 15,
                  child: Image.asset(
                    'assets/images/itemlogo.png',
                    width: 80,
                    height: 49,
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Men\'s Printed Pullover Hoodie',
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 13,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Price',
                          style:
                              TextStyle(color: Color(0xFF8F959E), fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Nike Club Fleece',
                          style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          '\$99',
                          style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 86,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, indexa) => Image.asset(
                                  images[indexa],
                                  width: 85,
                                  height: 85,
                                  fit: BoxFit.fill,
                                ),
                            separatorBuilder: (context, indexa) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: images.length)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'Size Guide',
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => sizes[index],
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: sizes.length)),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with',
                            style: TextStyle(
                              color: Color(0xFF8F959E),
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: ' Read More..',
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Review',
                          style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Reviews()));
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              color: Color(0xFF8F959E),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/reviewer.png'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ronald Richards',
                                style: TextStyle(
                                    // color: Color(0xFF1D1E20),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('13 Sep, 2020',
                                    style: TextStyle(
                                      color: Color(0xFF8F959E),
                                      fontSize: 11,
                                    )),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('4.9',
                                    style: TextStyle(
                                        // color: Color(0xFF1D1E20),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('rating',
                                    style: TextStyle(
                                      color: Color(0xFF8F959E),
                                      fontSize: 11,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFF981F),
                                  size: 14,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFF981F),
                                  size: 14,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFF981F),
                                  size: 14,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFF981F),
                                  size: 14,
                                ),
                                Icon(
                                  Icons.star_border_outlined,
                                  color: Color(0xFF8F959E),
                                  size: 14,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet',
                      style: TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Price',
                                style: TextStyle(
                                    // color: Color(0xFF1D1E20),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text('with VAT,SD',
                                style: TextStyle(
                                  color: Color(0xFF8F959E),
                                  fontSize: 11,
                                )),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '\$105',
                          style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.snackbar(
                      "Successfully added to card", "keep shopping on ",
                      backgroundColor: Colors.green);
                },
                child: Container(
                  height: 80,
                  color: primarycolor,
                  child: const Center(
                      child: Text(
                    'Add to Card',
                    style: TextStyle(color: Color(0xFFFEFEFE), fontSize: 17),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SizeGuide extends StatelessWidget {
  const SizeGuide({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF5F6FA),
      ),
      width: 65,
      height: 65,
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color(0xFF1D1E20)),
      )),
    );
  }
}
