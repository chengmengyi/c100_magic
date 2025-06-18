import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';

abstract class MagicRootDialog<K extends MagicRootController> extends StatelessWidget{
  late K magicRootController;
  var _firstLoad=true;


  @override
  Widget build(BuildContext context) {
    _checkFirstLoad(context);
    return WillPopScope(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: createActivityContentWidget(),
        ),
      ),
      onWillPop: ()async{
        return false;
      },
    );
  }

  _checkFirstLoad(BuildContext context){
    if(_firstLoad){
      magicRootController=Get.put(createMagicRootController());
      magicRootController.context=context;
      _firstLoad=false;
    }
  }

  K createMagicRootController();

  Widget createActivityContentWidget();
}