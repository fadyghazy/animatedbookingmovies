import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_booking_animated/control/API/getpopulardata.dart';
import '../../../../../constant.dart';
import '../../../../../control/API/getTopRate.dart';
import '../../../../constant/image_constant.dart';
import '../../../../constant/strings.dart';
import '../../../details/presentation/view/detail_screen.dart';

class BookingHomeScreen extends StatefulWidget {
  const BookingHomeScreen({Key? key}) : super(key: key);

  @override
  State<BookingHomeScreen> createState() => _BookingHomeScreenState();
}

class _BookingHomeScreenState extends State<BookingHomeScreen> {
  int current_index = 0;
  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  int index = 0;

  /// =================== Slider Image List ===================
 // final List<String> imageList = [AssetsData.avatarPoster, AssetsData.blackPantherPoster,AssetsData. varisuPoster,AssetsData. blackAdamPoster];
 // final List<String> movieName = ['Avatar', 'Black Panther', 'Varisu', 'Black Adam'];
  CarouselController controller = CarouselController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Consumer(builder: ( context, watch,  child){
      final viewmodeltoprate=watch(getpopularData);
      return
        Container(
        /// =================== Background Image ===================
        decoration:   BoxDecoration(
          image: DecorationImage(image: NetworkImage(image_url+viewmodeltoprate.listDataModel[index].poster_path), fit: BoxFit.fill),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        /// =================== Glassmorphism Container ===================
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                child: Row(
                  children: [
                    /// =================== Text ===================
    Consumer(builder: ( context, watch,  child) {
      final viewmodeltoprate = watch(getpopularData);
      return Expanded(child: Text("${viewmodeltoprate.listDataModel[index].title}",
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, color: black),
        maxLines: 2,
        ));
    }),


                    /// =================== Search Icon ===================
                    Icon(Icons.search, color: Colors.white, size: 30.sp),

                    /// =================== Notification Icon ===================
                    SizedBox(width: 10.w),
                    Icon(Icons.notifications_none_outlined, color: Colors.white, size: 30.sp),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    /// =================== Action ===================
                    Container(
                      width: 70.w,
                      height: 30.h,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.white), color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(action, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),

                    /// =================== Sci-Fi ===================
                    SizedBox(width: 10.w),
                    Container(
                      width: 60.w,
                      height: 30.h,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.white), color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(sciFi, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),

                    /// =================== Adventure ===================
                    SizedBox(width: 10.w),
                    Container(
                      width: 90.w,
                      height: 30.h,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.white), color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(adventure, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    /// =================== Star Icon ===================
                    Icon(Icons.star_rounded, color: Colors.yellow.shade700, size: 27.sp),

                    /// =================== Votes ===================
                    Text("${viewmodeltoprate.listDataModel[index].vote_average.toString()}/10",
                        style: TextStyle(fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),

                    /// =================== Watch Trailer ===================
                    const Spacer(),
                    Container(
                      width: 130.w,
                      height: 40.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Colors.black54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 25.sp),
                          Text(watchTrailer, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// =================== Slider ===================
              Consumer(builder: ( context, watch,  child) {
                final viewmodeltoprate = watch(getpopularData);
                return
                  Container(
                    margin: EdgeInsets.all(15.sp),
                    child: CarouselSlider.builder(
                      itemCount: viewmodeltoprate.listDataModel.length,
                      carouselController: controller,
                      options: CarouselOptions(
                          onPageChanged: (i, reason) {
                            WidgetsBinding.instance.addPostFrameCallback((
                                timeStamp) {
                              if (index != i) {
                                setState(() {
                                  index = i;
                                  print("tbgt   */-*-*-*-   ${index}  ${i}");
                                });
                              }
                            });
                          },
                          enlargeCenterPage: true,
                          height: 400.h,
                          autoPlay: false,
                          viewportFraction: 0.95,
                          autoPlayInterval: const Duration(seconds: 3),
                          reverse: false,
                          aspectRatio: 5.0),
                      itemBuilder: (context, i, id) {
                        return Hero(
                          tag: viewmodeltoprate.listDataModel[i],
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(imageList:image_url+ viewmodeltoprate
                                            .listDataModel[i].poster_path,overview: viewmodeltoprate.listDataModel[i].overview,vote_average:viewmodeltoprate.listDataModel[index].vote_average.toString(),
                                            movieName: viewmodeltoprate
                                                .listDataModel[i].title)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  // border: Border.all(color: Colors.white),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.network(
                                     image_url+viewmodeltoprate.listDataModel[i]
                                          .poster_path, width: 500,
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
              }
              )
            ],
          ),
        ),
    );
                }
    )
    );
  }
}