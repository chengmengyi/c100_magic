import 'package:flutter/material.dart';
import 'package:magic_aaaaaaa/bean/card_bean.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/play_hep.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/card_item_viewwww.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/uiiiii/viewwww/play_base_widget.dart';
import 'package:magic_root/magic_rrrrr/click_widget.dart';
import 'package:magic_root/magic_rrrrr/event_busssssss.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_image_viewwww.dart';
import 'package:magic_root/magic_rrrrr/magic_root_activity.dart';
import 'package:magic_root/magic_uuu/music_utils.dart';

class Play11_20Activity extends MagicRootActivity<Play11_20Controller>{
  @override
  Widget createActivityBgWidget() => MagicImageViewwwww(name: "play_bg",width: double.infinity,height: double.infinity,);

  @override
  Play11_20Controller createMagicRootController() => Play11_20Controller();

  @override
  Widget createActivityContentWidget() => PlayBaseWidget(
    playHep: magicRootController.playHep,
    child: _listWidget(),
  );

  _listWidget()=> GetBuilder<Play11_20Controller>(
    id: "list",
    builder: (_){
      if(magicRootController.playHep.cardList.isEmpty){
        return Container();
      }
      var list = magicRootController.playHep.cardList;
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.first[0]),
                  _cardItemWidget(list.first[1]).marginOnly(left: 87.w),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.first[2]),
                  _cardItemWidget(list.first[3]).marginOnly(left: 87.w),
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
                  _cardItemWidget(list[1][0]),
                  _cardItemWidget(list[1][1]).marginOnly(left: 26.w),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list[1][2]),
                  _cardItemWidget(list[1][3]).marginOnly(left: 26.w),
                ],
              ),
            ],
          ).marginOnly(top: 47.h),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _cardItemWidget(list.last[0]),
              SizedBox(height: 116.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cardItemWidget(list.last[1]),
                  _cardItemWidget(list.last[2]).marginOnly(left: 87.w),
                ],
              )
            ],
          ),
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
}

class Play11_20Controller extends MagicRootController {
  PlayHep playHep = PlayHep();

  @override
  void onReady() {
    super.onReady();
    _initList();
  }

  _initList() async{
    List<List<CardBean>> cardList = [];
    var index = 0;
    while (cardList.length < 3) {
      if (cardList.isEmpty) {
        List<CardBean> list = [];
        while (list.length < 4) {
          list.add(CardBean(index: index,
              cardNum: "",
              globalKey: GlobalKey(),
              isTop: false,
              isCovered: true,
              show: false,
              cardType: cardTypeList.random()));
          index++;
        }
        cardList.add(list);
      } else if (cardList.length == 1) {
        List<CardBean> list = [];
        while (list.length < 4) {
          list.add(CardBean(index: index,
              cardNum: "",
              globalKey: GlobalKey(),
              isTop: true,
              isCovered: true,
              show: false,
              cardType: cardTypeList.random()));
          index++;
        }
        cardList.add(list);
      }else if (cardList.length == 2) {
        List<CardBean> list = [];
        while (list.length < 3) {
          list.add(CardBean(index: index,
              cardNum: "",
              globalKey: GlobalKey(),
              isTop: true,
              isCovered: true,
              show: false,
              cardType: cardTypeList.random()));
          index++;
        }
        cardList.add(list);
      }
    }

    // MusicUtils.instance.playFapai();
    playHep.setCardList(list: cardList);
    for(var index=0;index<6;index++){
      if(closePage){
        break;
      }
      switch(index){
        case 0:
          _setShow(0, 0, 2);
          break;
        case 1:
          _setShow(0, 2, 4);
          break;
        case 2:
          _setShow(1, 0, 2);
          break;
        case 3:
          _setShow(1, 2, 4);
          break;
        case 4:
          _setShow(2, 0, 1);
          break;
        case 5:
          _setShow(2, 1, 3);
          break;
      }
      update(["list"]);
      await Future.delayed(Duration(milliseconds: 200));
    }
    playHep.initCardLocation(
      checkCoverCall: (){
        update(["list"]);
        MagicEventttttt(eventCodeeeeee: MagicCodeAAAAA.startInitHandCards);
      }
    );
  }

  _setShow(int listIndex,int startIndex,int endIndex){
    var list = playHep.cardList[listIndex];
    for(int i=startIndex;i<endIndex;i++){
      list[i].show=true;
    }
  }

  clickItem(CardBean bean) {
    playHep.clickCardItem(
      bean: bean,
      refreshList: () {
        update(["list"]);
      },
      resetPlay: () {
        _initList();
      },
    );
  }

  @override
  bool loadMagicEventtttt() => true;

  @override
  handleMagicEventtttttt(MagicEventttttt tttt) {
    switch (tttt.eventCodeeeeee) {
      case MagicCodeAAAAA.startLongjuanfengAnimator:
        playHep.useLongJuanFeng(
          refreshList: (){
            update(["list"]);
          },
          resetPlay: () {
            _initList();
          },
        );
        break;
    }
  }
}