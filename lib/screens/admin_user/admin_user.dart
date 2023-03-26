import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/admin_signIn/admin_signIn.dart';
import '../user_singIn/user_signIn.dart';

class AdminUserScreen extends StatelessWidget {
  const AdminUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(ImagePath.orea, height: 170),
                const SizedBox(
                  height: 113.31,
                ),
                BoldText("Kindly choose your role to continue", deepBlue, 15),
                const SizedBox(height: 25),
                //ADMIN OPTION ---------->>>
                MaterialButton(
                  elevation: 0.0,
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  height: 40,
                  color: deepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdminSignIn(),
                    ));
                  },
                  child: BoldText("ADMIN", whiteColor, 18),
                ),
                const SizedBox(height: 15),
                //USER OPTION --------->>>
                MaterialButton(
                  elevation: 0.0,
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  height: 40,
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                    side: const BorderSide(color: deepBlue, width: 1.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserSignIn()));
                  },
                  child: BoldText("USER", deepBlue, 18),
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
