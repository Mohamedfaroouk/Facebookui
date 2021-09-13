import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {required this.color,
      required this.text,
      required this.fontWeight,
      this.heght = 1,
      required this.size});
  FontWeight? fontWeight;
  Color? color;
  double? size;
  double? heght;

  String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      //textDirection:controller!.text.characters.containsAll(Characters)? TextDirection.rtl:TextDirection.ltr,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: size,
      ),
    );
  }
}
