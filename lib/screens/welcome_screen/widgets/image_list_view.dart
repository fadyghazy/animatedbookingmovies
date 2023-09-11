import 'dart:async';
import 'dart:math';
import'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_animated/constant.dart';


import '../../../control/API/getpopulardata.dart';
class ImageListView extends StatefulWidget {
  final int startIndex;
  const ImageListView({
    required this.startIndex,
  });

  @override
  State<ImageListView> createState() => _ImageListViewState();


}

class _ImageListViewState extends State<ImageListView> {
  final _scrollController=ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        _autoScroll();
      }
      // adding to List
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
    super.initState();
  }
   void _autoScroll(){
      final currentScrollPosition=_scrollController.offset;
      final scrollEndPosition =_scrollController.position.maxScrollExtent;
      scheduleMicrotask(() {
        _scrollController.animateTo(currentScrollPosition==scrollEndPosition?0:scrollEndPosition, duration: const Duration(seconds:5), curve:Curves.linear);

      });
  }
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle:1.96*pi,
      child:
      SizedBox(
        width: MediaQuery.of(context).size.width*0.60,
        height:MediaQuery.of(context).size.height*0.60,
    child:Consumer(builder: ( context, watch,  child){
    final viewmodeltoprate=watch(getpopularData);
    return
      ListView.builder(
            itemCount: viewmodeltoprate.listDataModel.length,
          controller: _scrollController,
            itemBuilder: (context,index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    image: DecorationImage(image: NetworkImage(

                     image_url+ viewmodeltoprate.listDataModel[index].poster_path,
                      //products[widget.startIndex+index].productImage
                    ), fit: BoxFit.cover,

                    )
                ),
                margin: const EdgeInsets.only(right: 8.0, left: 8.0, top: 10.0),
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.40,

              );
            }
    );
            }),

      ),

    );
  }
}
