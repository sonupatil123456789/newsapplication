import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controllers/news_controller.dart';
import '../../models/news_model.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';
import 'heading_text.dart';

class NewsCard extends StatefulWidget {
  String discription;
  Function onTapFunction;
  String image;
  String author;
  String title;
  String date;
  Articles singleNews;

  NewsCard(
      {super.key,
      required this.onTapFunction,
      required this.title,
      required this.discription,
      required this.singleNews,
      required this.image,
      required this.date,
      required this.author});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late NewsController newsController = NewsController();
  Map<String, dynamic> bookMark = {};

  @override
  void initState() {
    print(widget.singleNews.title);
    newsController = Provider.of<NewsController>(context, listen: false);
    super.initState();
  }

  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;



    Map<String, dynamic> bookMark = {
      'title': widget.singleNews.title,
      'description': widget.singleNews.description,
      'urlToImage': widget.singleNews.urlToImage,
      'author': widget.singleNews.author,
      'publishedAt': widget.singleNews.publishedAt,
      'url': widget.singleNews.url,
    };
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.newsDetail,
            arguments: {"SingleNews": widget.singleNews});
        widget.onTapFunction();
      },
      child: Container(
        width: screenwidth * 0.94,
        height: screenhight * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenwidth * 0.24,
                  height: screenhight * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Color(0x4c000000),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: widget.image == null
                        ? Container(
                            width: screenwidth * 0.15,
                            height: screenhight * 0.12,
                            // color: Colors.amber,
                          )
                        : Image.network(
                            widget.image,
                            width: screenwidth * 0.15,
                            height: screenhight * 0.12,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: screenwidth * 0.15,
                                height: screenhight * 0.12,
                                // color: Colors.amber,
                                child: Icon(Icons.error),
                              );
                            },
                          ),
                  ),
                ),
                SizedBox(width: screenwidth * 0.04),
                Container(
                  width: screenwidth * 0.52,
                  height: screenhight * 0.12,
                  // color: Color.fromARGB(255, 128, 64, 255),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: screenhight * 0.05,
                        // color: Color.fromARGB(255, 64, 255, 166),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          // width: screenwidth * 0.42,
                          height: screenhight * 0.03,
                          // color: Color.fromARGB(255, 64, 255, 166),
                          child: H1text(
                            fonttext: widget.title,
                            size: screenwidth * 0.038,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        // width: screenwidth * 0.42,
                        height: screenhight * 0.042,
                        alignment: Alignment.centerLeft,
                        // color: Colors.amberAccent,
                        child: Text(
                          widget.date.substring(0, 9),
                          maxLines: 1,
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: TheamColors.PtexrtColor1,
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        height: screenwidth * 0.05,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: screenwidth * 0.05,
                              height: screenwidth * 0.05,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: widget.image == null
                                    ? Container(
                                        width: screenwidth * 0.15,
                                        height: screenhight * 0.12,
                                        // color: Colors.amber,
                                      )
                                    : Image.network(
                                        widget.image,
                                        width: screenwidth * 0.15,
                                        height: screenhight * 0.12,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: screenwidth * 0.15,
                                            height: screenhight * 0.12,
                                            // color: Colors.amber,
                                            child: Icon(
                                              Icons.error,
                                              size: screenwidth * 0.03,
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: screenwidth * 0.20,
                              height: screenwidth * 0.07,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // color: Colors.blueAccent
                                  ),
                              child: Text(
                                widget.author == "null"
                                    ? "shreyas patil"
                                    : widget.author,
                                maxLines: 1,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: TheamColors.PtexrtColor1,
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: screenwidth * 0.02),
                InkWell(
                  onTap: () {
                    newsController.bookMarkDataController(context, bookMark);
                  },
                  child: Container(
                    height: screenhight * 0.13,
                    alignment: Alignment.topCenter,
                    // color: Colors.amber,
                    child:  Icon(Icons.bookmark, color: TheamColors.primaryColor,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
