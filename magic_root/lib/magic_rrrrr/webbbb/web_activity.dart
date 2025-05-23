import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_local_infooooo.dart';
import 'package:magic_root/magic_rrrrr/magic_root_activity.dart';

class WebActivity extends MagicRootActivity<WebController>{
  @override
  Widget createActivityBgWidget() => MagicImageViewwwww(name: "home1",width: double.infinity,height: double.infinity,);


  @override
  WebController createMagicRootController()=>WebController();

  @override
  Widget createActivityContentWidget() => Column(
    children: [
      Row(
        children: [
          SizedBox(width: 14.w,),
          ClickWidget(
            onTap: (){
              Get.back();
            },
            child: MagicImageViewwwww(name: "icon_close",width: 34.w,height: 34.w,),
          ),
        ],
      ),
      SizedBox(height: 12.h,),
      Expanded(
        child: WebViewWidget(
          controller: magicRootController.webViewwwwww,
        ),
      )
    ],
  );
}

class WebController extends MagicRootController{
  late WebViewController webViewwwwww;

  @override
  void onInit() {
    super.onInit();
    webViewwwwww=WebViewController()..loadRequest(Uri.parse(MagicLocalInfooooo.privacy));
  }
}