import 'package:coreflow/constant/color_constant.dart';
import 'package:coreflow/ui/bottom_bar/provider/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavBarProvider>(
      create: (context) => BottomNavBarProvider(),
      child: Consumer<BottomNavBarProvider>(
        builder: (context, provider, child) => Scaffold(
          backgroundColor: colorWhite,
          body: Center(child: provider.currentScreen),
          bottomNavigationBar: Stack(
            children: [
              BottomNavigationBar(
                iconSize: 30,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                elevation: 0,
                backgroundColor: navigationBarColor,
                currentIndex: provider.currentTab,
                selectedItemColor: textColor,
                unselectedItemColor: colorWhite,
                onTap: (int index) {
                  provider.currentTab = index;
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.event_repeat),
                    label: "To do",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
