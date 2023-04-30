import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import '../orea_real_estate_bidding/orea_real_estate_bidding.dart';
import '../user_singIn/user_signIn.dart';

class UserRegister extends StatefulWidget {
  UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  //editing controllers
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  //formkey
  final _formKey = GlobalKey<FormState>();

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Form(
              key: _formKey,
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
                    controller: nameController,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your Full Name");
                      }
                      //reg expression for name validation
                      if (!RegExp(r'^.{4,}$').hasMatch(value)) {
                        return ("Please enter a valid Name");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 25),
                  //EMAIL FIELD ---------->>>
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
                  //PASSWORD FIELD ---------->>>
                  TextFormField(
                    obscureText: _obscureText,
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
                            semanticLabel: _obscureText
                                ? 'show passowrod'
                                : 'hide password',
                          ),
                        )),
                    validator: (value) {
                      //reg expression for passowrd validation
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
                  const SizedBox(height: 50),
                  //REGISTER BUTTON ---------->>>
                  MaterialButton(
                    height: 40,
                    color: deepBlue,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RealEstateBidding()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: BoldText("Register", whiteColor, 18),
                  ),
                  const SizedBox(height: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => UserSignIn()));
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
