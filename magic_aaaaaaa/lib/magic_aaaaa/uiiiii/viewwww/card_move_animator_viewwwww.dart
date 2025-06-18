import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/bean/card_bean.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class CardMoveAnimatorViewwwww extends MagicRootStatefulWidget{
  @override
  State<StatefulWidget> createState() => _CardMoveAnimatorViewwwwwState();
}

class _CardMoveAnimatorViewwwwwState extends MagicRootStatefulState<CardMoveAnimatorViewwwww>  with TickerProviderStateMixin{
  CardBean? cardBean;
  Animation<Offset>? keyAnimation;
  late AnimationController _animationController;
  // String randomCardType=cardTypeList.random();

  @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          setState(() {
            cardBean=null;
          });
        }
      });
  }

  @override
  Widget createMagicStatefulWidget() {
    if(null==cardBean){
      return Container();
    }
    var value = keyAnimation?.value;
    var dx = value?.dx??0;
    var dy = value?.dy??0;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: dx<=0?0:dx,top: dy<=0?0:dy),
          child: MagicImageViewwwww(name: getCardIcon(card: cardBean?.cardNum??"",cardType: cardBean?.cardType??""),width: 49.w,height: 73.h,),
        )
      ],
    );
  }

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.startCardMoveAnimator:
        _startCardMoveAnimator(tttt.dynamicValue as Map<String,dynamic>);
        break;
    }
  }

  _startCardMoveAnimator(Map<String, dynamic> map){
    Offset cardOffset=map["cardOffset"];
    Offset pointOffset=map["pointOffset"];
    cardBean=map["bean"];
    // randomCardType=cardTypeList.random();
    setState(() {});
    keyAnimation=Tween<Offset>(
      begin: cardOffset,
      end: pointOffset,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController..reset()..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}