// ignore: file_names
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/admin_user/admin_user.dart';

import '../welcome_admin/welcome_admin.dart';



class AdminSignIn extends StatefulWidget {
  AdminSignIn({super.key});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  //editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  //formkey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SafeArea(
        top: true,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
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
                        controller: emailController,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          fillColor: whiteColor,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Enter your Mail",
                          hintStyle: const TextStyle(
                              fontFamily: "Poppins", color: hint, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: deepBlue)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please enter your Email");
                          }
                          //reg expression for email validation
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid Email (xyz@email.com)");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        textInputAction: TextInputAction.next),
                    const SizedBox(height: 25),
                    //ADMIN PASSWORD FIELD ---------->>>
                    TextFormField(
                      controller: passwordController,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          fillColor: whiteColor,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Enter Password",
                          hintStyle: const TextStyle(
                              fontFamily: "Poppins", color: hint, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: deepBlue),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureText
                                  ? 'show password'
                                  : 'hide password',
                            ),
                          )),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Please enter your password");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please enter a valid password (min 6 char)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 95,
                    ),
                    //SUBMIT ADMIN CREDENTIALS BUTTON ----------->>>
                    MaterialButton(
                      height: 40,
                      minWidth: MediaQuery.of(context).size.width / 1.2,
                      color: deepBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      onPressed: () {
                        // Admin Validations ------>>>
                        if (_formKey.currentState!.validate()) {
                          if (emailController.text ==
                                  "azizkhan51569@gmail.com" &&
                              passwordController.text == "aziz1234") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const WelcomeAdminScreen()));
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: BoldText("WARNING !!", Colors.red, 20),
                                content: BoldText(
                                    "Admin Credentials are Incorrect",
                                    deepGreer,
                                    16),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: deepGreer,
                                      padding: const EdgeInsets.all(10),
                                      child:
                                          BoldText("Go Back", whiteColor, 14),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                        // Admin Validations <<<------
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
      ),
    );
  }
}
