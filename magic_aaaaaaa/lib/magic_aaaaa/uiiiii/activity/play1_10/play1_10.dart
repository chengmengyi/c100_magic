import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/bean/card_bean.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/card_item_viewwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/coins_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_bottom_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_level_viewwwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/set_viewwww.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_activity.dart';

class Play1_10Activity extends MagicRootActivity<Play1_10Controller>{
  @override
  Widget createActivityBgWidget() => MagicImageViewwwww(name: "play_bg",width: double.infinity,height: double.infinity,);

  @override
  Play1_10Controller createMagicRootController() => Play1_10Controller();

  @override
  Widget createActivityContentWidget() => Column(
    children: [
      _topWidget(),
      Expanded(
        child: Center(
          child: _listWidget(),
        ),
      ),
      PlayBottomViewwwww(playHep: magicRootController.playHep,),
    ],
  );

  _listWidget()=> GetBuilder<Play1_10Controller>(
    id: "list",
    builder: (_){
      if(magicRootController.playHep.cardList.isEmpty){
        return Container();
      }
      var list = magicRootController.playHep.cardList;
      return Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.first[0]),
                  _cardItemWidget(list.first[1]).marginOnly(left: 7.w),
                  _cardItemWidget(list.first[2]).marginOnly(left: 27.w),
                  _cardItemWidget(list.first[3]).marginOnly(left: 7.w),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.first[4]),
                  _cardItemWidget(list.first[5]).marginOnly(left: 7.w),
                  _cardItemWidget(list.first[6]).marginOnly(left: 27.w),
                  _cardItemWidget(list.first[7]).marginOnly(left: 7.w),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.first[8]),
                  _cardItemWidget(list.first[9]).marginOnly(left: 27.w),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.last[0]),
                  _cardItemWidget(list.last[1]).marginOnly(left: 84.w),
                ],
              ),
              SizedBox(height: 12.h,),
              _cardItemWidget(list.last[2]),
            ],
          )
        ],
      );
    },
  );

  Widget _cardItemWidget(CardBean bean)=>ClickWidget(
    onTap: (){
      magicRootController.clickItem(bean);
    },
    child: SizedBox(
      key: bean.globalKey,
      child: CardItemViewwww(cardBean: bean,),
    ),
  );

  _topWidget()=>Stack(
    children: [
      PlayLevelViewwwww().marginOnly(top: 10.h),
      Row(
        children: [
          SizedBox(width: 16.w,),
          CoinsViewwww(),
          Spacer(),
          SetViewww(),
          SizedBox(width: 16.w,),
        ],
      )
    ],
  );
}

class Play1_10Controller extends MagicRootController{
  PlayHep playHep=PlayHep();

  @override
  void onReady() {
    super.onReady();
    _initList();
  }

  _initList(){
    List<List<CardBean>> cardList=[];
    var index=0;
    while(cardList.length<2){
      if(cardList.isEmpty){
        List<CardBean> list=[];
        while(list.length<10){
          list.add(CardBean(index: index, cardNum: "", globalKey: GlobalKey(),isTop: false,isCovered: true,show: true));
          index++;
        }
        cardList.add(list);
      }else if(cardList.length==1){
        List<CardBean> list=[];
        while(list.length<3){
          list.add(CardBean(index: index, cardNum: "", globalKey: GlobalKey(),isTop: true,isCovered: true,show: true));
          index++;
        }
        cardList.add(list);
      }
    }
    playHep.setCardList(
      list: cardList,
      checkCoverCall: (){
        update(["list"]);
      }
    );
    update(["list"]);
  }

  clickItem(CardBean bean){
    playHep.clickCardItem(bean);
  }
}