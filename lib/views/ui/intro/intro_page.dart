import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assessment/controllers/intro_notifier.dart';
import 'package:news_assessment/views/ui/auth/login_page.dart';
import 'package:news_assessment/views/ui/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/app_constants.dart';
import '../../../sevices/config.dart';
import '../../common/app_style.dart';
import '../../common/custom_outline_btn.dart';
import '../../common/height_spacer.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  final String firstHead = "Get the most out of Blott ✅";
  final String noticeHead = "Get the most out of Spot";

  final String firstBody = "Allow notifications to stay in the loop with your payments, requests and groups.";
  final String noticeBody = "You can allow notifications to get alerts about "
      "your account and updates on your spending, helping you keep track "
      "of your money";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroNotifier>(builder: (context, introNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:   SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: introNotifier.notice?Color(kLightGrey.value):Color(kLight.value),

          )
      ),
        backgroundColor: Color(kLight.value),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Expanded(child: HeightSpacer(size: 10),),
                SvgPicture.asset(
                  'assets/svg/message.svg', width: 98, height: 98,),
                Text(
                    introNotifier.notice ? widget.noticeHead : widget.firstHead,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: appstyle(
                        24, Color(kTextDark.value), FontWeight.w700)),
                Text(
                    introNotifier.notice ? widget.noticeBody : widget.firstBody,
                    textAlign: TextAlign.center,

                    overflow: TextOverflow.visible,
                    style: appstyle(
                        16, Color(kTextDark.value), FontWeight.w400)),
                const Expanded(child: HeightSpacer(size: 10),),
                CustomOutlineBtn(text: "Continue",
                  onTap: () async {
                    introNotifier.setNotice = true;
                    openDialog();
                  },
                  height: height * 0.055,
                  width: width * 0.9,

                  color2: Color(kIconValid.value),
                  textColor: Color(kIconLight.value),
                ),

              ],
            ),

          ),),
      );
    });
  }

  Future openDialog() =>
      showDialog(barrierDismissible: false, context: context, builder: (context) {

        return SizedBox(

          width: width,
          height: height,
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                      child: GestureDetector(
                          onTap: () { Get.to(const LoginPage());
                          },
                          child:const Icon(CupertinoIcons.arrow_left, size: 24,)),
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 10,)),
                  Dialog(
                      backgroundColor: Color(kDialogColor.value),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),

                      ),
                      child: SizedBox(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const HeightSpacer(size: 25),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 14
                                .w),
                                child: Column(
                                  children: [
                                    Text(
                                        "“Blott” Would Like to Send You Notifications",
                                        textAlign: TextAlign.center,
                                        style: appstyle(17, Color(kDark.value),
                                            FontWeight.w600)
                                    ),
                                    Text(
                                        "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.",
                                        textAlign: TextAlign.center,
                                        style: appstyle(13, Color(kDark.value),
                                            FontWeight.w400)
                                    ),
                                  ],
                                )
                            ),
                            const HeightSpacer(size: 25),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(kDialogDivider.value),

                            ),
                            SizedBox(
                              height: 44,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 11, horizontal: 16),
                                        child: GestureDetector(
                                          onTap: () async{
                                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                                            prefs.setBool(Config.setup, true);
                                            Get.offAll(const HomePage());
                                          },
                                          child: Text("Don't Allow",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      letterSpacing: -0.41),
                                                  fontSize: 17,
                                                  color: Color(
                                                      kDialogAction.value),
                                                  fontWeight: FontWeight.w400)

                                          ),
                                        ),)
                                  ),

                                  VerticalDivider(

                                    thickness: 1,
                                    color: Color(kDialogDivider.value),

                                  ),
                                  Expanded(child:
                                  GestureDetector(
                                    onTap: () async{
                                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setBool(Config.setup, true);
                                      Get.offAll(const HomePage());
                                    },
                                    child: Text("Allow",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                letterSpacing: -0.41),
                                            fontSize: 17,
                                            color: Color(kDialogAction.value),
                                            fontWeight: FontWeight.w600)

                                    ),
                                  )
                                  ),
                                ],
                              ),
                            )
                            ,

                          ],
                        ),
                      )

                  ),
                  const Expanded(child: SizedBox(height: 10,)),
                ],
              )),
        );
      });


}
