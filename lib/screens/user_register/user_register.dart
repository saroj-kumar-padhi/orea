import 'package:flutter/material.dart';
import 'package:orea/common_utils/common_utils.dart';
import 'package:orea/common_utils/image_paths.dart';
import '../user_singIn/user_signIn.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

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
                  Image.asset(ImagePath.orea, height: 140),
                  const SizedBox(
                    height: 44.87,
                  ),
                  BoldText("USER REGISTER", deepGreer, 20),
                  const SizedBox(height: 5),
                  BoldText("Regitster with your credentials", deepBlue, 15),
                  const SizedBox(height: 72),
                  //FULL NAME FIELD ---------->>>
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter full Name",
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: hint, fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: deepBlue)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  //EMAIL FIELD ---------->>>
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
                  //PASSWORD FIELD ---------->>>
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
                  const SizedBox(height: 50),
                  //REGISTER BUTTON ---------->>>
                  MaterialButton(
                    height: 40,
                    color: deepBlue,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () {},
                    child: BoldText("Register", whiteColor, 18),
                  ),
                  const SizedBox(height: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserSignIn()));
                    },
                    child: BoldText("Already a User ? Login", deepGreer, 15),
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
