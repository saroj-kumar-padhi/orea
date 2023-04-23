import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import '../orea_admin_pannel/orea_admin_pannel.dart';

class WelcomeAdminScreen extends StatefulWidget {
  const WelcomeAdminScreen({super.key});

  @override
  State<WelcomeAdminScreen> createState() => _WelcomeAdminScreen();
}

class _WelcomeAdminScreen extends State<WelcomeAdminScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OreaAdmin())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 0, 34, 10),
          child: Column(
            children: [
              const Spacer(),
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
