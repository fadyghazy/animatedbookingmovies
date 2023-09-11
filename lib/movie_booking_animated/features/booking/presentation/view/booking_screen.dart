import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../book_tickets/view/book_tickets_screen/books_ticket_screen.dart';
import '../../../details/presentation/view/detail_screen.dart';
import '../../../time_picker/presentation/view/time_picker.dart';
import 'widgets/datepicker.dart';
import 'widgets/selectseat.dart';

class VideoClipper extends CustomClipper<Path> {
  double curveValue;

   VideoClipper({required this.curveValue});

   @override
   Path getClip(Size size) {
     var path = Path();
    print("clip = " + curveValue.toString());
     path.lineTo(0, size.height / 4 * curveValue);
    path.quadraticBezierTo(
         size.width / 2, 0, size.width, size.height / 4 * curveValue);
     path.lineTo(size.width, size.height);
     path.lineTo(0, size.height);
     path.close();
     return path;
  }

   @override
   bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
   }
 }
class BookingScreen extends StatefulWidget {
  final String imageList;
  final String movieName;
  final String vote_average;
  final String  overview;
  const BookingScreen(
      {Key? key, required this.imageList, required this.movieName,required this.vote_average,required this.overview})
      : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  late AnimationController _cinemaScreenAc;
  late Animation<double> _cinemaScreenTween;

  @override
  void initState() {
    initializeAnimation();
    super.initState();
  }

  void initializeAnimation() {
    _cinemaScreenAc = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _cinemaScreenTween = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.easeInOutQuart))
        .animate(_cinemaScreenAc);
    Future.delayed(Duration(milliseconds: 800), () {
      _cinemaScreenAc.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: 710.h,

          /// =================== Background Image ===================
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imageList), fit: BoxFit.fill),
          ),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),

            /// =================== Column ===================
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  /// =================== Back Icon ===================
                  Padding(
                    padding: EdgeInsets.only(right: 265.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                imageList: widget.imageList,
                                movieName: widget.movieName, vote_average: widget.vote_average, overview:widget.overview,),
                          ),
                        );
                      },
                      child: Container(
                        height: 40.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.white54),
                        child: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),

                  /// =================== Day ===================
                  SizedBox(height: 5.h),
                  Text('Day',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.h),
                  const DatePicker(),

                  /// =================== Time ===================
                  SizedBox(height: 15.h),
                  Text('Time',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.h),
                  const TimeHorizontalListview(),

                  /// =================== Movie Image ===================
                  // SizedBox(height: 25.h),

                  Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(pi / 4)
                      ..scale(0.9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: ClipPath(
                            clipper: VideoClipper(curveValue: 0.1),
                            child: Image.network(
                              widget.imageList,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                  ),

                  /// =================== Select Seats ===================
                  // SizedBox(height: 15.h),
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Second Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Third Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Forth Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Fifth Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Sixth Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  /// =================== Select Seats ===================
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 55.h,
                    width: 210.w,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.sp)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookTicketsScreen(
                                  imageList: widget.imageList,
                                  movieName: widget.movieName, vote_average:widget.vote_average, overview: widget.overview,),
                            ),
                          );
                        },
                        child: Text('Book Tickets',
                            style: TextStyle(
                                color: Colors.black, fontSize: 15.sp))),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}