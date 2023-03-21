import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';

class UserSignIn extends StatelessWidget {
  const UserSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: black),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              children: [
                Image.asset("assets/images/oreimage.png"),
                const SizedBox(
                  height: 71.88,
                ),
                BoldText("Forgot Your Passowrd?", deepGreer, 20),
                const SizedBox(height: 26),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "enter your name",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins", color: hint, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 147),
                MaterialButton(
                  color: deepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {},
                  child: BoldText("Send Reset Link", whiteColor, 18),
                ),
                const SizedBox(height: 9),
                GestureDetector(
                  onTap: () {},
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
