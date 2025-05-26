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
}