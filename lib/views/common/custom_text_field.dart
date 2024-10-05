import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import 'app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.hintText, required this.keyboardType, this.validator, this.suffixIcon, this.obscureText, this.focusNode, this.onEditComplete, this.submitted, this.onChanged});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final void Function()? onEditComplete;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FocusNode? focusNode;
  final  Function(String?)? submitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLines: 1,
        focusNode: focusNode,
        cursorColor: Color(kDark.value),
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText??false,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: appstyle(20, Color(kHintText.value), FontWeight.w400),

        ),
        controller: controller,
        onFieldSubmitted: submitted,
        cursorHeight: 28,
        cursorWidth: 4,
        style: appstyle(20, Color(kTextDark.value), FontWeight.w400),
        validator: validator,
        autofocus: true,
        onEditingComplete: onEditComplete,
      ),
    );
  }
}
