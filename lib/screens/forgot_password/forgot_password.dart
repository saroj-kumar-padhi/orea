import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/common_utils/image_paths.dart';
import 'package:orea/screens/user_singIn/user_signIn.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: deepGreer),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(ImagePath.orea, height: 140),
                const SizedBox(
                  height: 71.88,
                ),
                BoldText("Forgot Your Passowrd?", deepBlue, 20),
                const SizedBox(height: 26),
                //EMAIL FIELD ---------->>>
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email ID",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins", color: hint, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 147),
                //RESET PASSWORD BUTTON ---------->>>
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  color: deepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {},
                  child: BoldText("Send Reset Link", whiteColor, 18),
                ),
                const SizedBox(height: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserSignIn()));
                  },
                  child: BoldText("Back to Login", deepGreer, 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
