import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/screens/home_page/home_page.dart';

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
            MaterialPageRoute(builder: (context) => const HomePageScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepGreer,
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/Logo.png"),
            const SizedBox(
              height: 56,
            ),
            BoldText("ONLINE REAL\n ESTATE\n APPLICATION", whiteColor, 20),
           const  SizedBox(height: 8),
            LightText("Buy | Sell | Rent | Bid", whiteColor, 15)
          ],
        ),
      ),
    );
  }
}
