import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_root/magic_ad/ad_utils.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_dialog.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class WanNengDialog extends MagicRootDialog<WanNengDialogController>{

  @override
  WanNengDialogController createMagicRootController() => WanNengDialogController();

  @override
  Widget createActivityContentWidget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      MagicImageViewwwww(name: "wanneng1",height: 56.h,fit: BoxFit.fitHeight,),
      SizedBox(height: 30.h,),
      MagicImageViewwwww(name: "wanneng2",width: 142.w,height: 142.w,),
      SizedBox(height: 50.h,),
      ClickWidget(
        onTap: (){
          magicRootController.clickUseCoins();
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
                MagicTextViewwwww(text: "1000", size: 18.sp, color: "#FFFBEC",):
                ShakeAnimationWidget(
                  randomValue: 10,
                  isForward: false,
                  shakeCount: 0,
                  shakeAnimationController: magicRootController.shakeAnimationController,
                  shakeAnimationType: ShakeAnimationType.LeftRightShake,
                  child: MagicTextViewwwww(text: "1000", size: 18.sp, color: "#C62828",),
                ),
              ],
            )
          ],
        ),
      ),
      SizedBox(height: 10.h,),
      ClickWidget(
        onTap: (){
          magicRootController.clickVideo();
        },
        child: MagicImageViewwwww(name: "wanneng4",width: 196.w,height: 52.h,),
      ),
    ],
  );

}
class WanNengDialogController extends MagicRootController{
  ShakeAnimationController shakeAnimationController=ShakeAnimationController();


  clickUseCoins(){
    if(aCoinsNum.getData()<1000){
      shakeAnimationController.start();
      return;
    }
    UserInfoHep.instance.updateCoinsNum(-1000);
    MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.addWanNengCards);
    Get.back();
  }

  clickVideo(){
    AdUtils.instance.showAdAAAAAA(
      adType: AdType.reward,
      closeAd: (){
        MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.addWanNengCards);
        Get.back();
      },
    );
  }
}