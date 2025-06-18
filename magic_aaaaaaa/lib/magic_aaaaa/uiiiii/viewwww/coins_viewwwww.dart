import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class CoinsViewwww extends MagicRootStatefulWidget{
  @override
  State<StatefulWidget> createState() => _CoinsViewwwwState();
}

class _CoinsViewwwwState extends MagicRootStatefulState<CoinsViewwww>{
  @override
  Widget createMagicStatefulWidget() => Stack(
    alignment: Alignment.centerLeft,
    children: [
      Container(
        width: 110.w,
        height: 30.h,
        margin: EdgeInsets.only(left: 4.w),
        child: Stack(
          children: [
            MagicImageViewwwww(name: "coins2",width: 110.w,height: 30.h,),
            Container(
              width: double.infinity,
              height: 30.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w,top: 5.h),
              child: MagicTextViewwwww(text: "${aCoinsNum.getData()}", size: 17.sp, color: "#FFEA4A"),
            )
          ],
        ),
      ),
      MagicImageViewwwww(name: "coins1",width: 36.w,height: 36.w,),
    ],
  );

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.updateCoins:
        setState(() {});
        break;
    }
  }
}