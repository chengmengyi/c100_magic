import 'package:flutter_ad_ios_plugins/hep/ad_type.dart';

class AdUtils{
  static final AdUtils _utils=AdUtils();
  static AdUtils get instance => _utils;

  showAdAAAAAA({
    required AdType adType,
    required Function() closeAd,
}){
    closeAd.call();
  }
}