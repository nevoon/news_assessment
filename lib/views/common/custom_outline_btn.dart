import 'package:flutter/material.dart';
import 'package:news_assessment/views/common/reusable_text.dart';

import 'app_style.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn({super.key, this.width, this.height, required this.text, this.onTap, required this.textColor,this.color2, this.size});
  final double? width;
  final double? height ;
  final String text;
  final void Function()? onTap;
  final Color textColor;
  final Color? color2;
  final double? size;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,

        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(24),



        ),
        child: Center(
          child: ReusableText(text: text,
              style: appstyle(size??16, textColor, FontWeight.w500)),
        ),
      ),
    );
  }
}
