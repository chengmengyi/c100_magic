import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_dialog.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class WinDialog extends MagicRootDialog<WinDialogController>{
  int handsNum;
  Function() nextCallback;
  Function() homeCallback;
  WinDialog({
    required this.handsNum,
    required this.nextCallback,
    required this.homeCallback,
});

  @override
  WinDialogController createMagicRootController() => WinDialogController();

  @override
  Widget createActivityContentWidget() => SizedBox(
    width: 320.w,
    height: 436.h,
    child: Stack(
      children: [
        MagicImageViewwwww(name: "win1",width: double.infinity,height: double.infinity,),
        Positioned(
          right: 0,
          top: 40.h,
          child: ClickWidget(
            onTap: (){
              magicRootController.clickHome(homeCallback);
            },
            child: MagicImageViewwwww(name: "icon_close",width: 34.w,height: 34.w,),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MagicImageViewwwww(name: "win2",width: 162.w,height: 85.h,),
              MagicTextViewwwww(text: "+${handsNum*100}", size: 28.sp, color: "#FFEA4A",),
            ],
          ).marginOnly(top: 114.h),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClickWidget(
                onTap: (){
                  magicRootController.clickNext(nextCallback);
                },
                child: MagicImageViewwwww(name: "win3",width: 196.w,height: 52.h,),
              ),
              SizedBox(height: 10.h,),
              ClickWidget(
                onTap: (){
                  magicRootController.clickHome(homeCallback);
                },
                child: MagicTextViewwwww(
                  text: "Home",
                  size: 17.sp,
                  color: "#BFAB9A",
                  decoration: TextDecoration.underline,
                  decorationColor: "#BFAB9A".toColor(),
                ),
              ),
              SizedBox(height: 30.h,),
            ],
          ),
        ),
      ],
    ),
  );
}

class WinDialogController extends MagicRootController{

  clickNext(Function() nextCallback){
    Get.back();
    nextCallback.call();
  }
  clickHome(Function() homeCallback){
    Get.back();
    homeCallback.call();
  }
}