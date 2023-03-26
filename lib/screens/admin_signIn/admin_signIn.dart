import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/admin_user/admin_user.dart';

import '../welcome_admin/welcome_admin.dart';

class AdminSignIn extends StatelessWidget {
  const AdminSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(ImagePath.orea, height: 150),
                  const SizedBox(
                    height: 81.31,
                  ),
                  BoldText("ADMIN SIGN IN", deepGreer, 20),
                  const SizedBox(height: 5),
                  BoldText("Fill your credentials", deepBlue, 15),
                  const SizedBox(height: 43),
                  //ADMIN EMAIL FIELD ---------->>>
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter your Mail",
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: hint, fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: deepBlue)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  //ADMIN PASSWORD FIELD ---------->>>
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: hint, fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: deepBlue)),
                    ),
                  ),
                  const SizedBox(
                    height: 95,
                  ),
                  MaterialButton(
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    color: deepBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                    },
                    child: BoldText("Sign In", whiteColor, 18),
                  ),
                  const SizedBox(height: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminUserScreen()));
                    },
                    child: BoldText("Not an Admin ? Go Back", deepGreer, 15),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
