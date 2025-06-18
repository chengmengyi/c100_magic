import 'package:event_bus/event_bus.dart';

final EventBus eventBussssssss=EventBus();

class MagicEventttttt{
  int eventCodeeeeee;
  int? intValue;
  dynamic dynamicValue;

  MagicEventttttt({
    required this.eventCodeeeeee,
    this.dynamicValue,
  }){
    eventBussssssss.fire(this);
  }
}

class MagicCodeAAAAA{
  static const int startFlipAnimator=1;
  static const int updatePointCard=2;
  static const int startCardMoveAnimator=3;
  static const int endCardMoveAnimator=4;
  static const int updateCoins=5;
  static const int add5HandsCardNum=6;
  static const int updateLevel=7;
  static const int resetBottom=8;
  static const int startCountHandCards=9;
  static const int addWanNengCards=10;
  static const int startLongjuanfengAnimator=11;
}