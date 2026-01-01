import 'package:coreflow/common_widget/app_text.dart';
import 'package:coreflow/constant/color_constant.dart';
import 'package:flutter/material.dart';

class PlaceHolderText extends StatelessWidget {
  const PlaceHolderText({super.key, required this.placeholderText});
  final String placeholderText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: placeholderText, //"Add your Todo list here ...",
        color: textColorPlaceholderAlpha05,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
