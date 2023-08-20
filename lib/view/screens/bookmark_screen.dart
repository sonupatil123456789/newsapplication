import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuseapp/models/news_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/news_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/heading_text.dart';
import '../components/news_card.dart';
import '../components/paragraph_text.dart';

class BookMarkScreen extends StatefulWidget {
  BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  late NewsController newsController = NewsController();

  @override
  void initState() {
    newsController = Provider.of<NewsController>(context, listen: false);
    newsController.getBookMarklistitemsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    late TheamColors theamController = TheamColors();

    theamController = Provider.of<TheamColors>(context, listen: false);

    return Consumer<TheamColors>(
      builder: (BuildContext context, value, Widget? child) {
        return Expanded(
          child: Container(
            // color: Colors.amberAccent,
            child: Column(
              children: [
                SizedBox(
                  height: screenhight * 0.01,
                ),
                Consumer<NewsController>(
                  builder: (BuildContext context, value, Widget? child) {
                    if (value.items?.length == 0 || value.items == null) {
                      return Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Center(child: Text("No News found"),)
                            
                            ),
                      );
                    } else {
                      return Expanded(
                        child: Container(
                            width: screenwidth,
                            height: screenhight * 0.36,
                            // color: Color.fromARGB(255, 214, 83, 83),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: value.items?.length,
                              itemBuilder: (context, index) {
                                var data = jsonDecode(value.items![index]);

                                Articles myarticals = Articles.fromJson(data);
                                return Wrap(
                                  runSpacing: screenwidth * 0.03,
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [
                                    NewsCard(
                                        onTapFunction: () {},
                                        title: myarticals.title.toString(),
                                        discription:
                                            myarticals.description.toString(),
                                        singleNews: myarticals,
                                        image: myarticals.urlToImage.toString(),
                                        date: myarticals.publishedAt.toString(),
                                        author: myarticals.author.toString())
                                  ],
                                );
                              },
                            )),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
