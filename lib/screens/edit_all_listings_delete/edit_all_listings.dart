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
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("EDIT LISTINGS", deepGreer, 18),
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
              listItem(ImagePath.house, "Property Title", "PKR 2CR",
                  "by Asif Raza | asif@gmail.com"),
              listItem(ImagePath.house, "Property Title", "PKR 2CR",
                  "by Asif Raza | asif@gmail.com"),
              listItem(ImagePath.house, "Property Title", "PKR 2CR",
                  "by Asif Raza | asif@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, title, rate, owner) {
  return Column(
    children: [
      const SizedBox(height: 7),
      Row(
        children: [
          Container(
            height: 70,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: deepBlue, width: 1),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText(title, deepGreer, 17),
              const SizedBox(width: 8),
              BoldText(rate, deepBlue, 17),
              const SizedBox(height: 2),
              LightText(owner, deepGreer, 13),
            ],
          ),
          Expanded(
            flex: 2,
            // DELETE LISTINGS BUTTON ------->>>
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: deepBlue,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      const Divider(color: hint),
      const SizedBox(height: 10),
    ],
  );
}
