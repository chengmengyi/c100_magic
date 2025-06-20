import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';

abstract class MagicRootStatefulWidget extends StatefulWidget{}

abstract class MagicRootStatefulState<K extends MagicRootStatefulWidget> extends State<K>{
  bool closePage=false;
  StreamSubscription<MagicEventttttt>? _s;

  @override
  void initState() {
    super.initState();
    _checkLoadMagicEventtttt();
  }

  @override
  Widget build(BuildContext context) => createMagicStatefulWidget();

  Widget createMagicStatefulWidget();

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
  void dispose() {
    closePage=true;
    if(loadMagicEventtttt()){
      _s?.cancel();
      _s=null;
    }
    super.dispose();
  }
}