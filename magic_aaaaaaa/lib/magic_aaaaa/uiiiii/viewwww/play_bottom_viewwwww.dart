import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/dialogggg/longjuanfeng_dialog.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/dialogggg/wanneng_dialog.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_hand_card_viewwww.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
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

class _PlayBottomViewwwwwState extends MagicRootStatefulState<PlayBottomViewwwww> with TickerProviderStateMixin{
  late AnimationController _pointCardController;
  bool _isFront = false,showHandCard=false;
  String randomCardType=cardTypeList.random();
  GlobalKey pointCardGlobalKey=GlobalKey();
  GlobalKey handCardGlobalKey=GlobalKey();

  Animation<Offset>? _handCardAnimation;
  late AnimationController _handCardController;

  @override
  void initState() {
    super.initState();
    _pointCardController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
      value: 1.0,
    )..addStatusListener((status){
      if(status==AnimationStatus.dismissed||status==AnimationStatus.completed){
        widget.playHep.canClick=true;
      }
    });

    _handCardController=AnimationController(vsync: this,duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          setState(() {
            showHandCard=false;
          });
          widget.playHep.setPointCard();
        }
      });

    Future((){
      widget.playHep.setPointCardGlobalKey(pointCardGlobalKey);
    });
  }


  @override
  Widget createMagicStatefulWidget() => Stack(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: 16.w,),
          _handCardWidget(),
          _pointCardWidget(),
          _wannengWidget(),
          _longjuanfengWidget(),
          SizedBox(width: 16.w,),
        ],
      ),
      _handCardAnimatorWidget(),
    ],
  ).marginOnly(bottom: 40.h);

  _pointCardWidget()=>Expanded(
    child: Center(
      child: Visibility(
        visible: !showHandCard,
        child: AnimatedBuilder(
          key: pointCardGlobalKey,
          animation: _pointCardController,
          builder: (context, child) {
            double angle = _pointCardController.value * pi;
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
    ),
  );

  _buildFrontWidget() => MagicImageViewwwww(name: getCardIcon(card: widget.playHep.currentPointCard?.cardNum??"",cardType: widget.playHep.currentPointCard?.cardType??"",hasWanneng: widget.playHep.hasWanNengCard),width: 49.w,height: 73.h,);

  _buildBackWidget() => MagicImageViewwwww(name: "card_bg",width: 49.w,height: 73.h,);
  
  _wannengWidget()=>ClickWidget(
    onTap: (){
      _clickWanneng();
    },
    child: MagicImageViewwwww(name: "play_bottom1",width: 74.w,height: 74.h,),
  );

  _longjuanfengWidget()=>ClickWidget(
    onTap: (){
      _clickLongjuanfeng();
    },
    child: MagicImageViewwwww(name: "play_bottom2",width: 65.w,height: 65.h,),
  );

  _handCardWidget()=>ClickWidget(
    onTap: (){
      _clickHandCard();
    },
    child: SizedBox(
      width: 67.w,
      height: 73.h,
      key: handCardGlobalKey,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: List.generate(widget.playHep.handCardNum, (index){
          var handCardNum = widget.playHep.handCardNum;
          if(handCardNum<=0){
            return Container();
          }
          return _handCardItemWidget(handCardNum==index+1).marginOnly(left: index>=4?18.w:(6.w)*index);
        }),
      ),
    ),
  );

  Widget _handCardItemWidget(bool showNum)=>SizedBox(
    width: 49.w,
    height: 73.h,
    child: Stack(
      children: [
        PlayHandCardViewwww(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: showNum,
            child: Container(
              width: 42.w,
              height: 14.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 3.h),
              decoration: BoxDecoration(
                color: "#000000".toColor().withOpacity(0.6),
                borderRadius: BorderRadius.circular(7.w),
              ),
              child: MagicTextViewwwww(text: "${widget.playHep.handCardNum}", size: 14.sp, color: "#FFFFFF",),
            ),
          ),
        )
      ],
    ),
  );

  _handCardAnimatorWidget(){
    if(!showHandCard){
      return Container();
    }
    var value = _handCardAnimation?.value;
    var dx = value?.dx??0;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: dx<=0?0:dx),
          child: MagicImageViewwwww(name: "card_bg",width: 49.w,height: 73.h,),
        )
      ],
    );
  }

  _clickHandCard(){
    var handCardRenderBox = handCardGlobalKey.currentContext!.findRenderObject() as RenderBox;
    var handCardOffset = handCardRenderBox.localToGlobal(Offset.zero);
    if(widget.playHep.handCardNum>=4){
      handCardOffset=Offset(handCardOffset.dx+(18.w), handCardOffset.dy);
    }else if (widget.playHep.handCardNum>0){
      handCardOffset=Offset(handCardOffset.dx+((6.w)*(widget.playHep.handCardNum-1)), handCardOffset.dy);
    }
    var pointRenderBox = pointCardGlobalKey.currentContext!.findRenderObject() as RenderBox;
    var pointOffset = pointRenderBox.localToGlobal(Offset.zero);
    showHandCard=true;
    _isFront=false;
    _pointCardController.value=1.0;
    widget.playHep.updateHandCardNum(-1);
    setState(() {});

    _handCardAnimation=Tween<Offset>(
      begin: handCardOffset,
      end: pointOffset,
    ).animate(CurvedAnimation(parent: _handCardController, curve: Curves.easeInOut));
    _handCardController..reset()..forward();
  }

  _clickWanneng(){
    Get.dialog(
      WanNengDialog(),
      barrierDismissible: false,
    );
  }

  _clickLongjuanfeng(){
    Get.dialog(
      LongjuanfengDialog(
        hasLongjuanfengCallback: (){
          var result = widget.playHep.cardList.expand((row) => row).where((card) => card.show&&!card.isCovered&&card.cardNum.isNotEmpty).toList();
          MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.startLongjuanfengAnimator,dynamicValue: result);
        },
      ),
      barrierDismissible: false,
    );

  }

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.updatePointCard:
        setState(() {});
        _startFlipAnimator();
        break;
      case MagicCodeAAAAA.endCardMoveAnimator:
        setState(() {});
        break;
      case MagicCodeAAAAA.add5HandsCardNum:
        widget.playHep.addHandsCardNum(5);
        setState(() {});
        break;
      case MagicCodeAAAAA.resetBottom:
        _isFront=false;
        showHandCard=false;
        _pointCardController.value=1.0;
        setState(() {});
        break;
      case MagicCodeAAAAA.startCountHandCards:
        _removeHandCard();
        break;
      case MagicCodeAAAAA.addWanNengCards:
        widget.playHep.hasWanNengCard=true;
        setState(() {});
        break;
    }
  }

  _removeHandCard()async{
    if(widget.playHep.handCardNum<=0){
      return;
    }
    while(widget.playHep.handCardNum>0){
      UserInfoHep.instance.updateCoinsNum(100);
      widget.playHep.updateHandCardNum(-1);
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 400));
    }
  }

  _startFlipAnimator(){
    if (_isFront) {
      _pointCardController.forward();
    } else {
      _pointCardController.reverse();
    }
    _isFront = !_isFront;

  }

  @override
  void dispose() {
    _handCardController.dispose();
    _pointCardController.dispose();
    super.dispose();
  }
}