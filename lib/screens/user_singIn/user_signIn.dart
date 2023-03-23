import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/common_utils/image_paths.dart';
import '../forgot_password/forgot_password.dart';
import '../orea_real_estate_bidding/orea_real_estate_bidding.dart';
import '../user_register/user_register.dart';

class UserSignIn extends StatelessWidget {
  const UserSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(ImagePath.orea, height: 150),
                  const SizedBox(height: 5),
                  BoldText("USER SIGN IN", deepGreer, 20),
                  const SizedBox(height: 5),
                  BoldText("Fill your credentials", deepBlue, 15),
                  const SizedBox(height: 43),
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
                  const SizedBox(height: 95),
                  MaterialButton(
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    color: deepBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RealEstateBidding()));
                    },
                    child: BoldText("Sign In", whiteColor, 18),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                        },
                        child: BoldText("Forgot Password |", deepGreer, 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const UserRegister()));
                        },
                        child: BoldText(" Register", deepGreer, 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
