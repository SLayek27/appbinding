
import 'package:appbinding/src/components/CustomFontStyles.dart';
import 'package:appbinding/src/components/Utils.dart';
import 'package:appbinding/src/custom_text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/Colorssf.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final String appBarBackgroundColor;
  var leftIcon;
  var rightIcon;
  var additionalRightIcon;
  final VoidCallback? callBackLeftIcon;
  final VoidCallback? callBackRightIcon;
  final VoidCallback? callBackAdditionalRightIcon;
  var leftIconColor;
  var rightIconColor;
  var additionalRightIconColor;

  CustomAppbar({
    required this.title,
    required this.appBarBackgroundColor,
    this.leftIcon,
    this.rightIcon,
    this.additionalRightIcon,
    this.callBackLeftIcon,
    this.callBackRightIcon,
    this.callBackAdditionalRightIcon,
    this.leftIconColor,
    this.rightIconColor,
    this.additionalRightIconColor,
  });

  @override
  AppBar build(BuildContext context){
    return AppBar(
      backgroundColor: Utils.hexToColor(appBarBackgroundColor),
        leading: (leftIcon!=null) ? IconButton(
          icon: Icon(leftIcon),
          color: Utils.hexToColor(leftIconColor),
          onPressed: () {
            callBackLeftIcon!();
          },
      ): Container(),
      title: (title != "") ? CustomTextView(text: "${title}", fontSize: 16.0,fontFamily: CustomFontStyles.bold, textColorCode: ColorsSF.whiteColor) : Container(),
      actions: [
        Wrap(
          children: [
            (rightIcon!=null) ? IconButton(
              icon: Icon(rightIcon),
              color: Utils.hexToColor(rightIconColor),
              onPressed: () {
                callBackRightIcon!();
              },
            ):Container(),

            (additionalRightIcon != null) ? IconButton(
              icon: Icon(additionalRightIcon),
              color: Utils.hexToColor(additionalRightIconColor),
              onPressed: () {
                callBackAdditionalRightIcon!();
              },
            ):Container(),
          ])
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}