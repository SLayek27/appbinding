import 'package:appbinding/src/components/Colorssf.dart';
import 'package:appbinding/src/components/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget{

  bool _isChecked = true;
  Function(dynamic bool) onTapEvent;
  final String? checkboxText;

  CustomCheckBox({
    required this.onTapEvent(bool),
    this.checkboxText
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget._isChecked = !widget._isChecked;
            });
            widget.onTapEvent!(widget._isChecked);
          },
          child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Utils.hexToColor(ColorsSF.primaryColor),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: widget._isChecked
                    ? Icon(
                  Icons.check,
                  size: 13.0,
                  color: Utils.hexToColor(ColorsSF.primaryColor),
                )
                    : Icon(
                  Icons.check_box_outline_blank,
                  size: 13.0,
                  color: Colors.white,
                ),
              )
          ),
        ),
        SizedBox(width: 10),
        InkWell(
            onTap: (){
              setState(() {
                widget._isChecked = !widget._isChecked;
              });
              widget.onTapEvent!(widget._isChecked);
            },
            child: (widget.checkboxText != "")?Text("${widget.checkboxText}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)) : Container()),
      ],
    );
  }
}