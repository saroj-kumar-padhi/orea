import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/common_utils/image_paths.dart';
import 'package:orea/screens/admin_user/admin_user.dart';

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
              const SizedBox(
                height: 125.31,
              ),
              Image.asset(ImagePath.orea, height: 140),
              const SizedBox(
                height: 125.31,
              ),
              BoldText("Welcome admin | Aziz Ullah", deepGreer, 18),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  adminTabs("REQUESTS", () {}),
                  adminTabs("LISTINGS", () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  adminTabs("HISTORY", () {}),
                  adminTabs("LOGOUT", () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminUserScreen()));
                  }),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
adminTabs(txt, clk) {
  return InkWell(
    onTap: clk,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 63,
        width: 134,
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: deepBlue, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BoldText(txt, deepBlue, 12),
        ),
      ),
    ),
  );
}
