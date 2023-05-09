import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import '../../common_utils/image_paths.dart';
import '../orea_real_estate_bidding/orea_real_estate_bidding.dart';
import '../welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          // User is logged out, navigate to welcome screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        } else {
          // User is logged in, navigate to home screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RealEstateBidding()),
          );
        }
      },
    );
  }

//Navigator.pushReplacement(context,
  //MaterialPageRoute(builder: (context) => const WelcomeScreen()))
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepGreer,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(ImagePath.logo, height: 200),
            const SizedBox(
              height: 56,
            ),
            BoldText("ONLINE REAL\n      ESTATE\n APPLICATION", whiteColor, 20),
            const SizedBox(height: 8),
            LightText("Buy | Sell | Rent | Bid", whiteColor, 15),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
