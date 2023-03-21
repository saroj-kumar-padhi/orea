import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:orea/common_utils/image_paths.dart';

import '../admin_user/admin_user.dart';

class RealEstateBidding extends StatefulWidget {
  RealEstateBidding({super.key});

  @override
  State<RealEstateBidding> createState() => _RealEstateBiddingState();
}

class _RealEstateBiddingState extends State<RealEstateBidding> {
  final List<String> images = [
    ImagePath.house,
    ImagePath.house,
    ImagePath.house,
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
          ],
        ),
        elevation: 0.5,
        backgroundColor: whiteColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 44, 24, 10),
          child: Column(
            children: [
              CarouselSlider(
                items: images.map((item) => Image.asset(item)).toList(),
                options: CarouselOptions(
                  height: 170,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
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
                  activeColor: Colors.blue,
                  size: Size.square(9.0),
                  activeSize: Size.square(12.0),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userTabs("REQUESTS", () {}),
                  userTabs("LISTINGS", () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userTabs("HISTORY", () {}),
                  userTabs("LOGOUT", () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminUserScreen()));
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userTabs("REQUESTS", () {}),
                  userTabs("LISTINGS", () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userTabs("HISTORY", () {}),
                  userTabs("LOGOUT", () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminUserScreen()));
                  }),
                ],
              ),
            ],
          ),
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
            border: Border.all(color: deepBlue, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BoldText(txt, deepBlue, 12),
        ),
      ),
    ),
  );
}
