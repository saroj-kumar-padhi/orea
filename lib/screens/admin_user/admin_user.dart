import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';

class AdminUserScreen extends StatelessWidget {
  const AdminUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              children: [
                Image.asset("assets/images/oreimage.png"),
                const SizedBox(
                  height: 113.31,
                ),
                BoldText("Kindly choose your role to continue", deepBlue, 15),
                MaterialButton(
                  color: deepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {},
                  child: BoldText("ADMIN", whiteColor, 18),
                ),
                const SizedBox(height: 21),
                MaterialButton(
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                    side: const BorderSide(color: deepBlue, width: 1.0),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
