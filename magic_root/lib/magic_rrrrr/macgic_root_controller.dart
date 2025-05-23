import 'dart:async';
import 'package:get/get.dart';
import 'event_busssssss.dart';

class MagicRootController extends GetxController{
  StreamSubscription<MagicEventttttt>? _s;

  @override
  void onInit() {
    super.onInit();
    _checkLoadMagicEventtttt();
  }

  bool loadMagicEventtttt()=>false;

  handleMagicEventtttttt(MagicEventttttt tttt){}

  _checkLoadMagicEventtttt(){
    if(!loadMagicEventtttt()){
      return;
    }
    _s=eventBussssssss.on<MagicEventttttt>().listen((tttt) {
      handleMagicEventtttttt(tttt);
    });
  }

  @override
  void onClose() {
    if(loadMagicEventtttt()){
      _s?.cancel();
      _s=null;
    }
    super.onClose();
  }
}