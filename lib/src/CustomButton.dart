import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget{

  CustomButton({required this.btnText, this.bgColor = Colors.blue, this.icon, this.textStyle, this.callBack});

  final String btnText;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>{
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: widget.bgColor,
          elevation: 5,
          backgroundColor: widget.bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(21),
                topLeft: Radius.circular(21),
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              )
          )
      ),
      onPressed: (){
        widget.callBack!();
      },
      child:
      widget.icon!=null ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon!, Text(widget.btnText, style: widget.textStyle)
        ],
      ) :
      Text( widget.btnText, style: widget.textStyle),
    );
  }
}