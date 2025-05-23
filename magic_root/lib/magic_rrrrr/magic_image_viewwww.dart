import 'package:flutter/material.dart';

class MagicImageViewwwww extends StatelessWidget{
  String name;
  double? width;
  double? height;
  MagicImageViewwwww({
    required this.name,
    this.width,
    this.height,
});

  @override
  Widget build(BuildContext context) => Image.asset(
    "magic_assets/webp/$name.webp",
    width: width,
    height: height,
    fit: BoxFit.fill,
  );
}