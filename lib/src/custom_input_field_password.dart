import 'package:appbinding/src/components/Colorssf.dart';
import 'package:appbinding/src/components/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputFieldPassword extends StatefulWidget{
  final TextEditingController controller;
  final String? prefixAssetsIcon;
  final String? suffixAssetsIcon;
  final String? hintText;
  final String? fontFamily;
  bool _isObSecure = true;
  final TextInputType? textInputType;
  final double? v_BorderRadius;
  final String? v_BorderFocusColor;
  final String? v_BorderUnfocusColor;

  CustomInputFieldPassword({
    required this.controller,
    this.prefixAssetsIcon,
    this.suffixAssetsIcon,
    this.hintText,
    this.fontFamily = "outfit_regular",
    this.textInputType = TextInputType.text,
    this.v_BorderRadius = 10.0,
    this.v_BorderFocusColor = "#4D3F73",
    this.v_BorderUnfocusColor = "#98A2B3",

  });

  @override
  State<CustomInputFieldPassword> createState() => _CustomInputFieldPasswordState();
}

class _CustomInputFieldPasswordState extends State<CustomInputFieldPassword> {
  @override
  Widget build(BuildContext context){
    return TextFormField(
      readOnly: false,
      controller: widget.controller,
      obscureText: widget._isObSecure,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        prefixIcon: (widget.prefixAssetsIcon != "") ? Image.asset(
          '${widget.prefixAssetsIcon}',
          width: 18,
          height: 18,
        ) : null,
        suffixIcon : (widget.suffixAssetsIcon != "") ? IconButton(
            icon: Image.asset(
              '${widget.suffixAssetsIcon}',
              width: 18,
              height: 18,
            ),
            onPressed: () {
              setState(() {
                if(widget._isObSecure){
                  widget._isObSecure = false;
                }else{
                  widget._isObSecure = true;
                }
              });
            }
        ):null,
        hintText: "${widget.hintText}",
        hintStyle: TextStyle(color: Utils.hexToColor(widget.v_BorderUnfocusColor ?? "#98A2B3"), fontFamily: widget.fontFamily),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.v_BorderRadius ?? 0.0),
            borderSide: BorderSide(color: Utils.hexToColor(widget.v_BorderUnfocusColor ?? "#98A2B3"))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.v_BorderRadius ?? 0.0),
            borderSide:
            BorderSide(color: Utils.hexToColor(widget.v_BorderFocusColor ?? "#4D3F73"), width: 2)),
      ),
    );
  }
}