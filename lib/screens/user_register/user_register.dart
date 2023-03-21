import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/common_utils/image_paths.dart';

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
                Image.asset(ImagePath.orea, height: 150),
                const SizedBox(
                  height: 44.87,
                ),
                BoldText("USER REGISTER", deepGreer, 20),
                const SizedBox(height: 5),
                LightText("Regitster with your credentials", deepBlue, 15),
                const SizedBox(height: 72),
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
                const SizedBox(height: 25),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "enter your mail",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins", color: hint, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "enter password",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins", color: hint, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 95),
                MaterialButton(
                  color: deepBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {},
                  child: BoldText("Register", whiteColor, 18),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: BoldText("Already a User?", deepGreer, 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: BoldText("Login", deepGreer, 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
