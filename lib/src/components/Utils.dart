import 'dart:io';
import 'package:appbinding/src/components/NavigationService.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class Utils{
  static var IOS_BYTES_OFFSET = 28;

  static String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  static Future<bool> isConnected() async{
      bool isOnline = false;
      try {
        final result = await InternetAddress.lookup('google.co.in');
        isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        if(isOnline){
          return Future.value(true);
        }else{
          return Future.value(false);
        }
      } on SocketException catch (e) {
        return Future.error(e.message);
      }
  }

  static BuildContext getContext(){
    return NavigationService.navigatorKey.currentContext!;
  }

  static bool isValidEmailAddress(String value) {
    final RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  }

  static bool isValidMobileNumber(String value) {
    final RegExp regex = RegExp(r'^[0-9]{10}$');
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  }

  static String getUrlEncodedData(String value){
      String result = Uri.encodeFull(value);
      return result;
  }

  static String getUrlDecodedData(String value){
    String result = Uri.decodeFull(value);
    return result;
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static bool nullChecker(var value){
    if(value == null || value == "" || value == "null" || value == "Null" || value == "NULL" || value == false){
      return true;
    }else{
      return false;
    }
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String sanitize(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );
    String output = htmlText.replaceAll(exp, '');
    output = output.trim();
    return output;
  }

  static String formatHtmlString(String string) {
    return string
        .replaceAll("\n\n", "<p>") // Paragraphs
        .replaceAll("\n", "<br>") // Line Breaks
        .replaceAll("\"", "&quot;") // Quote Marks
        .replaceAll("'", "&apos;") // Apostrophe
        .replaceAll(">", "&lt;") // Less-than Comparator (Strip Tags)
        .replaceAll("<", "&gt;") // Greater-than Comparator (Strip Tags)
        .trim(); // Whitespace
  }

  static Future disableScreenshot() async {
    //await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  static Future directCall(String number) async {
    //await FlutterPhoneDirectCaller.callNumber(number);
  }

  static callErrorDialog(BuildContext context, var errorText){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error!'),
        content: Container(
            height: 100,
            child:
            Text(errorText, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.red))
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('OK'),
          )
        ],
      ),
    );
  }

  static callSuccessDialog(BuildContext context, var successText){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success!'),
        content: Container(
            height: 100,
            child:
            Text(successText, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.green))
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('OK'),
          )
        ],
      ),
    );
  }

  static redirectPage(String pageName){
    Utils.getContext().goNamed(pageName);
  }

  static Future<bool> onBckKeyPress() async {
    return false;
  }

  // selectedTime = "16:20:12"
  static String convertToAmAndPm(var selectedTime){
    if(!nullChecker(selectedTime)){
      return DateFormat.jm().format(DateFormat("hh:mm:ss").parse("${selectedTime}"));
    }else{
      return "";
    }
  }
}