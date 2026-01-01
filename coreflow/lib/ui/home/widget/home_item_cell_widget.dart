import 'package:coreflow/common_widget/app_text.dart';
import 'package:coreflow/constant/color_constant.dart';
import 'package:flutter/material.dart';

class HomeItemCellWidget extends StatelessWidget {
  final String name;

  const HomeItemCellWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: AppText(
          text: name,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
