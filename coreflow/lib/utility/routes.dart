import 'package:coreflow/ui/bottom_bar/tab_bar_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.tabBarSCreen, page: () => const TabBarScreen()),
  ];
}

abstract class Routes {
  static const splashcreen = '/splashScreen';
  static const homeScreen = '/homeScreen';
  static const tabBarSCreen = '/tabBarScreen';
  static const myDayScreen = '/myDayScreen';
}
