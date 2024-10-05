import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color,FontWeight fw){
  return GoogleFonts.roboto(fontWeight: fw, fontSize: size.sp, color: color);
}