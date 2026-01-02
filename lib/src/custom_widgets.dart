import 'package:appbinding/src/components/Colorssf.dart';
import 'package:appbinding/src/components/CustomFontStyles.dart';
import 'package:appbinding/src/components/Utils.dart';
import 'package:appbinding/src/custom_text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidgets{
  static void showSnackBarSuccess(String message, String? actionLabel, VoidCallback? callBack) {
    ScaffoldMessenger.of(Utils.getContext()).showSnackBar(SnackBar(
        content: Text("${message}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: (actionLabel != null && callBack != null)
            ? SnackBarAction(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          label: actionLabel,
          onPressed: callBack,
        )
        :
        null,
    ));
  }

  static void showSnackBarError(String message, String? actionLabel, VoidCallback? callBack) {
    ScaffoldMessenger.of(Utils.getContext()).showSnackBar(SnackBar(
        content: Text("${message}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
        action: (actionLabel != null && callBack != null)
            ? SnackBarAction(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          label: actionLabel,
          onPressed: callBack,
        )
            :
        null,
    ));
  }

  static void showSnackBarWarning(String message, String? actionLabel, VoidCallback? callBack) {
    ScaffoldMessenger.of(Utils.getContext()).showSnackBar(SnackBar(
        content: Text("${message}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        action: (actionLabel != null && callBack != null)
            ? SnackBarAction(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          label: actionLabel,
          onPressed: callBack,
        )
            :
        null,
    ));
  }

  static void showSnackBarInfo(String message, String? actionLabel, VoidCallback? callBack) {
    ScaffoldMessenger.of(Utils.getContext()).showSnackBar(SnackBar(
        content: Text("${message}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.cyan,
        action: (actionLabel != null && callBack != null)
            ? SnackBarAction(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          label: actionLabel,
          onPressed: callBack,
        )
            :
        null,
    ));
  }

  static Widget roundCornerContainerWithText(String text, String boarderColor, int activeStatus, VoidCallback? onTapEvent()){
    return InkWell(
      onTap: (){
        onTapEvent!();
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Utils.hexToColor(boarderColor)),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: (activeStatus == 1) ? CustomTextView(text: "${text}", fontSize: 12.0,fontFamily: CustomFontStyles.regular) : CustomTextView(text: "${text}", fontSize: 12.0,fontFamily: CustomFontStyles.regular, textColorCode: ColorsSF.grayColor),
          ),
        ),
      ),
    );
  }

  static Widget orDividerSection(){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Divider(),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("OR", style: TextStyle(color: Colors.grey)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Divider(),
        )
      ],
    );
  }

}