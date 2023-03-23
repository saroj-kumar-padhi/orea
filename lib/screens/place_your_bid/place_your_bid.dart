import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:orea/common_utils/image_paths.dart';
import 'package:orea/screens/buy_property/buy_property.dart';

import '../admin_user/admin_user.dart';

class PlaceYourBid extends StatelessWidget {
  const PlaceYourBid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("PLACE YOUR BID", deepGreer, 18),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 37, 34, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImagePath.house,
                height: 185,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 37),
              Row(
                children: [
                  BoldText("Property Title", deepGreer, 15),
                  const SizedBox(width: 10),
                  BoldText("PKR  2CR", deepBlue, 13),
                ],
              ),
              const SizedBox(height: 8),
              LightText("by Asif Raza|asif@gmail.com", deepGreer, 12),
              const SizedBox(height: 8),
              ParagraphText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti.",
                  deepGreer,
                  15,
                  TextAlign.left),
              const SizedBox(height: 45),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "enter your amount",
                  hintStyle: const TextStyle(
                      fontFamily: "Poppins", color: hint, fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: deepBlue)),
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "any message/offer",
                  hintStyle: const TextStyle(
                      fontFamily: "Poppins", color: hint, fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: deepBlue)),
                ),
              ),
              const SizedBox(height: 80),
              MaterialButton(
                color: deepBlue,
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuyProperty()));
                },
                child: BoldText("Place Bid", whiteColor, 18),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
