import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldText("OREA ADMIN PANEL", deepGreer, 18),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 0, 34, 30),
          child: Column(
            children: [
              Image.asset("assets/images/Logo.png"),
              const SizedBox(
                height: 125.31,
              ),
              BoldText("Welcome admin|Aziz Ullah", deepGreer, 20),
              const SizedBox(height: 72),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 63,
                        width: 134,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: deepBlue, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: BoldText("REQUESTS", deepBlue, 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 28),
                  Row(
                    children: [
                      Container(
                        height: 63,
                        width: 134,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: deepBlue, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: BoldText("LISTINGS", deepBlue, 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 63,
                        width: 134,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: deepBlue, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: BoldText("REQUESTS", deepBlue, 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 28),
                  Row(
                    children: [
                      Container(
                        height: 63,
                        width: 134,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: deepBlue, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: BoldText("LISTINGS", deepBlue, 12),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
