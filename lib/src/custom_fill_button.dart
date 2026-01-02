
import 'package:appbinding/src/components/Colorssf.dart';
import 'package:appbinding/src/components/CustomFontStyles.dart';
import 'package:appbinding/src/components/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFillButton extends StatelessWidget{
  final String btnText;
  final Icon? leftIcon;
  final String? assetLeftIcon;
  final VoidCallback? callBack;

  CustomFillButton({
    required this.btnText,
    this.leftIcon,
    required this.assetLeftIcon,
    required this.callBack
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -1),
            end: Alignment(-1.0, 1),
            colors: [Utils.hexToColor(ColorsSF.buttonGradientFirstColor), Utils.hexToColor(ColorsSF.buttonGradientSecondColor), Utils.hexToColor(ColorsSF.buttonGradientThirdColor)],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Utils.hexToColor(ColorsSF.buttonRadiusOneColor))
      ),
      child: ElevatedButton(
        onPressed: (){
          callBack!();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent background for gradient effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (assetLeftIcon!="") ? Image.asset(
              '${assetLeftIcon}',
              width: 18,
              height: 18,
            ) :
            leftIcon!=null ? leftIcon! :
            Container(),
            SizedBox(width: 10),
            Text('${btnText}', style: TextStyle(color: Colors.white, fontFamily: CustomFontStyles.regular)),
          ],
        ),
      ),
    );
  }
}