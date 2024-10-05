import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assessment/sevices/config.dart';
import 'package:news_assessment/views/ui/auth/login_page.dart';
import 'package:news_assessment/views/ui/home/home_page.dart';
import 'package:news_assessment/views/ui/intro/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/home_notifier.dart';
import 'controllers/intro_notifier.dart';
import 'controllers/login_notifier.dart';

Widget defaultHome = const HomePage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final loggedIn = prefs.getBool(Config.login)?? false;
  final setup = prefs.getBool(Config.setup)?? false;

  if(!loggedIn){
    defaultHome =  const LoginPage();
  }else if(!setup){
    defaultHome = const IntroPage();
  }

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LoginNotifier()),
            ChangeNotifierProvider(create: (context) => IntroNotifier()),
            ChangeNotifierProvider(create: (context) => HomeNotifier()),
  ],
  child: const MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: GoogleFonts.latoTextTheme(
                  Theme.of(context).textTheme
              ),
              fontFamily: GoogleFonts.lato().fontFamily
          ),
          home: defaultHome,

        );
      },
      // child: defaultHome,
    );
  }
}
