import 'package:flutter/material.dart';

const black = Color(0xFF000000);
const deepGreer = Color(0xFF204D2A);
const background = Color(0xFFF5F5F5);
const deepBlue = Color(0xFF0066FF);
const whiteColor = Color(0xFFFFFFFF);
const hint = Color(0xFFA5A4A4);

// ignore: must_be_immutable
class BoldText extends StatelessWidget {
  String text;
  Color color;
  double size;
  BoldText(this.text, this.color, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"),
    );
  }
}

// ignore: must_be_immutable
class LightText extends StatelessWidget {
  String text;
  Color color;
  double size;
  // ignore: use_key_in_widget_constructors
  LightText(this.text, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.normal,
          fontFamily: "Poppins"),
    );
  }
}

// ignore: must_be_immutable
class ParagraphText extends StatelessWidget {
  String text;
  Color color;
  double size;
  final TextAlign textAlign;

  // ignore: use_key_in_widget_constructors
  ParagraphText(this.text, this.color, this.size, this.textAlign);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: textAlign,
          text: TextSpan(
            text: text,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontFamily: 'Poppins-Bold',
            ),
          ),
        ),
      ],
    );
  }
}

class AuthState extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
