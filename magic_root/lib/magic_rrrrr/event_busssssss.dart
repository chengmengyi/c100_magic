import 'package:event_bus/event_bus.dart';

final EventBus eventBussssssss=EventBus();

class MagicEventttttt{
  String eventCodeeeeee;
  int? intValue;
  MagicEventttttt({
    required this.eventCodeeeeee,
  }){
    eventBussssssss.fire(this);
  }
}

enum MagicCodeAAAAA{
  test,
}