import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import 'package:Orea/common_utils/image_paths.dart';

class AllListingsDelete extends StatefulWidget {
  const AllListingsDelete({super.key});

  @override
  State<AllListingsDelete> createState() => _AllListingsDelete();
}

class _AllListingsDelete extends State<AllListingsDelete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("All LISTINGS", deepGreer, 18),
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
              listItem(ImagePath.house),
              const SizedBox(height: 35),
              const Divider(color: hint),
              const SizedBox(height: 35),
              listItem(ImagePath.house),
              const SizedBox(height: 35),
              const Divider(color: hint),
              const SizedBox(height: 35),
              listItem(ImagePath.house),
              const SizedBox(height: 35),
              const Divider(color: hint),
              const SizedBox(height: 35),
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
          BoldText("Property Title", deepGreer, 17),
          const SizedBox(width: 8),
          BoldText("PKR 2CR", deepBlue, 17),
          const SizedBox(height: 2),
          LightText("by Asif Raza|asif@gmail.com", deepGreer, 13),
        ],
      ),
      Expanded(
        flex: 19,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: deepBlue,
          ),
        ),
      ),
    ],
  );
}
