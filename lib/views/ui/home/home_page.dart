import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assessment/constants/app_constants.dart';
import 'package:news_assessment/views/ui/home/widget/news_article.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/home_notifier.dart';
import '../../../models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

          return Consumer<HomeNotifier>(

              builder: (context,homeNotifier, child) {
                homeNotifier.getNews();
                homeNotifier.firstName();
                return Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                    systemOverlayStyle:   SystemUiOverlayStyle(
                    // Status bar color
                    statusBarColor: Color(kDarkBlue.value),

                    )
                  ),
                  backgroundColor: Color(kDark.value),
                  body: Stack(
                    children: [
                      Align(alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: width,
                          height: 181,
                          child: Container(
                            color: Color(kDarkBlue.value),
                          ),
                        ),),
                      SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                                child: Text("Hey ${homeNotifier.fName}",

                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 32,

                                      color: Color(kPureLight.value)
                                  ),),),
                              SizedBox(
                                  height: height * 0.851,
                                  child: FutureBuilder<List<NewsModel>>(
                                      future: homeNotifier.newsList,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              strokeAlign: CircularProgressIndicator.strokeAlignCenter,

                                            ),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              "Something went wrong. Please try again later.",
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible,
                                              style: GoogleFonts.rubik(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(kPureLight.value)
                                              ));
                                        } else if (snapshot.data!.isEmpty) {
                                          return const Text("No Current news");
                                        } else {
                                          final news = snapshot.data;
                                          return
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: news!.length,
                                                itemBuilder: (context, index) {
                                                  var article = news[index];
                                                  return NewsArticle(
                                                    article: article,);
                                                });
                                        }
                                      }))

                            ],
                          ))
                    ],
                  ),
                );
              });


  }
}
