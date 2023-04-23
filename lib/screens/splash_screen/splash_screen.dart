import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import '../../common_utils/image_paths.dart';
import '../welcome_screen/welcome_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen())));
    super.initState();
  }

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
