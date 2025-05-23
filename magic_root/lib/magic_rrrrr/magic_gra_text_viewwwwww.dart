import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/magic_text_viewwww.dart';

class MagicGraTextViewwwwww extends StatelessWidget{
  String text;
  double size;
  List<Color> colors;
  FontWeight? fontWeight;
  AlignmentGeometry? begin;
  AlignmentGeometry? end;
  String? shadowsColor;
  TextAlign? textAlign;
  TextOverflow? overflow;
  bool showFontFamily;

  MagicGraTextViewwwwww({
    required this.text,
    required this.size,
    required this.colors,
    this.fontWeight,
    this.begin,
    this.end,
    this.shadowsColor,
    this.textAlign,
    this.overflow,
    this.showFontFamily=true,
  });


  @override
  Widget build(BuildContext context) => ShaderMask(
    shaderCallback: (rect) {
      return LinearGradient(
        begin: begin??Alignment.topCenter,
        end: end??Alignment.bottomCenter,
        colors: colors,
      ).createShader(rect);
    },
    child: MagicTextViewwwww(
      text: text,
      size: size,
      color: "#FFFFFF",
      fontWeight: fontWeight,
      shadowsColor: shadowsColor,
      overflow: overflow,
      showFontFamily: showFontFamily,
    ),
  );
}