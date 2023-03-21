import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';

class RealEstateBidding extends StatefulWidget {
  RealEstateBidding({super.key});

  @override
  State<RealEstateBidding> createState() => _RealEstateBiddingState();
}

class _RealEstateBiddingState extends State<RealEstateBidding> {
  final List<String> images = [
    'assets/images/house_image.png',
    'assets/images/house_image.png',
    'assets/images/house_image.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            BoldText("OREA", deepGreer, 18),
            LightText("Real Estate Bidding", deepGreer, 15),
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
              Stack(
                children: [
                  CarouselSlider(
                    items: images.map((item) => Image.network(item)).toList(),
                    options: CarouselOptions(
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
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: DotsIndicator(
                      dotsCount: images.length,
                      position: _currentPage.toDouble(),
                      decorator: const DotsDecorator(
                        activeColor: Colors.blue,
                        size: Size.square(9.0),
                        activeSize: Size.square(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
