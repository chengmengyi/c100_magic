import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';

String getCardIcon({
  required String card,
  required String cardType,
  bool hasWanneng=false,
}){
  if(hasWanneng){
    return "wanneng_card";
  }
  try{
    var cardNum=cardValue[card]??1;
    switch(cardType){
      case "♠": return "heitao$cardNum";
      case "♥": return "hongtao$cardNum";
      case "♣": return "meihua$cardNum";
      case "♦": return "fangkuai$cardNum";
    }
    return "heitao$cardNum";
  }catch(e){
    return "heitaoA";
  }
}
