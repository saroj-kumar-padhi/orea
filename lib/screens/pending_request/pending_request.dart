import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/place_your_bid/place_your_bid.dart';

class PendingRequest extends StatelessWidget {
  const PendingRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("PENDING REQUESTS", deepGreer, 18),
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
              listItem(
                ImagePath.house,
                "Property Title",
                "PKR 90L",
                // APPROVE ------->>>
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlaceYourBid(),
                    ),
                  );
                },
                // DECLINE ------->>>
                () {},
              ),
              listItem(
                ImagePath.house,
                "Property Title",
                "PKR 90L",
                // APPROVE ------->>>
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlaceYourBid(),
                    ),
                  );
                },
                // DECLINE ------->>>
                () {},
              ),
              listItem(
                ImagePath.house,
                "Property Title",
                "PKR 90L",
                // APPROVE ------->>>
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlaceYourBid(),
                    ),
                  );
                },
                // DECLINE ------->>>
                () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, title, rate, approve, decline) {
  return Column(
    children: [
      const SizedBox(height: 12),
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BoldText(title, deepGreer, 16),
                const SizedBox(width: 10),
                BoldText(rate, deepBlue, 16)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0.0,
                  color: deepBlue,
                  height: 28,
                  minWidth: 95,
                  onPressed: approve,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: deepBlue)),
                  child: BoldText("Approve", whiteColor, 13),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  elevation: 0.0,
                  color: whiteColor,
                  height: 28,
                  minWidth: 95,
                  onPressed: decline,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: deepBlue)),
                  child: BoldText("Decline", deepBlue, 13),
                ),
              ],
            )
          ]),
        ],
      ),
      const SizedBox(height: 15),
      const Divider(color: hint),
    ],
  );
}
