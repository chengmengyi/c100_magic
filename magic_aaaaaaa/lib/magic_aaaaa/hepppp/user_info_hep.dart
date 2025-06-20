import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/routers_name_a.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';

class UserInfoHep{
  static final UserInfoHep _instance = UserInfoHep();
  static UserInfoHep get instance => _instance;

  updateCoinsNum(addNum){
    if(addNum is int){
      if(addNum==0){
        return;
      }
      aCoinsNum.saveData(aCoinsNum.getData()+addNum);
      MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.updateCoins,intValue: addNum);
      if(addNum>0){
        MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.showCoinsLottie);
      }
    }
  }

  int getCurrentLevelNum(){
    var level = aLevelNum.getData();
    return level-(level~/50)*50;
  }

  String updateLevel(){
    var currentLevel = aLevelNum.getData();
    int nextLevel = currentLevel + 1;
    int currentStage = (currentLevel - 1) ~/ 10;
    int nextStage = (nextLevel - 1) ~/ 10;
    aLevelNum.saveData(nextLevel);
    var isNextLevel=currentStage != nextStage;
    MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.updateLevel);
    if(isNextLevel){
      return _getRouterNameByLevel(nextLevel);
    }else{
      return "";
    }
  }

  String _getRouterNameByLevel(int nextLevel){
    var i = nextLevel%20;
    if(i<=10){
      return RoutersNameA.play1_10;
    }
    else if(i<=20){
      return RoutersNameA.play11_20;
    }
    return "";
  }
}