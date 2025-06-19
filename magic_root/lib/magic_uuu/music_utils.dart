
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ad_ios_plugins/data/storage_data.dart';

StorageData<bool> bgMusicOpen=StorageData<bool>(key: "bgMusicOpen", defaultValue: true);
StorageData<bool> otherMusicOpen=StorageData<bool>(key: "otherMusicOpen", defaultValue: true);

class MusicUtils{
  factory MusicUtils()=>_getInstance();
  static MusicUtils get instance => _getInstance ();
  static MusicUtils? _instance;
  static MusicUtils _getInstance(){
    _instance??=MusicUtils._internal();
    return _instance!;
  }

  final _bgAudioPlayer=AudioPlayer();
  final _voiceAudioPlayer=AudioPlayer();

  MusicUtils._internal(){
    _voiceAudioPlayer.onPlayerStateChanged.listen((event) {
      if(bgMusicOpen.getData()){
        if(event==PlayerState.playing){
          _bgAudioPlayer.pause();
        }else if(event==PlayerState.completed){
          _bgAudioPlayer.resume();
        }
      }
    });
  }

  playBgMp3(){
    if(bgMusicOpen.getData()){
      _bgAudioPlayer.setReleaseMode(ReleaseMode.loop);
      _bgAudioPlayer.play(AssetSource("bg.MP3"));
    }
  }

  setPlayOrStopBg(){
    if(bgMusicOpen.getData()){
      bgMusicOpen.saveData(false);
      _bgAudioPlayer.pause();
    }else{
      bgMusicOpen.saveData(true);
      playBgMp3();
    }
  }

  pauseMusic(){
    if(bgMusicOpen.getData()&&_bgAudioPlayer.state==PlayerState.playing){
      _bgAudioPlayer.pause();
    }
  }

  playMusic(){
    if(bgMusicOpen.getData()&&_bgAudioPlayer.state!=PlayerState.playing){
      _bgAudioPlayer.resume();
    }
  }

  // playOrPauseBg(){
  //   if(p2MusicOpen.getData()){
  //     if(_bgAudioPlayer.state==PlayerState.playing){
  //       _bgAudioPlayer.pause();
  //     }else if(_bgAudioPlayer.state==PlayerState.paused){
  //       _bgAudioPlayer.resume();
  //     }
  //   }
  // }

  setPlaySound(){
    otherMusicOpen.saveData(!otherMusicOpen.getData());
  }

  playXiaoChu(){
    if(otherMusicOpen.getData()){
      _voiceAudioPlayer.play(AssetSource("xiaochu.MP3"));
    }
  }

  playShengLi(){
    if(otherMusicOpen.getData()){
      _voiceAudioPlayer.play(AssetSource("shengli.MP3"));
    }
  }

  playShiBai(){
    if(otherMusicOpen.getData()){
      _voiceAudioPlayer.play(AssetSource("shibai.MP3"));
    }
  }

  playFeng(){
    if(otherMusicOpen.getData()){
      _voiceAudioPlayer.play(AssetSource("feng.MP3"));
    }
  }

  playWanNeng(){
    if(otherMusicOpen.getData()){
      _voiceAudioPlayer.play(AssetSource("wanneng.MP3"));
    }
  }

}
