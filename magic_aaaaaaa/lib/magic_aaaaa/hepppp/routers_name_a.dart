import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/activity/home/home.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';

class RoutersNameA{
  static final home="/a/home";
}

var aList=[
  GetPage(
    name: RoutersNameA.home,
    page: ()=> HomeActivity(),
    transition: Transition.fadeIn,
  ),
];