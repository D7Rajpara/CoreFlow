import 'package:coreflow/ui/home/home_screen.dart';
import 'package:coreflow/ui/myday/my_day_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> _screens = [
    const MyHomePage(title: "Shopping List"),
    const MyDayScreen(title: "My Day"),
  ];

  set currentTab(int tab) {
    _currentTab = tab;
    notifyListeners();
  }

  int get currentTab => _currentTab;
  Widget get currentScreen => _screens.elementAt(_currentTab);
}
