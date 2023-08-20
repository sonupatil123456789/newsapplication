import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colorpallets.dart';
import '../components/heading_text.dart';

class NewsDetailsScreen extends StatefulWidget {
  var newsDetails;

  NewsDetailsScreen({super.key, required this.newsDetails});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: TheamColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //////////////////////

            Stack(
              children: [
                Container(
                  height: screenhight * 0.36,
                  child: Image.network(
                    widget.newsDetails["SingleNews"].urlToImage,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: screenwidth * 0.02,
                  left: screenhight * 0.02,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: screenwidth * 0.10,
                      height: screenhight * 0.045,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 229, 243, 250),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: screenwidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ////////////////////

            Expanded(
                child: Container(
              width: screenwidth,
              height: screenhight * 0.36,
              // color: Color.fromARGB(255, 214, 83, 83),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenhight * 0.02,
                      ),
                      H1text(
                        fonttext: widget.newsDetails["SingleNews"].title,
                        size: screenwidth * 0.046,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: screenhight * 0.02,
                      ),
                      Container(
                        // color: Colors.amber,
                        width: screenwidth * 0.90,
                        height: screenwidth * 0.09,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: screenwidth * 0.06,
                              height: screenwidth * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: widget.newsDetails["SingleNews"]
                                            .urlToImage ==
                                        null
                                    ? Container(
                                        width: screenwidth * 0.16,
                                        height: screenhight * 0.12,
                                        // color: Colors.amber,
                                      )
                                    : Image.network(
                                        widget.newsDetails["SingleNews"]
                                            .urlToImage,
                                        width: screenwidth * 0.16,
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
                              height: screenwidth * 0.05,
                              // alignment: Alignment.center,
                              // decoration:
                              // BoxDecoration(color: Colors.blueAccent),
                              child: Text(
                                widget.newsDetails["SingleNews"].author ==
                                        "null"
                                    ? "shreyas patil"
                                    : widget.newsDetails["SingleNews"].author,
                                maxLines: 1,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: TheamColors.PtexrtColor1,
                                ),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.03,
                      ),
                      Container(
                        width: screenwidth * 0.20,
                        height: screenwidth * 0.05,
                        // alignment: Alignment.center,
                        // decoration:
                        // BoxDecoration(color: Colors.blueAccent),
                        child: Text(
                          widget.newsDetails["SingleNews"].publishedAt == "null"
                              ? "shreyas patil"
                              : widget.newsDetails["SingleNews"].publishedAt
                                  .substring(0, 9),
                          maxLines: 1,
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: TheamColors.PtexrtColor1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenwidth * 0.90,
                        // color: Colors.amber,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.newsDetails["SingleNews"].description,
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.ltr,

                              softWrap: true,
                              // maxLines: textellips == false ? 3 : null,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: screenwidth * 0.038,
                                color: TheamColors.PtexrtColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
