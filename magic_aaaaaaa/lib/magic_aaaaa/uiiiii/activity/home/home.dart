import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/routers_name_a.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/coins_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/set_viewwww.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_gra_text_viewwwwww.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_activity.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class HomeActivity extends MagicRootActivity<HomeController>{
  @override
  Widget createActivityBgWidget() => MagicImageViewwwww(name: "home1",width: double.infinity,height: double.infinity,);

  @override
  HomeController createMagicRootController() => HomeController();

  @override
  Widget createActivityContentWidget() => SafeArea(
    top: true,
    bottom: false,
    child: Column(
      children: [
        _topWidget(),
        Expanded(
          child: Center(
            child: ClickWidget(
              onTap: (){
                magicRootController.clickTest();
              },
              child: _levelWidget(),
            ),
          ),
        ),
        _btnWidget(),
        SizedBox(height: 50.h,),
      ],
    ),
  );

  _levelWidget()=>AspectRatio(
    aspectRatio: 1,
    child: Stack(
      children: [
        MagicImageViewwwww(name: "home2"),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 88.w,
                height: 34.h,
                child: Stack(
                  children: [
                    MagicImageViewwwww(name: "home3",width: 88.w,height: 34.h,),
                    Positioned(
                      right: 7.w,
                      bottom: 4.h,
                      child: MagicTextViewwwww(
                        text: "${UserInfoHep.instance.getCurrentLevelNum()}/50",
                        size: 14.sp,
                        color: "#6CFFF8",
                        shadowsColor: "#000000",
                      ),
                    )
                  ],
                ),
              ),
              MagicTextViewwwww(text: "${UserInfoHep.instance.getCurrentLevelNum()}", size: 35.sp, color: "#FFFFFF",shadowsColor: "#DC384B",)
            ],
          ).marginOnly(top: 89.h),
        )
      ],
    ),
  ).marginOnly(left: 24.w,right: 24.w);

  _btnWidget()=>ClickWidget(
    onTap: (){
      magicRootController.clickStart();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        MagicImageViewwwww(name: "btn2",width: 214.w,height: 87.h,),
        MagicGraTextViewwwwww(
          text: "Start",
          size: 36.sp,
          colors: ["#F5FDEB".toColor(),"#F4E4BD".toColor()],
          shadowsColor: "#3A6B10",
        ),
      ],
    ),
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 14.w,),
      CoinsViewwww(),
      Spacer(),
      SetViewww(isHome: true,),
      SizedBox(width: 14.w,),
    ],
  );

}

class HomeController extends MagicRootController{

  clickStart(){
    Get.toNamed(RoutersNameA.play1_10);
  }

  clickTest(){
    if(!kDebugMode){
      return;
    }
    UserInfoHep.instance.updateCoinsNum(5000);
  }
}