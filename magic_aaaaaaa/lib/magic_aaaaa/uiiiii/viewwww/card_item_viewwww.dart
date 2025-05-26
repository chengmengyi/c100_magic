import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/bean/card_bean.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';

class CardItemViewwww extends MagicRootStatefulWidget{
  CardBean cardBean;
  CardItemViewwww({
    required this.cardBean,
});
  @override
  State<StatefulWidget> createState() => _CardItemViewwwwState();
}

class _CardItemViewwwwState extends MagicRootStatefulState<CardItemViewwww> with SingleTickerProviderStateMixin{
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
    );
  }

  @override
  Widget createMagicStatefulWidget() => AnimatedBuilder(
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
  );

  _buildFrontWidget() => MagicImageViewwwww(name: getCardIcon(card: widget.cardBean.cardNum,cardType: randomCardType),width: 49.w,height: 73.h,);

  _buildBackWidget() => MagicImageViewwwww(name: "card_bg",width: 49.w,height: 73.h,);

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.startFlipAnimator:
        _startFlipAnimator(tttt.dynamicValue as List<int>);
        break;
    }
  }

  _startFlipAnimator(List<int> list){
    if(!list.contains(widget.cardBean.index)){
      return;
    }
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}