import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer( {super.key, required this.size});

  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
    );
  }
}
