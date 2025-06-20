import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MagicLottieWidget extends StatelessWidget{
  String name;
  double? width;
  double? height;
  AnimationController? controller;
  MagicLottieWidget({
    required this.name,
    this.width,
    this.height,
    this.controller,
});

  @override
  Widget build(BuildContext context) => Lottie.asset("magic_assets/lottie/$name.zip",width: width,height:height,controller: controller);
}