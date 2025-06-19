import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_activity.dart';
import 'package:magic_root/magic_uuu/local_config.dart';

class WebActivity extends MagicRootActivity<WebController>{
  Widget createActivityBgWidget() => MagicImageViewwwww(name: "home1",width: double.infinity,height: double.infinity,);

  @override
  WebController createMagicRootController() => WebController();

  @override
  Widget createActivityContentWidget() => SafeArea(
    top: true,
    bottom: false,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClickWidget(
          onTap: (){
            Get.back();
          },
          child: MagicImageViewwwww(name: "icon_close",width: 34.w,height: 34.w,),
        ).marginOnly(left: 16.w,bottom: 16.w),
        Expanded(
          child: WebViewWidget(controller: magicRootController.controller),
        )
      ],
    ),
  );

}
class WebController extends MagicRootController{
  late WebViewController controller;

  @override
  void onInit() {
    super.onInit();
    controller=WebViewController();
  }

  @override
  void onReady() {
    super.onReady();
    controller.loadRequest(Uri.parse(privacyUrl));
  }
}