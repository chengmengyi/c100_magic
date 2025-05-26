import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/storage_a.dart';

class UserInfoHep{
  static final UserInfoHep _instance = UserInfoHep();
  static UserInfoHep get instance => _instance;

  int getCurrentLevelNum(){
    var level = aLevelNum.getData();
    return level-(level~/50)*50;
  }
}