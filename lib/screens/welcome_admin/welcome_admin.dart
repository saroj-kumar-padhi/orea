import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/screens/home_page/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 0, 34, 10),
          child: Column(
            children: [
              Image.asset("assets/images/Logo.png"),
              const SizedBox(
                height: 107.31,
              ),
              BoldText("WELCOME ADMIN", deepGreer, 20),
              const SizedBox(height: 5),
              BoldText(
                  "Hold tight.. we are fetching the details", deepBlue, 15),
              const SizedBox(height: 33),
              const CircularProgressIndicator(
                  color: deepBlue, backgroundColor: hint),
            ],
          ),
        ),
      ),
    );
  }
}
