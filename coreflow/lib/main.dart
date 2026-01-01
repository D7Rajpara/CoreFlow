import 'package:coreflow/common_widget/list_view/provider/app_list_view_provider.dart';
import 'package:coreflow/constant/color_constant.dart';
import 'package:coreflow/ui/home/provider/home_provider.dart';
import 'package:coreflow/ui/myday/provider/my_day_provider.dart';
import 'package:coreflow/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyDayProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AppListItemProvider()),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: navigationBarColor,
          textSelectionTheme: TextSelectionThemeData(cursorColor: textColor),
        ),
        debugShowCheckedModeBanner: false,
        enableLog: false,
        navigatorKey: Get.key,
        initialRoute: Routes.tabBarSCreen,
        getPages: AppPages.routes,
        scaffoldMessengerKey: messengerKey,
      ),
    );
  }
}
