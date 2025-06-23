import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_gra_text_viewwwwww.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';

class PlayLevelViewwwww extends MagicRootStatefulWidget{
  @override
  State<StatefulWidget> createState() => _PlayLevelViewwwwwState();
}

class _PlayLevelViewwwwwState extends MagicRootStatefulState<PlayLevelViewwwww>{
  @override
  Widget createMagicStatefulWidget() => SizedBox(
    width: double.infinity,
    height: 112.h,
    child: Stack(
      children: [
        MagicImageViewwwww(name: "level_bg",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.bottomCenter,
          child: MagicGraTextViewwwwww(
            text: "Level   ${UserInfoHep.instance.getCurrentLevelNum()}",
            size: 22.sp,
            colors: [
              "#FFDF0C".toColor(),
              "#FFB400".toColor(),
            ],
          ).marginOnly(bottom: 28.h),
        )
      ],
    ),
  );

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.updateLevel:
        setState(() {});
        break;
    }
  }
}