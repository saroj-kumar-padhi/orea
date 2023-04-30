// ignore: file_names
import 'package:Orea/screens/orea_real_estate_bidding/orea_real_estate_bidding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import '../forgot_password/forgot_password.dart';
import '../user_register/user_register.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(ImagePath.orea, height: 150),
                  const SizedBox(height: 5),
                  BoldText("USER SIGN IN", deepGreer, 20),
                  const SizedBox(height: 5),
                  BoldText("Fill your credentials", deepBlue, 15),
                  const SizedBox(height: 43),

                  // USER EMAIL FIELD ---------->>>
                  TextFormField(
                    controller: emailController,
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
                  const SizedBox(height: 25),
                  // USER PASSWORD FIELD ---------->>>
                  TextFormField(
                    obscureText: _obscureText,
                    controller: passwordController,
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
                          semanticLabel:
                              _obscureText ? 'show password' : 'hide password',
                        ),
                      ),
                    ),
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
                  const SizedBox(height: 95),
                  MaterialButton(
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    color: deepBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);

                          final user = credential.user;
                          FirebaseAuth auth = FirebaseAuth.instance;
                          String u = auth.currentUser!.uid;
                          final userRef = FirebaseFirestore.instance
                              .collection('info')
                              .doc(user!.uid);
                          await userRef.set({
                            'email': emailController.text,
                            'userUid': u,
                            'phoneNo': "",
                            'Address': "",
                          });
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RealEstateBidding()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      }
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
                              builder: (context) => ForgotPassword()));
                        },
                        child: BoldText("Forgot Password |", deepGreer, 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => UserRegister(),
                            ),
                          );
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
