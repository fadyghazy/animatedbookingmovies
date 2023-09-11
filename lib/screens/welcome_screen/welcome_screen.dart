
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../movie_booking_animated/constant/strings.dart';
import '../../movie_booking_animated/features/home/presentation/view/Booking_home_screen.dart';
import 'widgets/Roundedbutton.dart';
import 'widgets/image_list_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor:Colors.blueGrey,
       body: Stack(
         alignment:Alignment.center,
           children: [
             Positioned(
               top: -10,left:-150,child:Row(
               children: [
                 ImageListView(startIndex:0),
                 ImageListView(startIndex:1),
                 ImageListView(startIndex:2),


               ],
             ),

             ),

             Positioned(
               bottom: 0,

                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height*0.60,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: MediaQuery.of(context).size.height*0.3),
                         RoundedButton(
                           press: () {
                           Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const BookingHomeScreen()), (route) => false);
                         }, text: 'Movie Section ',color: KPrimaryLightColor,textcolor: Colors.black,)
                       ],
                     ),
                 ))
         //  BackgroundImage(image:AppAssets.Logo4),WelcomeViewBody(),

      ]
    )
    );
  }
}
