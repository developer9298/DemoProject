import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final  fontWeight;

  const CustomText({

    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,

  }) ;

  @override
  Widget build(BuildContext context) {
    return Text(
        title, style: TextStyle(color: color??Colors.black,fontSize: fontSize??18.0,fontWeight: fontWeight??FontWeight.w600),
    );
  }
}
