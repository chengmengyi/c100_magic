import 'package:flutter/material.dart';
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
  Widget createActivityContentWidget() => Column(
    children: [
      _topWidget(),
      Expanded(
        child: Center(
          child: _levelWidget(),
        ),
      ),
      _btnWidget(),
      SizedBox(height: 50.h,),
    ],
  );

  _levelWidget()=>Stack(
    children: [
      AspectRatio(
        aspectRatio: 1,
        child: MagicImageViewwwww(name: "home2"),
      ).marginOnly(left: 24.w,right: 24.w)
    ],
  );

  _btnWidget()=>Stack(
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
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 14.w,),
      CoinsViewwww(),
      Spacer(),
      SetViewww(),
      SizedBox(width: 14.w,),
    ],
  );

}

class HomeController extends MagicRootController{

}