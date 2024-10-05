import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assessment/sevices/config.dart';
import 'package:news_assessment/views/ui/intro/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_constants.dart';
import '../../../controllers/login_notifier.dart';
import '../../common/custom_text_field.dart';
import '../../common/height_spacer.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();


  @override
  void dispose() {
    fName.dispose();
    lName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      return Scaffold(
          appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: Color(kGlassLight.value),

          ),
          backgroundColor: Color(kGlassLight.value),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            child: Column(

              children: [
                const HeightSpacer(size: 40),

                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Your legal names",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: GoogleFonts.roboto(fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(kTextDark.value)),
                    )),

                HeightSpacer(size: 16.h),
                Text(
                  "We need to know a bit about you so that we can create your account.",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.roboto(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(kLightGrey.value)),
                ),
                HeightSpacer(size: 24.h),
                Form(
                    key: loginNotifier.loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: fName,
                          hintText: "First name",
                          onChanged: (firstName) {
                            if (firstName!.isNotEmpty) {
                              loginNotifier.setFirstName = true;
                            } else {
                              loginNotifier.setFirstName = false;
                            }
                          },
                          keyboardType: TextInputType.name,
                          validator: (firstName) {
                            if (firstName!.isEmpty) {
                              return "Please enter a valid First name";
                            }

                            return null;
                          },
                        ),
                        HeightSpacer(size: 16.h),
                        CustomTextField(
                          controller: lName,
                          hintText: "Last name",
                          onChanged: (lastName) {
                            if (lastName!.isNotEmpty) {
                              loginNotifier.setLastName = true;
                            } else {
                              loginNotifier.setLastName = false;
                            }
                          },

                          keyboardType: TextInputType.name,
                          validator: (lastName) {
                            if (lastName!.isEmpty) {
                              return "Please enter a valid Last name";
                            }

                            return null;
                          },
                        ),

                      ],
                    )),

                const Expanded(child: HeightSpacer(size: 10),),


                Align(alignment: Alignment.bottomRight,
                  child: GestureDetector(
                      onTap: () async {
                        if(loginNotifier.firstName && loginNotifier.lastName){
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString(Config.firstName, fName.value.text);
                          prefs.setString(Config.lastName, fName.value.text);
                          prefs.setBool(Config.login, true);
                          Get.to(const IntroPage());
                        }
                      },
                      child: Padding(padding: EdgeInsets.only(bottom: 14.h),
                      child: CircleAvatar(
                        foregroundColor: loginNotifier.firstName == true &&
                            loginNotifier.lastName == true
                            ? Color(kIconValid.value) : Color(kIconInvalid.value),
                        backgroundColor: loginNotifier.firstName == true &&
                            loginNotifier.lastName == true
                            ? Color(kIconValid.value) : Color(kIconInvalid.value),
                        radius: 28,
                        child: Icon(CupertinoIcons.right_chevron,
                            color: Color(kIconLight.value)),
                      )),)),


              ],
            ),));
    });
  }





}


