import 'package:Orea/screens/home_screen/home_screen.dart';
import 'package:Orea/screens/orea_real_estate_bidding/searchBox.dart';
import 'package:Orea/screens/plot_screen/plotScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/add_property/add_property.dart';
import 'package:Orea/screens/bid_history/bid_history.dart';
import 'package:Orea/screens/privecy_policy/privecy_policy.dart';
import 'package:Orea/screens/property_added_by_you/property_added_by_you.dart';
import 'package:Orea/screens/user_profile/user_profile.dart';
import 'package:Orea/screens/view_lists/view_lists.dart';
import 'package:readmore/readmore.dart';
import '../apartment_screen/apartment_screen.dart';
import '../commercial_screen/commercial_screen.dart';
import '../notifications/notification.dart';

class RealEstateBidding extends StatefulWidget {
  const RealEstateBidding({super.key});

  @override
  State<RealEstateBidding> createState() => _RealEstateBiddingState();
}

class _RealEstateBiddingState extends State<RealEstateBidding> {
  final List<String> images = [
    ImagePath.prop2,
    ImagePath.prop4,
    ImagePath.prop1,
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BoldText("OREA ", deepBlue, 18),
            BoldText("Real Estate Bidding", deepGreer, 15),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: deepBlue),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()));
              },
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 15),
            // SEARCH FIELD ----->>>
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(color: deepBlue),
                    shape: BoxShape.rectangle,
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  color: whiteColor,
                  child: InkWell(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchBox()));
                    }),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                        child: const Icon(
                          Icons.search,
                          color: deepBlue,
                        ),
                      ),
                      Expanded(
                          child: BoldText("Search any property...", hint, 15)),
                      // Container(
                      //   child: Icon(
                      //     Icons.person,
                      //     color: whiteColor,
                      //   ),
                      //   margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                      // )
                    ]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // CAROUSEL SLIDER ----->>>
            CarouselSlider(
              items: images
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: deepBlue),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(item), fit: BoxFit.cover)),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.65,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              dotsCount: images.length,
              position: _currentPage.toDouble(),
              decorator: const DotsDecorator(
                activeColor: deepBlue,
                spacing: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                size: Size.square(7),
                activeSize: Size.square(11.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                circularTab(Icons.home, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const homeScreen()));
                }, "Home"),
                circularTab(Icons.apartment, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const apartmentScreen()));
                }, "Apartment"),
                circularTab(Icons.map, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const plotScreen()));
                }, "Plots"),
                circularTab(Icons.add_home_work_sharp, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const commercialScreen()));
                }, "Commercial"),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: deepGreer, boxShadow: [
                    BoxShadow(
                        color: hint,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]),
                  child:
                      Center(child: BoldText("Quick Links", whiteColor, 15))),
            ),
            const SizedBox(height: 15),
            // QUICK LINK TABS ----->>>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("VIEW LISTINGS", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewListings()));
                }),
                userTabs("ADD PROPERTY", () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddProperty()));
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("ADDED BY YOU", () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddedByYou()));
                }),
                userTabs("VIEW BIDS", () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BidHistory()));
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("PROFILE", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(),
                    ),
                  );
                }),
                userTabs("OUR POLICY", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivecyScreen(),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: deepGreer, boxShadow: [
                    BoxShadow(
                        color: hint,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]),
                  child: Center(
                      child: BoldText("Interactive Contents", whiteColor, 15))),
            ),
            // INTERACTIVE CONTENTS ------->>>
            const SizedBox(height: 25),
            categories(ImagePath.prop4,
                "The real estate sector accounts for 60–70% of the country’s wealth, or around USD 300–400 billion, according to World Bank estimates."),
            const SizedBox(height: 20),
            categories(ImagePath.prop1,
                "Pakistan’s population is almost 220 Million Citizens being the 5th most populist state in the World. Approximately 36.38% of the population lives in urban areas & according to the 2017 Census, there is 2.4% annual population growth."),
            const SizedBox(height: 20),
            categories(ImagePath.prop3,
                "Secondly, private sector involvement is one of the prior reasons for the real estate sector to boom. Some big names include DHA. Bahria Town, Habib Rafique Group. These are the pioneers of Real Estate Pakistan."),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
userTabs(txt, clk) {
  return InkWell(
    onTap: clk,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 63,
        width: 150,
        decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.shade100,
                blurRadius: 5,
                spreadRadius: 0.5,
              )
            ],
            border: Border.all(color: deepGreer, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BoldText(txt, deepGreer, 12),
        ),
      ),
    ),
  );
}

// Interactive Contents ------>>>
Widget categories(String image, String text) {
  return Center(
    child: Column(
      children: [
        Container(
          height: 130,
          width: 280,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: hint, spreadRadius: 0.5, blurRadius: 3)
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
          child: ReadMoreText(
            text,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
            trimLength: 4,
            colorClickableText: deepBlue,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            lessStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            trimExpandedText: '  Read less',
            moreStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: deepBlue),
          ),
        ),
      ],
    ),
  );
}

circularTab(icon, clk, txt) {
  return InkWell(
    onTap: clk,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.shade100,
                    blurRadius: 5,
                    spreadRadius: 0.5,
                  )
                ],
                border: Border.all(color: deepGreer, width: 1),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Icon(icon, size: 25, color: deepGreer),
            ),
          ),
          const SizedBox(height: 10),
          LightText(txt, deepGreer, 15)
        ],
      ),
    ),
  );
}
