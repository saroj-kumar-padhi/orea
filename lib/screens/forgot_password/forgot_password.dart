import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/user_singIn/user_signIn.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  //editing controllers
  final TextEditingController emailController = TextEditingController();

  //formkey
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                    controller: emailController,
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
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 147),
                  //RESET PASSWORD BUTTON ---------->>>
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    color: deepBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        if (email.isNotEmpty) {
                          try {
                            // Show loading indicator
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: const [
                                    CircularProgressIndicator(),
                                    SizedBox(width: 20),
                                    Text('Sending password reset link...'),
                                  ],
                                ),
                              ),
                            );

                            // Send password reset link
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: email);

                            // Hide loading indicator and show success message
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Password reset link sent successfully.'),
                              ),
                            );
                          } catch (error) {
                            // Hide loading indicator and show error message
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                              ),
                            );
                          }
                        } else {
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter an email.'),
                            ),
                          );
                        }
                      }
                      ;
                    },
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
      ),
    );
  }
}
