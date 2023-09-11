
import 'package:flutter/material.dart';

class Slidingtext extends StatelessWidget {
  const Slidingtext({
    Key? key,
    required this.slidinganimation,
  }) : super(key: key);

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganimation,
      builder: (BuildContext context, Widget?_) {
        return SlideTransition(
            position:slidinganimation ,
            child:const  Text("Welcome To Fady Store",textAlign: TextAlign.center,style:TextStyle(fontSize:30)));
      },

    );
  }
}

