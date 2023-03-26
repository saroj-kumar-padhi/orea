import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/place_your_bid/place_your_bid.dart';

class ViewListings extends StatefulWidget {
  const ViewListings({super.key});

  @override
  State<ViewListings> createState() => _ViewListings();
}

class _ViewListings extends State<ViewListings> {
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
              listItem(ImagePath.house, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceYourBid(),
                  ),
                );
              }),
              const SizedBox(
                height: 27,
              ),
              const Divider(color: hint),
              const SizedBox(height: 27),
              listItem(ImagePath.house, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaceYourBid()));
              }),
              const SizedBox(height: 27),
              const Divider(color: hint),
              const SizedBox(height: 27),
              listItem(ImagePath.house, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaceYourBid()));
              })
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, onTap) {
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
      Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BoldText("Property Title", deepGreer, 17),
            const SizedBox(width: 8),
            BoldText("PKR 2CR", deepBlue, 17)
          ],
        ),
        const SizedBox(height: 2),
        LightText("by Asif Raza|asif@gmail.com", deepGreer, 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              elevation: 0.0,
              color: deepBlue,
              height: 28,
              minWidth: 95,
              onPressed: onTap,
              child: BoldText("BUY", whiteColor, 13),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: deepBlue)),
            ),
            const SizedBox(width: 8),
            MaterialButton(
              elevation: 0.0,
              color: whiteColor,
              height: 28,
              minWidth: 95,
              onPressed: () {},
              child: BoldText("BID", deepBlue, 13),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: deepBlue)),
            ),
          ],
        )
      ]),
    ],
  );
}
