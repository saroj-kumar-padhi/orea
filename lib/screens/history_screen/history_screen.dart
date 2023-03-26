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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 44, 24, 10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              BoldText('All Property Purchese Will Appear Here', deepGreer, 12),
              const SizedBox(height: 35),
              listItem(ImagePath.house),
              const SizedBox(height: 25),
              const Divider(color: hint),
              const SizedBox(height: 25),
              listItem(ImagePath.house),
              const SizedBox(height: 25),
              const Divider(color: hint),
              const SizedBox(height: 25),
              listItem(ImagePath.house),
              const SizedBox(height: 25),
              const Divider(color: hint),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(
  image,
) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          image,
          height: 100,
          width: 120,
        ),
      ),
      const SizedBox(width: 22),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            BoldText("Property Title", deepGreer, 15),
            const SizedBox(width: 8),
            BoldText("PKR 2Cr", deepBlue, 15),
          ]),
          const SizedBox(height: 15),
          Row(
            children: [
              BoldText("SELLER: ", deepGreer, 11),
              LightText("by Asif Raza|asif@gmail.com", deepGreer, 11),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              BoldText("BUYER: ", deepBlue, 11),
              LightText("by Asif Raza|asif@gmail.com", deepGreer, 11),
            ],
          ),
        ],
      ),
    ],
  );
}
