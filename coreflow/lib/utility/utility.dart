import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double manageBottomBarheight(double size) {
  final data = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  );
  final screenHeight = data.size.height;
  if (screenHeight < 800) {
    return size - 40;
  } else {
    return size;
  }
}
