import 'package:flutter/material.dart';
import 'package:laza_commerce/Helper/hive_helper.dart';
import 'package:laza_commerce/views/addReview.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  late HiveHelper hiveHelper;
  late List<String> reviewNames;
  late List<String> reviewDescriptions;
  late List<double> reviewStarRatings;

  @override
  void initState() {
    super.initState();
    hiveHelper = HiveHelper();
    // hiveHelper.getReviewsFromHive();
    reviewNames = hiveHelper.getReviewNames();
    print(reviewNames);
    reviewDescriptions = hiveHelper.getReviewDescriptions();
    reviewStarRatings = hiveHelper.getReviewStarRatings();
  }

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
                    const SizedBox(
                      width: 100,
                    ),
                    const Text(
                      'Reviews',
                      style: TextStyle(
                          // color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${HiveHelper().reviewsData.length} Reviews',
                            style: const TextStyle(
                                // color: Color(0xFF1D1E20),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            '4.8',
                            style: TextStyle(
                              // color: Color(0xFF1D1E20),
                              fontSize: 13,
                            ),
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
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddReview()));
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFFF981F)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_calendar_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Add Review',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => Reviewperson(
                          name:reviewNames[index],
                          desc:reviewDescriptions[index],
                          star:reviewStarRatings[index],
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          indent: 2,
                          endIndent: 2,
                          height: 20,
                          thickness: 2,
                        ),
                    itemCount: HiveHelper().reviewsData.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Reviewperson extends StatelessWidget {
  const Reviewperson({
    super.key,

    required this.name,
    required this.desc,
    required this.star,
  });


  final String name;
  final String desc;
  final double star;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person_2_rounded),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 6.0,
                ),
                const Row(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text('4.9',
                        style: TextStyle(
                            color: Color(0xFF1D1E20),
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
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: List.generate(5, (index) {
                    if (index < star.floor()) {
                      return const Icon(
                        Icons.star,
                        color: Color(0xFFFF981F),
                        size: 14,
                      );
                    } else if (index == star.floor() && star % 1 != 0) {
                      return const Icon(
                        Icons.star_half,
                        color: Color(0xFFFF981F),
                        size: 14,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border_outlined,
                        color: Color(0xFF8F959E),
                        size: 14,
                      );
                    }
                  }),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          desc,
          style: const TextStyle(
              color: Color(0xFF8F959E),
              fontSize: 15,
              overflow: TextOverflow.ellipsis),
          maxLines: 2,
        ),
      ],
    );
  }
}
