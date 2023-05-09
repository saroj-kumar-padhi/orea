//ignore: file_names
import 'package:Orea/screens/orea_real_estate_bidding/orea_real_estate_bidding.dart'
    show RealEstateBidding;
import 'package:Orea/screens/welcome_screen/welcome_screen.dart';
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
  bool _isLoading = false;

  //formkey
  final _formKey = GlobalKey<FormState>();

  Future<void> _signInWithEmailPassword(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Sign in successful, show snackbar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signed in successfully'),
          duration: Duration(seconds: 2),
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RealEstateBidding()));
    } on FirebaseAuthException catch (e) {
      // Sign in failed, show error snackbar
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password';
      } else {
        errorMessage = 'Sign in failed, please try again';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
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
                  // SIGN IN BUTTON ------>>>>
                  _isLoading
                      ? CircularProgressIndicator()
                      : MaterialButton(
                          height: 40,
                          minWidth: MediaQuery.of(context).size.width / 1.2,
                          color: deepBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _signInWithEmailPassword(context);
                              // try {
                              //   final credential = await FirebaseAuth.instance
                              //       .signInWithEmailAndPassword(
                              //           email: emailController.text,
                              //           password: passwordController.text);

                              //   // ignore: use_build_context_synchronously
                              //   Navigator.of(context).pushReplacement(
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const RealEstateBidding()));
                              // } on FirebaseAuthException catch (e) {
                              //   if (e.code == 'user-not-found') {
                              //     // ignore: avoid_print
                              //     print('No user found for that email.');
                              //   } else if (e.code == 'wrong-password') {
                              //     // ignore: avoid_print
                              //     print(
                              //         'Wrong password provided for that user.');
                              //   }
                              // }
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
                              builder: (context) => const UserRegister(),
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
