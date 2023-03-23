import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../orea_real_estate_bidding/orea_real_estate_bidding.dart';

class PrivecyScreen extends StatelessWidget {
  const PrivecyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("PRIVACY POLICY", deepGreer, 18),
        centerTitle: true,
        elevation: 0.0,
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
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ParagraphText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti.",
                  deepGreer,
                  15,
                  TextAlign.left)
            ],
          ),
        ),
      ),
    );
  }
}
