import 'package:flutter/material.dart';

class CardBean{
  int index;
  String cardNum;
  bool isTop;
  bool isCovered;
  bool show;
  GlobalKey globalKey;

  CardBean({
    required this.index,
    required this.cardNum,
    required this.isTop,
    required this.isCovered,
    required this.show,
    required this.globalKey,
  });

  @override
  String toString() {
    return 'CardBean{index: $index, cardNum: $cardNum, isTop: $isTop, isCovered: $isCovered}';
  }
}