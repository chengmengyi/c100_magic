import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_ad_ios_plugins/data/ad_info_data.dart';
import 'package:flutter_ad_ios_plugins/data/config_ad_data.dart';
import 'package:flutter_ad_ios_plugins/flutter_ios_ad_hep.dart';
import 'package:flutter_ad_ios_plugins/hep/ad_type.dart';
import 'package:flutter_ad_ios_plugins/hep/ios_ad_callback.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_uuu/local_config.dart';
import 'package:magic_root/magic_uuu/music_utils.dart';

class AdUtils{
  static final AdUtils _utils=AdUtils();
  static AdUtils get instance => _utils;

  initMax(){
    try{
      var json = jsonDecode(localAdStrBase64.base64());
      var data = ConfigAdData(
        maxShowNum: json["tgfthzsm"],
        maxClickNum: json["occixuyh"],
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
    // if(kDebugMode){
    //   closeAd.call();
    //   return;
    // }
    var resultData = FlutterIosAdHep.instance.getCacheResultData(adType);
    if(null==resultData){
      showToast("Advertisement display failed, please try again later");
      FlutterIosAdHep.instance.loadAd(adType);
      return;
    }
    FlutterIosAdHep.instance.showAd(
      adType: adType,
      iosAdCallback: IosAdCallback(
        showSuccess: (ad,info){
          MusicUtils.instance.pauseMusic();
        },
        showFail: (ad){
          showToast("Advertisement display failed, please try again later");
        },
        closeAd: (){
          MusicUtils.instance.playMusic();
          closeAd.call();
        },
        onAdRevenuePaidCallback: (ad,info){

        },
      ),
    );
  }

  List<AdInfoData> _getAdList(List list){
    List<AdInfoData> resultList=[];
    for (var value in list) {
      resultList.add(
          AdInfoData(
            adId: value["ewoekbla"],
            adPlat: value["nlmtyzvb"],
            adType: value["vypidicb"]=="reward"?AdType.reward:AdType.interstitial,
            expireTime: value["ahfrrche"],
            sort: value["mknotvfz"],
          )
      );
    }
    return resultList;
  }
}