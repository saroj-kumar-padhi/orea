import 'package:flutter/material.dart';

const black = Color(0xFF000000);
const deepGreer = Color(0xFF204D2A);
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

class LightText extends StatelessWidget {
  String text;
  Color color;
  double size;
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



class ParagraphText extends StatelessWidget {
  String text;
  Color color;
  double size;
  final TextAlign textAlign;

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
