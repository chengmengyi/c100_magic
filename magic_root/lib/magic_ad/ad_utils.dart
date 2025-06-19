import 'dart:convert';

import 'package:flutter_ad_ios_plugins/data/ad_info_data.dart';
import 'package:flutter_ad_ios_plugins/data/config_ad_data.dart';
import 'package:flutter_ad_ios_plugins/flutter_ios_ad_hep.dart';
import 'package:flutter_ad_ios_plugins/hep/ad_type.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_uuu/local_config.dart';

class AdUtils{
  static final AdUtils _utils=AdUtils();
  static AdUtils get instance => _utils;

  initMax(){
    try{
      var json = jsonDecode(localAdStrBase64.base64());
      var data = ConfigAdData(
        maxShowNum: json["wbpryjrf"],
        maxClickNum: json["gelxuwdg"],
        oneRewardList: _getAdList(json["vvslt_arv_one"]),
        oneInterList: [],
        twoRewardList: [],
        twoInterList: [],
      );
      FlutterIosAdHep.instance.initMax(maxKey: maxAdKeyBase64.base64(), data: data);
    }catch(e){
    }
  }

  showAdAAAAAA({
    required AdType adType,
    required Function() closeAd,
}){
    closeAd.call();
  }

  List<AdInfoData> _getAdList(List list){
    List<AdInfoData> resultList=[];
    for (var value in list) {
      resultList.add(
          AdInfoData(
            adId: value["idirgkyd"],
            adPlat: value["lurwymeq"],
            adType: value["ehpdicim"]=="reward"?AdType.reward:AdType.interstitial,
            expireTime: value["guxxklrg"],
            sort: value["lugbfdap"],
          )
      );
    }
    return resultList;
  }
}