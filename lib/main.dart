import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magic_aaaaaaa/magic_aaaaa/hepppp/routers_name_a.dart';
import 'package:magic_peak_solitaire/launchhhh/launch_activity.dart';
import 'package:magic_root/magic_rrrrr/magic_hepppp.dart';
import 'package:magic_root/magic_rrrrr/magic_routers_name.dart';
import 'package:magic_root/magic_rrrrr/webbbb/web_activity.dart';

void main() async{
  await _setPreferredOrientations();
  await _init();
  runApp(const MyApp());
}

_setPreferredOrientations()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
      )
  );
}

_init()async{
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var launchRouterName="/launch";
    return ScreenUtilInit(
      designSize: const Size(375, 814),
      builder: (c,child)=>_getMaterialApp(launchRouterName),
    );
  }

  GetMaterialApp _getMaterialApp(String launchRouterName)=>GetMaterialApp(
    title: 'Magic Peak Solitaire',
    enableLog: true,
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    initialRoute: launchRouterName,
    debugShowCheckedModeBanner: false,
    getPages: _getActivityList(launchRouterName),
    defaultTransition: Transition.rightToLeft,
    builder: (context,widget){
      return  MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: widget!,
      );
    },
  );

  List<GetPage> _getActivityList(String launchRouterName){
    var mainList=[
      GetPage(
        name: launchRouterName,
        page: ()=> LaunchActivity(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: MagicRoutersName.web,
        page: ()=> WebActivity(),
        transition: Transition.fadeIn,
      ),
    ];
    return mainList+aList;
  }
}

