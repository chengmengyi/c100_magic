import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_dialog.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class PlayFailDialog extends MagicRootDialog<PlayFailController>{
  Function() replayCallback;
  Function() homeCallback;
  PlayFailDialog({
    required this.replayCallback,
    required this.homeCallback,
});

  @override
  PlayFailController createMagicRootController() => PlayFailController();

  @override
  Widget createActivityContentWidget() => SizedBox(
    width: 320.w,
    height: 436.h,
    child: Stack(
      children: [
        MagicImageViewwwww(name: "fail1",width: double.infinity,height: double.infinity,),
        Positioned(
          right: 0,
          top: 40.h,
          child: ClickWidget(
            onTap: (){
              Get.back();
            },
            child: MagicImageViewwwww(name: "icon_close",width: 34.w,height: 34.w,),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Spend 2000 Magic",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: "#F1C24D".toColor(),
                        fontWeight: FontWeight.bold,
                        fontFamily: "baloo",
                      )
                    ),
                    TextSpan(
                        text: " Crystalsto Get Extra",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: "#EEE4CB".toColor(),
                          fontWeight: FontWeight.bold,
                          fontFamily: "baloo",
                        )
                    ),
                    TextSpan(
                        text: " 5 Cards!",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: "#ED5042".toColor(),
                          fontWeight: FontWeight.bold,
                          fontFamily: "baloo",
                        )
                    ),
                  ]
                ),
              ).marginOnly(left: 36.w,right: 36.w),
              Visibility(
                visible: aCoinsNum.getData()>=2000,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: ClickWidget(
                  onTap: (){
                    magicRootController.clickCoins();
                  },
                  child: MagicImageViewwwww(name: "fail2",width: 196.w,height: 52.h,),
                ),
              ),
              SizedBox(height: 10.h,),
              ClickWidget(
                onTap: (){
                  magicRootController.clickReplay(replayCallback);
                },
                child: MagicImageViewwwww(name: "fail3",width: 196.w,height: 52.h,),
              ),
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
        )
      ],
    ),
  );
}

class PlayFailController extends MagicRootController{


  clickCoins(){
    if(aCoinsNum.getData()<2000){
      return;
    }
    UserInfoHep.instance.updateCoinsNum(-2000);
    Get.back();
    MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.add5HandsCardNum);
  }

  clickHome(Function() homeCallback){
    Get.back();
    homeCallback.call();
  }

  clickReplay(Function() replayCallback){
    Get.back();
    replayCallback.call();
  }
}