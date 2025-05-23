import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/routers_name_a.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_gra_text_viewwwwww.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_activity.dart';
import 'package:magic_root/magic_rrrrr/magic_routers_name.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

StorageData<bool> firstOpenLaunch=StorageData<bool>(key: "firstOpenLaunch", defaultValue: true);

class LaunchActivity extends MagicRootActivity<LaunchCon>{
  @override
  Widget createActivityBgWidget() => MagicImageViewwwww(name: "launch1",width: double.infinity,height: double.infinity,);

  @override
  LaunchCon createMagicRootController() => LaunchCon();

  @override
  Widget createActivityContentWidget() => Column(
    children: [
      SizedBox(height: 90.h,),
      MagicImageViewwwww(name: "launch2",width: 265.w,height: 120.h,),
      Spacer(),
      firstOpenLaunch.getData()?
      _btnWidget():
      _progressWidget(),
      SizedBox(height: 112.h,),
    ],
  );

  _btnWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClickWidget(
        onTap: (){
          magicRootController.clickPlay();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            MagicImageViewwwww(name: "btn1",width: 293.w,height: 87.h,),
            MagicGraTextViewwwwww(
              text: "Play",
              size: 38.sp,
              colors: ["#F5FDEB".toColor(),"#F4E4BD".toColor()],
              shadowsColor: "#3A6B10",
            ),
          ],
        ),
      ),
      SizedBox(height: 12.h,),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<LaunchCon>(
            id: "privacy",
            builder: (_)=>ClickWidget(
              onTap: (){
                magicRootController.clickAgreeIcon();
              },
              child: MagicImageViewwwww(name: magicRootController.selectPrivacy?"icon_sel":"icon_uns",width: 20.w,height: 20.w,),
            ),
          ),
          SizedBox(width: 10.w,),
          ClickWidget(
            onTap: (){
              magicRootController.toWeb();
            },
            child: MagicTextViewwwww(text: "Privacy policy&teams of service", size: 18.sp, color: "#FFFFFF",),
          ),
        ],
      )
    ],
  );

  _progressWidget()=>GetBuilder<LaunchCon>(
    id: "progress",
    builder: (_)=>Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MagicTextViewwwww(
          text: "Loading...${((magicRootController.animationController?.value??0)*100).toInt()}%",
          size: 21.sp,
          color: "#FFFFFF",
          fontWeight: FontWeight.bold,
          shadowsColor: "#242424",
        ),
        SizedBox(height: 20.h,),
        Container(
          width: 330.w,
          height: 21.h,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 1.5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.w),
            color: "#4A5259".toColor(),
          ),
          child: ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: magicRootController.animationController?.value,
              child: Container(
                width: 327.w,
                height: 18.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.w),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: ["#F4CD48".toColor(),"#EB8229".toColor(),],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

class LaunchCon extends MagicRootController with GetSingleTickerProviderStateMixin{
  var selectPrivacy=false;
  AnimationController? animationController;

  @override
  void onInit() {
    super.onInit();
    _initAnimator();
  }

  @override
  void onReady() {
    super.onReady();
    if(!firstOpenLaunch.getData()){
      animationController?.forward();
    }
  }

  clickAgreeIcon(){
    selectPrivacy=!selectPrivacy;
    update(["privacy"]);
  }

  toWeb(){
    Get.toNamed(MagicRoutersName.web);
  }

  clickPlay(){
    if(!selectPrivacy){
      showToast("Please read and agree to the permissions first");
      return;
    }
    firstOpenLaunch.saveData(false);
    _toHome();
  }

  _initAnimator(){
    animationController=AnimationController(duration: const Duration(seconds: 10),vsync: this)
      ..addListener(() {
        update(["progress"]);
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          _toHome();
        }
      });
  }

  _toHome(){
    Get.offNamed(RoutersNameA.home);
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }
}