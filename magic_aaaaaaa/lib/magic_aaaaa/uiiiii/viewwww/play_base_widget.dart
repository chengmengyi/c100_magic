import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/card_move_animator_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/coins_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/longjuanfeng_animator_widget.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_bottom_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_level_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/set_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';

class PlayBaseWidget extends StatelessWidget{
  PlayHep playHep;
  Widget child;
  PlayBaseWidget({
    required this.playHep,
    required this.child,
});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            _topWidget(),
            Expanded(
              child: Center(
                child: child,
              ),
            ),
            PlayBottomViewwwww(playHep: playHep,),
          ],
        ),
      ),
      CardMoveAnimatorViewwwww(),
      LongjuanfengAnimatorWidget(),
    ],
  );


  _topWidget()=>Stack(
    children: [
      PlayLevelViewwwww().marginOnly(top: 10.h),
      Row(
        children: [
          SizedBox(width: 16.w,),
          CoinsViewwww(),
          Spacer(),
          SetViewww(),
          SizedBox(width: 16.w,),
        ],
      )
    ],
  );
}