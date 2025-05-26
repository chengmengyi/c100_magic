import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



export 'package:get/get.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_ad_ios_plugins/data/storage_data.dart';
export 'package:webview_flutter/webview_flutter.dart';

extension String2Color on String{
  Color toColor(){
    var hexStr = replaceAll("#", "");
    return Color(int.parse(hexStr, radix: 16)).withAlpha(255);
  }
}


showToast(String text) {
  if (text.isEmpty) {
    return;
  }
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16
  );
}

extension RandomList on List{
  random()=> this[Random().nextInt(length)];
}
// openNextPage({
//   required String routersName,
//   Map<String, dynamic>? arguments,
// })async{
//   Get.toNamed(routersName,arguments: arguments);
// }
//
//
// openNextOffCurrentPage({required String routersName,Map<String, dynamic>? arguments}){
//   Get.offNamed(routersName,arguments: arguments);
// }
//
// back(){
//   Get.back();
// }
//
// Map<String, dynamic> getArguments() {
//   try {
//     return Get.arguments as Map<String, dynamic>;
//   } catch (e) {
//     return {};
//   }
// }
//
// showDialog({required Widget child,}){
//   Get.dialog(
//     child,
//     // arguments: arguments,
//     // barrierColor: barrierColor,
//     barrierDismissible: false,
//   );
// }