import 'package:flutter/material.dart';
import '../../../components/category_boxes.dart';
import '../../../components/discover_small_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: getProportionateScreenHeight(120),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(14),
                  ),
                  CategoryBoxes(
                    text: "Poverty",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Zero Hunger",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Health",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Education",
                    onPressed: (value) => print(value),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(28)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Posts",
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: getProportionateScreenWidth(14)),
                  ),
                  GestureDetector(
                      onTap: onSeeAllTapped,
                      child: Text("See All",
                          style: TextStyle(
                              color: const Color(0xff4A80F0),
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenWidth(14))))
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
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
            SizedBox(height: getProportionateScreenHeight(28)),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(28)),
              child: Text(
                "Donate Now",
                style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(14)),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(16)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(28)),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: getProportionateScreenWidth(19),
                    mainAxisExtent: getProportionateScreenWidth(125),
                    mainAxisSpacing: getProportionateScreenWidth(19)),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: () {},
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
            )
          ],
        ),
      ),
    );
  }

  void onSeeAllTapped() {}

  void onSleepMeditationTapped() {
    // Get.to(() => DetailPage(), transition: Transition.rightToLeft);
  }

  void onDepressionHealingTapped() {}

  void onSearchIconTapped() {}
}
