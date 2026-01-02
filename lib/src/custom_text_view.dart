import 'package:appbinding/src/components/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget{
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final String? textColorCode;

  CustomTextView({
    required this.text,
    this.fontSize = 14.0,
    this.fontFamily = "outfit_regular",
    this.textColorCode = "#000000"
  });

  @override
  Widget build(BuildContext context){
    return Text("${text}", style: TextStyle(fontSize: fontSize,fontFamily: fontFamily, color: Utils.hexToColor(textColorCode!)));
  }
}