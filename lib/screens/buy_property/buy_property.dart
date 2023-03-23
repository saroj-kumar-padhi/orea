import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:orea/common_utils/image_paths.dart';

import '../admin_user/admin_user.dart';
import '../payment_screen/payment_screen.dart';

class BuyProperty extends StatelessWidget {
  const BuyProperty({super.key});

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
          padding: const EdgeInsets.fromLTRB(25, 37, 25, 47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImagePath.house,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 37),
              Row(
                children: [
                  BoldText("Property Title", deepGreer, 15),
                  const SizedBox(width: 5),
                  BoldText("PKR", deepBlue, 13),
                ],
              ),
              const SizedBox(height: 10),
              LightText("by Asif Raza I asif@gmail.com", deepGreer, 12),
              const SizedBox(height: 12),
              ParagraphText(
                  "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Donec in scelerisque velit, \na interdum libero. In quis molestie nunc. \nPellentesque lacinia pulvinar felis non faucibus. \nSuspendisse potenti.",
                  deepGreer,
                  15,
                  TextAlign.left),
              const Spacer(),
              MaterialButton(
                color: deepBlue,
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentScreen()));
                },
                child: BoldText("Proceed to Pay", whiteColor, 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
