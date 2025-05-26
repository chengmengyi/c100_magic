import 'dart:math';
import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/bean/card_bean.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/user_info_hep.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';


//         // Transform.rotate(
//         //   angle: pi/4,
//         //   alignment: Alignment.topRight,
//         //   child: SizedBox(
//         //     key: magicRootController.list.first.first,
//         //     child: Container(
//         //       width: 49.w,
//         //       height: 73.h,
//         //       color: Colors.blue,
//         //     ),
//         //   ),
//         // ),


final List<String> cardFaces = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];
final List<String> cardTypeList = ['♠', '♥', '♣', '♦'];

final Map<String, int> cardValue = {
  'A': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '10': 10,
  'J': 11,
  'Q': 12,
  'K': 13,
};

class PlayHep{
  final List<List<CardBean>> cardList=[];

  //当前指示牌
  String currentPointCard="";
  var canClick=false;

  setCardList({
    required List<List<CardBean>> list,
    required Function() checkCoverCall,
  }){
    cardList.clear();
    cardList.addAll(list);
    _initTopCardNums();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkAllCoveredWidgetsAccurate();
      checkCoverCall.call();
      List<int> topIndexList = cardList
          .expand((row) => row)
          .where((card) => card.isTop)
          .map((card) => card.index)
          .toList();
      MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.startFlipAnimator,dynamicValue: topIndexList);
      _setPointCard();
    });
  }

  clickCardItem(CardBean bean){
    if(!canClick||bean.isCovered||bean.cardNum.isEmpty){
      return;
    }
    var twoCardsDiff1 = _checkTwoCardsDiff1(currentPointCard,bean.cardNum);
    if(!twoCardsDiff1){
      return;
    }

  }

  bool _checkTwoCardsDiff1(String card1, String card2){
    final valueMap = {
      'A': [1, 14],
      '2': [2],
      '3': [3],
      '4': [4],
      '5': [5],
      '6': [6],
      '7': [7],
      '8': [8],
      '9': [9],
      '10': [10],
      'J': [11],
      'Q': [12],
      'K': [13],
    };
    final values1 = valueMap[card1] ?? [];
    final values2 = valueMap[card2] ?? [];

    for (var v1 in values1) {
      for (var v2 in values2) {
        if ((v1 - v2).abs() == 1) return true;
      }
    }
    return false;
  }

  //设置指示牌
  _setPointCard(){
    final noCoveredList = cardList.expand((row) => row).where((c) => !c.isCovered&&c.show&&c.cardNum.isNotEmpty).toList();
    if(noCoveredList.isEmpty){
      return;
    }
    final random = Random();

    // 1. 随机选一个对象
    final selected = noCoveredList[random.nextInt(noCoveredList.length)];
    final base = selected.cardNum;
    final baseVal = cardValue[base]!;
    final baseVals = base == 'A' ? [1, 14] : [baseVal];

    final Set<int> allValues = {...List.generate(13, (i) => i + 1), 14}; // 1~13 + 14
    Set<int> targetValues = {};

    if (_getHandCardProbability()) {
      // 满足条件：取与 baseVal ±1 的牌
      for (var val in baseVals) {
        if (val > 1) targetValues.add(val - 1);
        if (val < 14) targetValues.add(val + 1);
      }
    } else {
      // 不满足条件：取非 ±1 的牌
      final skip = <int>{};
      for (var val in baseVals) {
        skip.add(val - 1);
        skip.add(val + 1);
      }
      targetValues = allValues.difference(skip);
    }

    final chosen = targetValues.toList()[random.nextInt(targetValues.length)];
    currentPointCard = valueToCardNum(chosen);
    MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.updatePointCard,);
  }

  _initTopCardNums() {
    final topCards = cardList.expand((row) => row).where((c) => c.isTop).toList();
    if (topCards.isEmpty) return;

    final Random _rand = Random();
    // 第一个：完全随机
    topCards[0].cardNum = cardFaces[_rand.nextInt(cardFaces.length)];
    for (int i = 1; i < topCards.length; i++) {
      final prev = topCards[i - 1];
      final curr = topCards[i];

      final prevVal = cardValue[prev.cardNum]!;
      List<int> candidates;

      // 支持 A = 1 或 14
      final prevVals = prev.cardNum == 'A' ? [1, 14] : [prevVal];

      if (_getTopProbability()) {
        // 只取与前一个相差1的值
        candidates = [];

        for (int val in prevVals) {
          if (val > 1) candidates.add(val - 1);
          if (val < 13) candidates.add(val + 1);
          if (val == 13) candidates.add(14); // K → A (14)
          if (val == 2) candidates.add(1);   // 2 → A (1)
        }
      } else {
        // 取所有非 ±1 的值
        candidates = List.generate(13, (i) => i + 1); // 1~13

        for (int val in prevVals) {
          candidates.remove(val - 1);
          candidates.remove(val + 1);
        }

        // 如果 prev 是 K (13)，也移除 A(14)
        if (prevVals.contains(13)) candidates.remove(14);
        // 如果 prev 是 2(2)，也移除 A(1)
        if (prevVals.contains(2)) candidates.remove(1);
      }

      // 去除无效项
      candidates = candidates.toSet().where((v) => v >= 1 && v <= 14).toList();
      final chosenVal = candidates[_rand.nextInt(candidates.length)];
      curr.cardNum = valueToCardNum(chosenVal);
    }
  }

  String valueToCardNum(int val) {
    if (val == 1 || val == 14) return 'A';
    return cardValue.entries.firstWhere((e) => e.value == val).key;
  }

  _checkAllCoveredWidgetsAccurate() {
    final allKeys = cardList.expand((row) => row).toList();
    for (int i = 0; i < cardList.length; i++) {
      for (int j = 0; j < cardList[i].length; j++) {
        var bean = cardList[i][j];
        final key = bean.globalKey;
        final isCovered = _isCoveredByHigherWidgetsAccurate(
          targetKey: key,
          keysInZOrder: allKeys,
        );

        bean.isCovered=isCovered;
        if(bean.isTop){

        }
      }
    }
  }

  List<Offset> _getTransformedCorners(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return [];

    final renderBox = context.findRenderObject() as RenderBox;
    if (!renderBox.hasSize || !renderBox.attached) return [];

    final size = renderBox.size;
    final transform = renderBox.getTransformTo(null);

    final points = [
      Offset.zero,
      Offset(size.width, 0),
      Offset(size.width, size.height),
      Offset(0, size.height),
    ];

    return points.map((p) => MatrixUtils.transformPoint(transform, p)).toList();
  }

  Rect _boundingRect(List<Offset> points) {
    final left = points.map((e) => e.dx).reduce(min);
    final right = points.map((e) => e.dx).reduce(max);
    final top = points.map((e) => e.dy).reduce(min);
    final bottom = points.map((e) => e.dy).reduce(max);
    return Rect.fromLTRB(left, top, right, bottom);
  }

  bool _isCoveredByHigherWidgetsAccurate({
    required GlobalKey targetKey,
    required List<CardBean> keysInZOrder,
  }) {
    final selfCorners = _getTransformedCorners(targetKey);
    if (selfCorners.isEmpty) return false;

    final selfRect = _boundingRect(selfCorners);
    final myIndex = keysInZOrder.indexWhere((value)=>value.globalKey==targetKey);
    if (myIndex == -1) return false;

    for (int i = myIndex + 1; i < keysInZOrder.length; i++) {
      final otherCorners = _getTransformedCorners(keysInZOrder[i].globalKey);
      if (otherCorners.isEmpty) continue;

      final otherRect = _boundingRect(otherCorners);
      if (selfRect.overlaps(otherRect)) {
        return true;
      }
    }
    return false;
  }

  //获取顶部卡牌的概率
  bool _getTopProbability(){
    var currentLevelNum = UserInfoHep.instance.getCurrentLevelNum();
    if(currentLevelNum<=10){
      return Random().nextInt(100)<70;
    }else if(currentLevelNum<=20){
      return Random().nextInt(100)<65;
    }else if(currentLevelNum<=30){
      return Random().nextInt(100)<55;
    }else if(currentLevelNum<=40){
      return Random().nextInt(100)<40;
    }else if(currentLevelNum<=50){
      return Random().nextInt(100)<30;
    }
    return Random().nextInt(100)<30;
  }

  //获取手牌的概率
  bool _getHandCardProbability(){
    var currentLevelNum = UserInfoHep.instance.getCurrentLevelNum();
    if(currentLevelNum<=10){
      return Random().nextInt(100)<70;
    }else if(currentLevelNum<=20){
      return Random().nextInt(100)<60;
    }else if(currentLevelNum<=30){
      return Random().nextInt(100)<50;
    }else if(currentLevelNum<=40){
      return Random().nextInt(100)<40;
    }else if(currentLevelNum<=50){
      return Random().nextInt(100)<30;
    }
    return Random().nextInt(100)<30;
  }
}