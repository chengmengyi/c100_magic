import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_hand_card_viewwww.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_gra_text_viewwwwww.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class PlayBottomViewwwww extends MagicRootStatefulWidget{
  PlayHep playHep;
  PlayBottomViewwwww({required this.playHep});

  @override
  State<StatefulWidget> createState() => _PlayBottomViewwwwwState();
}

class _PlayBottomViewwwwwState extends MagicRootStatefulState<PlayBottomViewwwww> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  bool _isFront = false;
  String randomCardType=cardTypeList.random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
      value: 1.0,
    )..addStatusListener((status){
      if(status==AnimationStatus.dismissed){
        widget.playHep.canClick=true;
      }
    });
  }


  @override
  Widget createMagicStatefulWidget() => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(width: 16.w,),
      _handCardWidget(),
      _pointCardWidget(),
      _wannengWidget(),
      _longjuanfengWidget(),
      SizedBox(width: 16.w,),
    ],
  ).marginOnly(bottom: 40.h);

  _pointCardWidget()=>Expanded(
    child: Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double angle = _controller.value * pi;
          bool isBack = angle > pi / 2;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isBack ?
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: _buildBackWidget(),
            ) :
            _buildFrontWidget(),
          );
        },
      ),
    ),
  );

  _buildFrontWidget() => MagicImageViewwwww(name: getCardIcon(card: widget.playHep.currentPointCard,cardType: randomCardType),width: 49.w,height: 73.h,);

  _buildBackWidget() => MagicImageViewwwww(name: "card_bg",width: 49.w,height: 73.h,);
  
  _wannengWidget()=>ClickWidget(
    child: MagicImageViewwwww(name: "play_bottom1",width: 74.w,height: 74.h,),
  );

  _longjuanfengWidget()=>ClickWidget(
    child: MagicImageViewwwww(name: "play_bottom2",width: 65.w,height: 65.h,),
  );

  _handCardWidget()=>SizedBox(
    width: 67.w,
    height: 73.h,
    child: Stack(
      children: [
        _handCardItemWidget(),
        _handCardItemWidget().marginOnly(left: 6.w),
        _handCardItemWidget().marginOnly(left: 12.w),
        _handCardItemWidget().marginOnly(left: 18.w),
      ],
    ),
  );

  Widget _handCardItemWidget()=>SizedBox(
    width: 49.w,
    height: 73.h,
    child: Stack(
      children: [
        PlayHandCardViewwww(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: true,
            child: Container(
              width: 42.w,
              height: 14.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 3.h),
              decoration: BoxDecoration(
                color: "#000000".toColor().withOpacity(0.6),
                borderRadius: BorderRadius.circular(7.w),
              ),
              child: MagicTextViewwwww(text: "17", size: 14.sp, color: "#FFFFFF",),
            ),
          ),
        )
      ],
    ),
  );

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.updatePointCard:
        setState(() {});
        _startFlipAnimator();
        break;
    }
  }

  _startFlipAnimator(){
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }
}