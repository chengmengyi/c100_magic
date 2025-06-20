import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_root/magic_ad/ad_utils.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_lottie_widget.dart';
import 'package:magic_root/magic_rrrrr/magic_root_dialog.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class LongjuanfengDialog extends MagicRootDialog<LongJuanFengDialogController>{
  Function() hasLongjuanfengCallback;
  LongjuanfengDialog({required this.hasLongjuanfengCallback});

  @override
  LongJuanFengDialogController createMagicRootController() => LongJuanFengDialogController();

  @override
  Widget createActivityContentWidget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      MagicImageViewwwww(name: "long1",height: 56.h,fit: BoxFit.fitHeight,),
      SizedBox(height: 30.h,),
      Stack(
        alignment: Alignment.center,
        children: [
          MagicLottieWidget(name: "tanchuang",width: 220.w,height: 220.w,),
          MagicImageViewwwww(name: "long2",width: 110.w,height: 110.w,),
        ],
      ),
      SizedBox(height: 50.h,),
      ClickWidget(
        onTap: (){
          magicRootController.clickUseCoins(hasLongjuanfengCallback);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            MagicImageViewwwww(name: "wanneng3",width: 196.w,height: 52.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MagicImageViewwwww(name: "coins1",width: 26.w,height: 26.w,),
                SizedBox(width: 2.w,),
                aCoinsNum.getData()>=1000?
                MagicTextViewwwww(text: "2000", size: 18.sp, color: "#FFFBEC",):
                ShakeAnimationWidget(
                  randomValue: 10,
                  isForward: false,
                  shakeCount: 0,
                  shakeAnimationController: magicRootController.shakeAnimationController,
                  shakeAnimationType: ShakeAnimationType.LeftRightShake,
                  child: MagicTextViewwwww(text: "2000", size: 18.sp, color: "#C62828",),
                ),
              ],
            )
          ],
        ),
      ),
      SizedBox(height: 10.h,),
      ClickWidget(
        onTap: (){
          magicRootController.clickVideo(hasLongjuanfengCallback);
        },
        child: MagicImageViewwwww(name: "wanneng4",width: 196.w,height: 52.h,),
      ),
    ],
  );

}
class LongJuanFengDialogController extends MagicRootController{
  ShakeAnimationController shakeAnimationController=ShakeAnimationController();


  clickUseCoins(Function() hasLongjuanfengCallback){
    if(aCoinsNum.getData()<2000){
      shakeAnimationController.start();
      return;
    }
    UserInfoHep.instance.updateCoinsNum(-2000);
    Get.back();
    hasLongjuanfengCallback.call();
  }

  clickVideo(Function() hasLongjuanfengCallback){
    AdUtils.instance.showAdAAAAAA(
      adType: AdType.reward,
      closeAd: (){
        Get.back();
        hasLongjuanfengCallback.call();
      },
    );
  }
}