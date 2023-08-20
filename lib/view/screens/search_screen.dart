import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/news_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/news_card.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late NewsController newsController = NewsController();
  TextEditingController searchBarInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    newsController = Provider.of<NewsController>(context, listen: false);
    newsController.searchNewsController(context, "all");

    return Scaffold(
      body : Container(
          color: TheamColors.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              ////////////////////////////
              Container(
                width: screenwidth,
                height: screenhight * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: screenwidth * 0.11,
                                height: screenhight * 0.05,
                                // color: Color.fromARGB(255, 207, 212, 222),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: screenwidth * 0.05,
                                  color: TheamColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ////////////////////////////////
                        Container(
                          width: screenwidth * 0.76,
                          height: screenhight * 0.05,
                        
                          child: TextFormField(
                              autocorrect: true,
                              onEditingComplete: () =>
                                  newsController.searchNewsController(
                                      context, searchBarInput.text.toString()),
                              onFieldSubmitted: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Product should not be empty ';
                                } else {
                                  return null;
                                }
                              },
                              controller: searchBarInput,
                              onChanged: (value) {},
                              style: TextStyle(color: TheamColors.primaryColor),
                              textAlign: TextAlign.justify,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                hintText: "Search product here",
                                hintStyle:
                                    TextStyle(color: TheamColors.primaryColor),
                                // labelStyle: TextStyle(  color: Colors.amber,),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      color: TheamColors.backgroundColor, width: 0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      color: TheamColors.backgroundColor, width: 0),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ///////////////////////////////////
              SizedBox(
                height: screenhight * 0.01,
              ),
              Consumer<NewsController>(
                builder: (BuildContext context, value, Widget? child) {
                  var dataListLength = value.searchNews.articles;
                  if (value.loading == true || dataListLength == null) {
                    return Expanded(
                        child: const Center(child: CircularProgressIndicator()));
                  } else {
                    if (dataListLength == 0 || dataListLength == null) {
                      return const Expanded(
                        child: Center(
                          child: Text("No News found"),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(
                            width: screenwidth,
                            height: screenhight * 0.36,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: dataListLength.length,
                              itemBuilder: (context, index) {
                                var items = value.searchNews.articles![index];
                                return Wrap(
                                  runSpacing: screenwidth * 0.03,
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [
                                    NewsCard(
                                        onTapFunction: () {},
                                        title: items.title.toString(),
                                        discription: items.description.toString(),
                                        singleNews: items,
                                        image: items.urlToImage.toString(),
                                        date: items.publishedAt.toString(),
                                        author: items.author.toString())
                                  ],
                                );
                              },
                            )),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
