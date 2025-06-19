import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/routers_name_a.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_dialog.dart';
import 'package:magic_root/magic_uuu/music_utils.dart';

class SetDialog extends MagicRootDialog<SetController>{
  bool isHome;
  SetDialog({required this.isHome});

  @override
  SetController createMagicRootController() => SetController();

  @override
  Widget createActivityContentWidget() => SizedBox(
    width: 320.w,
    height: 436.h,
    child: Stack(
      children: [
        MagicImageViewwwww(name: "set1",width: double.infinity,height: double.infinity,),
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
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: !isHome,
                child: ClickWidget(
                  onTap: (){
                    magicRootController.close();
                  },
                  child: MagicImageViewwwww(name: "set2",width: 242.w,height: 52.h,).marginOnly(top: 7.h,bottom: 7.h),
                ),
              ),
              Visibility(
                visible: !isHome,
                child: ClickWidget(
                  onTap: (){
                    magicRootController.toHome();
                  },
                  child: MagicImageViewwwww(name: "set3",width: 242.w,height: 52.h,).marginOnly(top: 7.h,bottom: 7.h),
                ),
              ),
              ClickWidget(
                onTap: (){
                  magicRootController.toWeb();
                },
                child: MagicImageViewwwww(name: "set4",width: 242.w,height: 52.h,).marginOnly(top: 7.h,bottom: 7.h),
              ),
            ],
          ).marginOnly(top: 80.h),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<SetController>(
                id: "bg",
                builder: (_)=>ClickWidget(
                  onTap: (){
                    magicRootController.setBgMusic();
                  },
                  child: MagicImageViewwwww(name: bgMusicOpen.getData()?"bg_music_open":"bg_music_off",width: 84.w,height: 38.h,),
                ),
              ),
              SizedBox(width: 26.w,),
              GetBuilder<SetController>(
                id: "other",
                builder: (_)=>ClickWidget(
                  onTap: (){
                    magicRootController.setOtherMusic();
                  },
                  child: MagicImageViewwwww(name: otherMusicOpen.getData()?"other_music_open":"other_music_off",width: 84.w,height: 38.h,),
                ),
              ),
            ],
          ).marginOnly(bottom: 78.h),
        ),
      ],
    ),
  );
}
class SetController extends MagicRootController{

  setBgMusic(){
    MusicUtils.instance.setPlayOrStopBg();
    update(["bg"]);
  }

  setOtherMusic(){
    MusicUtils.instance.setPlaySound();
    update(["other"]);
  }

  toWeb(){
    Get.toNamed(RoutersNameA.web);
  }

  toHome(){
    Get.back();
    Get.back();
  }

  close(){
    Get.back();
  }
}