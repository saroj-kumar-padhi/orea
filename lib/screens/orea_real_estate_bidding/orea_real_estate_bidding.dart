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
import 'package:Orea/screens/your_balance/your_balance.dart';
import 'package:readmore/readmore.dart';
import '../contact_us_screen/contact_us_screen.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BoldText("OREA ", deepGreer, 18),
            BoldText("Real Estate Bidding", deepGreer, 15),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: hint),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()));
              },
            ),
          ],
        ),
        elevation: 0.5,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // CAROUSEL SLIDER ----->>>
            CarouselSlider(
              items: images.map((item) => Image.asset(item)).toList(),
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
            const SizedBox(height: 20),
            BoldText("...Quick Links...", deepGreer, 15),
            const SizedBox(height: 10),
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
                userTabs("BALANCE", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const YourBalance()));
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("OUR POLICY", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivecyScreen(),
                    ),
                  );
                }),
                userTabs("CONTACT US", () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContactUsScreen()));
                }),
              ],
            ),
            const SizedBox(height: 20),
            BoldText("...Interactive Contents...", deepGreer, 15),
            // INTERACTIVE CONTENTS ------->>>
            const SizedBox(height: 20),
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
