
import 'package:appbinding/src/components/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget{
  final TextEditingController controller;
  final String? prefixAssetsIcon;
  final String? suffixAssetsIcon;
  final String? hintText;
  final String? fontFamily;
  final TextInputType? textInputType;
  final double? v_BorderRadius;
  final String? v_BorderFocusColor;
  final String? v_BorderUnfocusColor;

  CustomInputField({
    required this.controller,
    this.prefixAssetsIcon,
    this.suffixAssetsIcon,
    this.hintText,
    this.fontFamily,
    this.textInputType = TextInputType.text,
    this.v_BorderRadius = 10.0,
    this.v_BorderFocusColor = "#4D3F73",
    this.v_BorderUnfocusColor = "#98A2B3",
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context){
    return TextFormField(
      readOnly: false,
      controller: widget.controller,
      obscureText: false,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        prefixIcon: (widget.prefixAssetsIcon != "") ? Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(
            '${widget.prefixAssetsIcon}',
            width: 18,
            height: 18,
          ),
        ) : null,
        hintText: "${widget.hintText}",
        hintStyle: TextStyle(color: Utils.hexToColor(widget.v_BorderUnfocusColor ?? "#98A2B3"), fontFamily: widget.fontFamily),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.v_BorderRadius ?? 0.0),
            borderSide: BorderSide(color: Utils.hexToColor(widget.v_BorderUnfocusColor ?? "#98A2B3"))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.v_BorderRadius ?? 0.0),
            borderSide: BorderSide(color: Utils.hexToColor(widget.v_BorderFocusColor ?? "#4D3F73"), width: 2)),
      ),
    );
  }
}