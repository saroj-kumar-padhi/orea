import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orea/common_utils/image_paths.dart';

import '../../common_utils/common_utils.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("CONTACT US", deepGreer, 18),
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
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              ImagePath.profile,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 30),
            BoldText("Mr. Aziz Ul,lah", deepGreer, 15),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoldText("email: ", deepGreer, 15),
                LightText("azizkhan51569@gmail.com", deepGreer, 15)
              ],
            ),
            const SizedBox(height: 43),
            const Divider(color: hint),
            const Spacer(),
            const SizedBox(height: 300,)
          ],
        ),
      ),
    );
  }
}
