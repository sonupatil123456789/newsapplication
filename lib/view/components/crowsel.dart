import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/routes/routes_name.dart';

class CrowselSlider extends StatefulWidget {
  Function crowselclick;
  var width;
  var height;
  dynamic data;

  CrowselSlider(
      {super.key,
      required this.crowselclick,
      required this.data,
      required this.width,
      required this.height});

  @override
  State<CrowselSlider> createState() => _CrowselSliderState();
}

class _CrowselSliderState extends State<CrowselSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool end = false;
  var timercontroller;
  var animationdispose;

  @override
  void initState() {
    timercontroller = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage == widget.data.length) {
        end = true;
      } else if (_currentPage == 0) {
        end = false;
      }
      if (end == false) {
        _currentPage++;
      } else {
        _currentPage--;
      }
      animationdispose = _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    timercontroller.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.amber,
      height: screenwidth * 0.60,
      child: PageView.builder(
          padEnds: false,
          itemCount: widget.data.length,
          controller: _pageController,
          pageSnapping: true,
          onPageChanged: (value) {},
          itemBuilder: (context, pagePosition) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.newsDetail,
                    arguments: {"SingleNews": widget.data[pagePosition]});
                widget.crowselclick();
              },
              child: widget.data[pagePosition].urlToImage == null
                  ? Container(
                      width: screenwidth * 0.15,
                      height: screenhight * 0.12,
                      child: Text("No image "))
                  : Container(
                      child:
                      Image.network(
                            widget.data[pagePosition].urlToImage,
                              width: screenwidth * 0.15,
                      height: screenhight * 0.12,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: screenwidth * 0.15,
                                height: screenhight * 0.12,
                                // color: Colors.amber,
                                child: Center(child: Icon(Icons.error)),
                              );
                            },
                          ),
                      
                      
                    //    CachedNetworkImage(
                    //   imageUrl: widget.data[pagePosition].urlToImage,
                    //   width: screenwidth * 0.15,
                    //   height: screenhight * 0.12,
                    //   fit: BoxFit.fill,
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    //   fadeOutDuration: const Duration(milliseconds: 1000),
                    //   fadeOutCurve: Curves.easeOut,
                    //   fadeInDuration: const Duration(milliseconds: 500),
                    // )
                    ),
            );
          }),
    );
  }
}
