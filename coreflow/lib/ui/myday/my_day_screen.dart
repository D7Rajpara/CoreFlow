import 'package:coreflow/common_widget/app_text.dart';
import 'package:coreflow/common_widget/place_holder_text.dart';
import 'package:coreflow/constant/color_constant.dart';
import 'package:flutter/material.dart';

class MyDayScreen extends StatefulWidget {
  const MyDayScreen({super.key, required this.title});
  final String title;

  @override
  State<MyDayScreen> createState() => _MyDayScreenState();
}

class _MyDayScreenState extends State<MyDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationBarColor,
        title: AppText(
          text: widget.title,
          color: textColor,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actions: [],
      ),

      body: PlaceHolderText(placeholderText: "My Day Screen Coming Soon..."),
    );
  }
}
