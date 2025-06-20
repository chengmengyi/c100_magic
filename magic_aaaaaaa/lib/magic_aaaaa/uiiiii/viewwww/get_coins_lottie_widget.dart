import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_lottie_widget.dart';
import 'package:magic_root/magic_rrrrr/magic_root_stateful_widget.dart';

class GetCoinsLottieWidget extends MagicRootStatefulWidget{
  @override
  State<StatefulWidget> createState() =>GetCoinsLottieWidgetState();
}

class GetCoinsLottieWidgetState extends MagicRootStatefulState<GetCoinsLottieWidget> with TickerProviderStateMixin{
  var showMoneyLottie=false;
  late AnimationController moneyLottieController;

  @override
  void initState() {
    super.initState();
    moneyLottieController=AnimationController(vsync: this,duration: const Duration(milliseconds: 500))..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        showMoneyLottie=false;
        setState(() {});
      }
    });
  }

  @override
  Widget createMagicStatefulWidget() => Visibility(
    visible: showMoneyLottie,
    child: MagicLottieWidget(name: "get_coins",controller: moneyLottieController,),
  );

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch(tttt.eventCodeeeeee){
      case MagicCodeAAAAA.showCoinsLottie:
        showMoneyLottie=true;
        setState(() {});
        moneyLottieController..reset()..forward();
        break;
    }
  }
}
