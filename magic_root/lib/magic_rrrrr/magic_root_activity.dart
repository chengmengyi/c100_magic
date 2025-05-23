import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_root/magic_rrrrr/macgic_root_controller.dart';

abstract class MagicRootActivity<K extends MagicRootController> extends StatelessWidget{
  late K magicRootController;
  var _firstLoad=true;


  @override
  Widget build(BuildContext context) {
    _checkFirstLoad();
    return _rootWidget();
  }

  Widget _rootWidget()=>Scaffold(
    body: Stack(
      children: [
        createActivityBgWidget(),
        SafeArea(
          top: true,
          bottom: false,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: createActivityContentWidget(),
          ),
        )
      ],
    ),
  );

  _checkFirstLoad(){
    if(_firstLoad){
      magicRootController=Get.put(createMagicRootController());
      _firstLoad=false;
    }
  }

  K createMagicRootController();

  Widget createActivityBgWidget();

  Widget createActivityContentWidget();
}