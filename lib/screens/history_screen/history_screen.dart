import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import 'package:Orea/common_utils/image_paths.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("HISTORY", deepGreer, 18),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              BoldText('All Property Purchase Will Appear Here', deepGreer, 12),
              const SizedBox(height: 20),
              listItem(
                ImagePath.house,
                "Property Title",
                "PKR 2Cr",
                "by Asif Raza | asif@gmail.com",
                "by Asif Raza | asif@gmail.com",
              ),
              listItem(
                ImagePath.house,
                "Property Title",
                "PKR 2Cr",
                "by Asif Raza | asif@gmail.com",
                "by Asif Raza | asif@gmail.com",
              ),
              listItem(
                ImagePath.house,
                "Property Title",
                "PKR 2Cr",
                "by Asif Raza | asif@gmail.com",
                "by Asif Raza | asif@gmail.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, title, rate, seller, buyer) {
  return Column(
    children: [
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: deepBlue, width: 1),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                BoldText(title, deepGreer, 15),
                const SizedBox(width: 8),
                BoldText(rate, deepBlue, 15),
              ]),
              const SizedBox(height: 15),
              Row(
                children: [
                  BoldText("SELLER: ", deepBlue, 11),
                  LightText(seller, deepGreer, 11),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoldText("BUYER: ", deepGreer, 11),
                  LightText(buyer, deepGreer, 11),
                ],
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),
      const Divider(color: hint),
      const SizedBox(height: 10),
    ],
  );
}
