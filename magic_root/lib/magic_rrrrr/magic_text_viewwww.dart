import 'package:flutter/material.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:outlined_text/outlined_text.dart';

class MagicTextViewwwww extends StatelessWidget{
  String text;
  double size;
  String color;
  FontWeight? fontWeight;
  String? shadowsColor;
  TextAlign? textAlign;
  TextOverflow? overflow;
  bool showFontFamily;
  TextDecoration? decoration;
  Color? decorationColor;

  MagicTextViewwwww({
    required this.text,
    required this.size,
    required this.color,
    this.shadowsColor,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.showFontFamily=true,
    this.decoration,
    this.decorationColor,
  });


  @override
  Widget build(BuildContext context) {
    return OutlinedText(
      text: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color.toColor(),
          fontWeight: fontWeight,
          fontFamily: showFontFamily==true?"baloo":null,
          overflow: overflow,
          decoration: decoration,
          decorationColor: decorationColor,
        ),
        textAlign: textAlign,
      ),
      strokes: shadowsColor==null?
      []:
      [
        OutlinedTextStroke(
            color: (shadowsColor??"#FFFFFF").toColor(),
            width: 2.w,
        ),
      ],
    ).paddingOnly(top: showFontFamily==true?5.h:0);
  }
}