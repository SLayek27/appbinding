
import 'package:appbinding/src/components/Colorssf.dart';
import 'package:appbinding/src/components/CustomFontStyles.dart';
import 'package:appbinding/src/components/Utils.dart';
import 'package:appbinding/src/custom_text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCounter extends StatelessWidget{
  final int countNotRegister;
  final int countRegister;
  final int countPresent;
  final int countAbsent;
  final VoidCallback? callBackNotRegistered;
  final VoidCallback? callBackRegistered;
  final VoidCallback? callBackPresent;
  final VoidCallback? callBackAbsent;
  final VoidCallback? callReload;

  CustomCounter({
    required this.countNotRegister,
    required this.countRegister,
    required this.countPresent,
    required this.countAbsent,
    required this.callBackNotRegistered,
    required this.callBackRegistered,
    required this.callBackPresent,
    required this.callBackAbsent,
    required this.callReload
  });

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              callBackRegistered!();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Utils.hexToColor(ColorsSF.greenTextColor), size: 12),
                    SizedBox(width: 5),
                    CustomTextView(text: "Register", fontSize: 10.0,fontFamily: CustomFontStyles.bold, textColorCode: ColorsSF.blackColor)
                  ],
                ),
                CustomTextView(text: "${countRegister}", fontSize: 12.0, fontFamily: CustomFontStyles.regular)
              ],
            ),
          ),
        ),
        Container(height: 40,width: 1,color: Utils.hexToColor(ColorsSF.primaryColor)),
        Expanded(
          child: InkWell(
            onTap: () {
              callBackNotRegistered!();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.close, color: Utils.hexToColor(ColorsSF.blackColor), size: 12),
                    SizedBox(width: 5),
                    CustomTextView(text: "Not Register", fontSize: 10.0,fontFamily: CustomFontStyles.bold, textColorCode: ColorsSF.blackColor)
                  ],
                ),
                CustomTextView(text: "${countNotRegister}", fontSize: 12.0, fontFamily: CustomFontStyles.regular)
              ],
            ),
          ),
        ),
        Container(height: 40,width: 1,color: Utils.hexToColor(ColorsSF.primaryColor)),
        Expanded(
          child: InkWell(
            onTap: () {
              callBackPresent!();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Utils.hexToColor(ColorsSF.blackColor), size: 12),
                    SizedBox(width: 5),
                    CustomTextView(text: "Present", fontSize: 10.0,fontFamily: CustomFontStyles.bold, textColorCode: ColorsSF.blackColor)
                  ],
                ),
                CustomTextView(text: "${countPresent}", fontSize: 12.0, fontFamily: CustomFontStyles.regular)
              ],
            ),
          ),
        ),
        Container(height: 40,width: 1,color: Utils.hexToColor(ColorsSF.primaryColor)),
        Expanded(
          child: InkWell(
            onTap: () {
              callBackAbsent!();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.close, color: Utils.hexToColor(ColorsSF.blackColor), size: 12),
                    SizedBox(width: 5),
                    CustomTextView(text: "Absent", fontSize: 10.0,fontFamily: CustomFontStyles.bold, textColorCode: ColorsSF.blackColor)
                  ],
                ),
                CustomTextView(text: "${countAbsent}", fontSize: 12.0,fontFamily: CustomFontStyles.regular)
              ],
            ),
          ),
        ),
        Container(height: 40,width: 1,color: Utils.hexToColor(ColorsSF.primaryColor)),
        Expanded(
          child: InkWell(
            onTap: () {
              callReload!();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Utils.hexToColor(ColorsSF.blackColor), size: 18),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}