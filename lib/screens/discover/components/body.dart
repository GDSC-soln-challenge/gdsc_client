import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/allposts/allposts.dart';
import '../../../components/discover_small_card.dart';
import '../../../constants.dart';
import 'package:carousel_images/carousel_images.dart';

import '../../donate_money/donate_screen.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String> listImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStHQUAO2NU1SIbQaoivul6sszFCAWw7kDySQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStHQUAO2NU1SIbQaoivul6sszFCAWw7kDySQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStHQUAO2NU1SIbQaoivul6sszFCAWw7kDySQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStHQUAO2NU1SIbQaoivul6sszFCAWw7kDySQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStHQUAO2NU1SIbQaoivul6sszFCAWw7kDySQ&usqp=CAU',
  ];

  Widget buildCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.network(
                    "https://m.economictimes.com/thumb/msid-63293846,width-1200,height-900,resizemode-4,imgsize-49958/donation-charity.jpg",
                    fit: BoxFit.cover,
                    width: 200,
                    height: 100),
              ),
              Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Donate to Charity",
                          style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 20,
                            ),
                          ],
                        ),
                        Row(
                          // align at right end of the row
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            // make read more link clickable
                            Text(
                              "Read More",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SafeArea(
        child: ListView(
          // physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              // height: getProportionateScreenHeight(20),
              height: 20 / 812 * MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 28 / 375 * MediaQuery.of(context).size.width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Posts",
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14 / 375 * MediaQuery.of(context).size.width),
                  ),
                  GestureDetector(
                      onTap: onSeeAllTapped,
                      child: Text("See All",
                          style: TextStyle(
                              color: const Color(0xff4A80F0),
                              fontWeight: FontWeight.w500,
                              fontSize: 14 /
                                  375 *
                                  MediaQuery.of(context).size.width)))
                ],
              ),
            ),
            SizedBox(
              height: 16 / 812 * MediaQuery.of(context).size.height,
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return buildCard();
                  },
                )),
            SizedBox(height: 28 / 812 * MediaQuery.of(context).size.height),
            Padding(
              padding: EdgeInsets.only(
                  left: 28 / 375 * MediaQuery.of(context).size.width),
              child: Text(
                "Donate Now",
                style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14 / 375 * MediaQuery.of(context).size.width),
              ),
            ),
            SizedBox(height: 16 / 812 * MediaQuery.of(context).size.height),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:
                      19 / 375 * MediaQuery.of(context).size.width,
                  mainAxisExtent: 125 / 375 * MediaQuery.of(context).size.width,
                  mainAxisSpacing: 19 / 375 * MediaQuery.of(context).size.width,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: () {
                      Navigator.pushNamed(context, DonateMoneyScreen.routeName);
                    },
                    title: "Money",
                    gradientStartColor: const Color(0xff13DEA0),
                    gradientEndColor: const Color(0xff06B782),
                    icon: const Icon(Icons.monetization_on_outlined,
                        color: Colors.white, size: 24),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Food",
                    gradientStartColor: const Color(0xffFC67A7),
                    gradientEndColor: const Color(0xffF6815B),
                    icon: const Icon(Icons.food_bank_outlined,
                        color: Colors.white, size: 24),
                    // icon: SvgAsset(
                    //   assetName: AssetName.tape,
                    //   height: getProportionateScreenWidth(24),
                    //   width: getProportionateScreenWidth(24),
                    // ),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Blood",
                    gradientStartColor: const Color(0xffFFD541),
                    gradientEndColor: const Color(0xffF0B31A),
                    icon: const Icon(Icons.medical_services_outlined,
                        color: Colors.white, size: 24),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Books",
                    icon: const Icon(Icons.school_outlined,
                        color: Colors.white, size: 24),
                    // icon: SvgAsset(
                    //   assetName: AssetName.tape,
                    //   height: getProportionateScreenWidth(24),
                    //   width: getProportionateScreenWidth(24),
                    // ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28 / 812 * MediaQuery.of(context).size.height),
            // Text("Coverflow carousel")
            Padding(
              padding: EdgeInsets.only(
                  left: 28 / 375 * MediaQuery.of(context).size.width),
              child: Text(
                "Our Recent Activities",
                style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14 / 375 * MediaQuery.of(context).size.width),
              ),
            ),
            // CarouselImages using carousel_images package's CarouselImages widget
            SizedBox(height: 16 / 812 * MediaQuery.of(context).size.height),
            SingleChildScrollView(
              child: CarouselImages(
                scaleFactor: 0.7,
                listImages: listImages,
                height: 200.0,
                borderRadius: 30.0,
                // cachedNetworkImage: true,
                verticalAlignment: Alignment.bottomCenter,
                onTap: (index) {
                  print('Tapped on page $index');
                },
              ),
            ),
            SizedBox(height: 28 / 812 * MediaQuery.of(context).size.height),
          ],
        ),
      ),
    );
  }

  void onSeeAllTapped() {
    Navigator.pushNamed(context, AllPosts.routeName);
  }

  void onSleepMeditationTapped() {
    // Get.to(() => DetailPage(), transition: Transition.rightToLeft);
  }

  void onDepressionHealingTapped() {}

  void onSearchIconTapped() {}
}
