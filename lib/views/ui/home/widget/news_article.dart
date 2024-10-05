import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assessment/models/news_model.dart';
import 'package:news_assessment/views/common/height_spacer.dart';
import 'package:news_assessment/views/common/width_spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/app_constants.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({super.key, required this.article,});
  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.fromMillisecondsSinceEpoch(article.datetime*1000);
    return   GestureDetector(
      onTap: (){
        _launchURL(article.url);
      },
      child: SizedBox(
        height: 132.h,
        width: width,
        child: Padding(
          padding:   EdgeInsets.all(8.w),
          child:    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CachedNetworkImage(imageUrl: article.image,height: 100,width: 100,fit: BoxFit.fill,),
              const WidthSpacer(size: 8),
              SizedBox(
                width: 236.w,
                child:  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      const Expanded(child: SizedBox(height: 20,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(article.source.toUpperCase(),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.roboto(
                                  fontSize: 12,fontWeight: FontWeight.w400,color:Color(kTextDimWhite.value)
                              )),
                          Text("${dt.day} " " ${month[dt.month].toUpperCase()} " " ${dt.year}" ,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.roboto(
                                  fontSize: 12,fontWeight: FontWeight.w400,color:Color(kTextDimWhite.value)
                              )),
                        ],
                      ),
                      const HeightSpacer(size: 8),
                      Text(article.headline,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(textStyle: const TextStyle(height: 0),
                              fontSize: 20,fontWeight: FontWeight.w500,color:Color(kPureLight.value)
                          )),
                      const Expanded(child: SizedBox(height: 20,)),
                    ],
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),)) {
      throw Exception('Could not launch $url');
    }
  }
}
