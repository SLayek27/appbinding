import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget{

  String v_ButtonText;
  Icon? v_Icon;
  Color? v_BackgroundColor;
  TextStyle? v_ButtonTextStyle;
  VoidCallback? v_CallBack;
  double? v_TopLeftCornerRadiation;
  double? v_TopRightCornerRadiation;
  double? v_BottomLeftCornerRadiation;
  double? v_BottomRightCornerRadiation;

  CustomButton({
    required this.v_ButtonText,
    this.v_BackgroundColor = Colors.blue,
    this.v_Icon,
    this.v_ButtonTextStyle,
    this.v_CallBack,
    this.v_TopLeftCornerRadiation,
    this.v_TopRightCornerRadiation,
    this.v_BottomLeftCornerRadiation,
    this.v_BottomRightCornerRadiation,
  });



  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>{
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: widget.v_BackgroundColor,
          elevation: 5,
          backgroundColor: widget.v_BackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(widget.v_TopRightCornerRadiation ?? 0.0),
                topLeft: Radius.circular(widget.v_TopLeftCornerRadiation ?? 0.0),
                bottomLeft: Radius.circular(widget.v_BottomLeftCornerRadiation ?? 0.0),
                bottomRight: Radius.circular(widget.v_BottomRightCornerRadiation ?? 0.0)
              )
          )
      ),
      onPressed: (){
        widget.v_CallBack!();
      },
      child:
      widget.v_Icon!=null ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.v_Icon!, Text(widget.v_ButtonText, style: widget.v_ButtonTextStyle)
        ],
      ) :
      Text( widget.v_ButtonText, style: widget.v_ButtonTextStyle),
    );
  }
}