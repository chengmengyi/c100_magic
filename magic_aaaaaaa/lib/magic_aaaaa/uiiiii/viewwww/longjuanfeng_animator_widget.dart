import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/bean/card_bean.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';

class LongjuanfengAnimatorWidget extends MagicRootStatefulWidget{
  @override
  State<StatefulWidget> createState() => LongjuanfengAnimatorWidgetState();
}

class LongjuanfengAnimatorWidgetState extends MagicRootStatefulState<LongjuanfengAnimatorWidget> with SingleTickerProviderStateMixin{
  bool showCard=false;
  List<CardBean> cardList=[];
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _rotationAnimation;
  late AnimationStatusListener _statusListener;

  @override
  void initState() {
    super.initState();
    _initAnimator();
  }

  @override
  Widget createMagicStatefulWidget() => showCard?
  AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return Transform.translate(
        offset: _offsetAnimation.value * MediaQuery.of(context).size.width,
        child: Transform.rotate(
          angle: _rotationAnimation.value * 2 * 3.1415926 * 2,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: child,
          ),
        ),
      );
    },
    child: Stack(
      children: List.generate(cardList.length, (index){
        var bean = cardList[index];
        var renderBox = bean.globalKey.currentContext!.findRenderObject() as RenderBox;
        var offset = renderBox.localToGlobal(Offset.zero);
        return Positioned(
          top: offset.dy,
          left: offset.dx,
          child: MagicImageViewwwww(name: getCardIcon(card: bean.cardNum,cardType: bean.cardType),width: 49.w,height: 73.h,),
        );
      }),
    ),
  ):
  Container();

  _initAnimator(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2.0, -2.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _statusListener=(status){
      if(status==AnimationStatus.completed){
        setState(() {
          showCard=false;
        });
        UserInfoHep.instance.updateCoinsNum(100*cardList.length);

      }
    };
    _controller.addStatusListener(_statusListener);
  }

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.startLongjuanfengAnimator:
        cardList = tttt.dynamicValue as List<CardBean>;
        setState(() {
          showCard=true;
        });
        _controller..reset()..forward();
        break;

    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }
}