import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/activity/home/home.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/activity/play1_10/play1_10.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/activity/web/web_activity.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';

class RoutersNameA{
  static final home="/a/home";
  static final play1_10="/a/play1_10";
  static final web="/a/web";
}

var aList=[
  GetPage(
    name: RoutersNameA.home,
    page: ()=> HomeActivity(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: RoutersNameA.play1_10,
    page: ()=> Play1_10Activity(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: RoutersNameA.web,
    page: ()=> WebActivity(),
    transition: Transition.fadeIn,
  ),
];