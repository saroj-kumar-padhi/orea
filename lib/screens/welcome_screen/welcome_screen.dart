import 'package:Orea/screens/skip_user/skip_user.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import '../user_singIn/user_signIn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                BoldText("Welcome to the OREA application", deepGreer, 15),
                const SizedBox(height: 25),
                //USER SIGN IN OPTION ---------->>>
                MaterialButton(
                  elevation: 0.0,
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  height: 40,
                  color: deepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const UserSignIn(),
                    ));
                  },
                  child: BoldText("Sign In", whiteColor, 18),
                ),
                const SizedBox(height: 15),
                //SKIP OPTION --------->>>
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SkipUser()));
                  },
                  child: BoldText("Skip for now", deepBlue, 18),
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
