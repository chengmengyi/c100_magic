import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/dialogggg/set_dialog.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';

class SetViewww extends StatelessWidget{
  bool isHome;
  SetViewww({required this.isHome});

  @override
  Widget build(BuildContext context) => ClickWidget(
    onTap: (){
      Get.dialog(
        SetDialog(isHome: isHome,),
        barrierDismissible: false,
      );
    },
    child: MagicImageViewwwww(name: "set",width: 42.w,height: 42.w,),
  );
}