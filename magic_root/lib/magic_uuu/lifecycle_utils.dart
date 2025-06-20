import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:magic_root/magic_uuu/music_utils.dart';

class LifecycleUtils{
  static final LifecycleUtils _utils = LifecycleUtils();
  static LifecycleUtils get instance => _utils;

  initLifecycle(){
    FlutterAppLifecycle.instance.setCallObserver(AppStateObserver(
        call: (back){
          if(back){
            MusicUtils.instance.pauseMusic();
          }else{
            MusicUtils.instance.playMusic();
          }
        }
    ));
  }
}