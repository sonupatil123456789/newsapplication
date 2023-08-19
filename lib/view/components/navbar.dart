import 'package:flutter/material.dart';
import 'package:nuseapp/view/components/heading_text.dart';
import 'package:nuseapp/view/components/icon_svg_button.dart';
import 'package:nuseapp/view/components/paragraph_text.dart';
import 'package:nuseapp/view/screens/search_screen.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';

class Navbar extends StatefulWidget {
  String title;
  bool isVisible;
  String subtitle;
  bool filter;
  bool search;
  bool cart;
  bool backButton;
  dynamic cartCount;

  Navbar({
    super.key,
    required this.title,
    required this.isVisible,
    required this.subtitle,
    required this.filter,
    required this.search,
    required this.cart,
    required this.backButton,
    required this.cartCount,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late TheamColors theamController = TheamColors();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  width: screenwidth * 0.11,
                  height: screenhight * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: widget.backButton == true
                      ? Container(
                          alignment: Alignment.center,
                          width: screenwidth * 0.11,
                          height: screenhight * 0.05,
                          // color: TheamColors.primaryColor,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: screenwidth * 0.05,
                            color: TheamColors.primaryColor,
                          ),
                        )
                      : Container(
                          child: Icon(Icons.person,
                              color: TheamColors.primaryColor),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: TheamColors.cardColor),
                        )),
            ],
          ),
          Container(
            width: screenwidth * 0.60,
            // color: Colors.amberAccent,
            child: widget.isVisible == false
                ? Row(
                    children: [
                      H1text(
                        fonttext: widget.title,
                        size: screenwidth * 0.040,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Ptext(
                        fonttext: widget.subtitle,
                        size: screenwidth * 0.032,
                        weight: FontWeight.w400,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H1text(
                        fonttext: widget.subtitle,
                        size: screenwidth * 0.042,
                        weight: FontWeight.w500,
                      ),
                      Ptext(
                        fonttext: widget.title,
                        size: screenwidth * 0.032,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
          ),
          Visibility.maintain(
            visible: widget.filter,
            child: Container(
              width: screenwidth * 0.06,
              height: screenhight * 0.02,
              child: IconSvgButton(
                crowselclick: () {},
                height: screenhight,
                width: screenwidth,
                iconimage: AssetImgLinks.filter,
                iconImageColor: TheamColors.primaryColor,
              ),
            ),
          ),
          Visibility.maintain(
            visible: widget.search,
            child: IconSvgButton(
              crowselclick: () {
                Navigator.pushNamed(context, RoutesName.searchScreen);
              },
              height: screenhight,
              width: screenwidth,
              iconimage: AssetImgLinks.search,
              iconImageColor: TheamColors.primaryColor,
            ),
          ),
          Visibility.maintain(
            visible: widget.cart,
            child: IconSvgButton(
              crowselclick: () {
              },
              height: screenhight,
              width: screenwidth,
              iconimage: AssetImgLinks.bookmark,
              iconImageColor: TheamColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
