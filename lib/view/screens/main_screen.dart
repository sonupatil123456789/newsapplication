import 'package:flutter/material.dart';
import 'package:nuseapp/utils/constants/input_field_utils.dart';
import 'package:nuseapp/view/components/news_card.dart';
import 'package:provider/provider.dart';
import '../../controllers/news_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/card_header.dart';
import '../components/choice_chips.dart';
import '../components/coustom_button.dart';
import '../components/crowsel.dart';
import '../components/heading_text.dart';
import '../components/navbar.dart';

List<String> categorys = [
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology"
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String categoryName = "business";

  late NewsController newsController = NewsController();
  // late ProductController productController = ProductController();
  // late BrandController brandController = BrandController();

  @override
  void initState() {
    // categoryController =
    //     Provider.of<CategoryController>(context, listen: false);
    newsController = Provider.of<NewsController>(context, listen: false);
    // productController = Provider.of<ProductController>(context, listen: false);
    // brandController = Provider.of<BrandController>(context, listen: false);

    // brandController.brandController(context);

    // productController.mainBannerProducts(context);
    // productController.mostLikedProducts(context);
    // productController.HieghestRatedProducts(context);

    // cartController.fetchUserCartController(context);

    newsController.getAllNewsHeadlinesController(context);
    newsController.getAllNewsByCategoryController(context, categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
          // color: Color.fromARGB(255, 244, 244, 244),
          child: Column(children: [
        // Navbar section  ==================================================================
        Navbar(
          isVisible: true,
          title: 'Shreyas patil',
          subtitle: 'Hello 👋',
          cart: false,
          filter: false,
          search: true,
          backButton: false,
          cartCount: "2",
        ),
// top news crowsel slider component ==================================================================
        Consumer<NewsController>(
          builder: (BuildContext context, value, Widget? child) {
            var items = value.news.articles;
            return value.loading == true || items == null
                ? Container(
                    height: screenwidth * 0.60,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    ))
                : items.length == 0
                    ? Center(
                        child: H1text(
                          fonttext: "No news",
                          size: screenwidth * 0.028,
                          weight: FontWeight.w500,
                        ),
                      )
                    : CrowselSlider(
                        crowselclick: () {},
                        data: items,
                        height: screenhight,
                        width: screenwidth,
                      );
          },
        ),

// category choice chips component  ==================================================================
        Row(
          children: [
            Expanded(
                child: Container(
                    height: screenhight * 0.072,
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(60, 210, 108, 108),
                        borderRadius: BorderRadius.circular(10)),
                    child: ChoiceChipCatogary(
                      data: categorys,
                      bgColor: TheamColors.unselectedChipColor,
                      selectColor: TheamColors.selectedChipColor,
                      textColor: TheamColors.PtexrtColor2,
                      isVisible: false,
                      ChoiceChip: (choiceValue) {
                        categoryName = choiceValue;
                        newsController.getAllNewsByCategoryController(
                            context, categoryName);
                      },
                    ))),
          ],
        ),
// body section  ==================================================================
        Expanded(
          child: Container(
            width: screenwidth,
            child: Column(
              children: [
                // category section  ==================================================================

                CardHeader(
                  titleText: "Category",
                  navigateToList: () {},
                  isVisible: true,
                ),

                Consumer<NewsController>(
                    builder: (BuildContext context, value, Widget? child) {
                  var items = value.categoryNews.articles;
                  return Expanded(
                    child: Container(
                        width: screenwidth * 0.90,
                        height: screenhight * 0.40,
                        alignment: Alignment.center,
                        // color: Color.fromARGB(255, 214, 83, 83),
                        child: value.loading == true || items == null
                            ? Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.deepPurpleAccent,
                                ))
                            : items.length == 0
                                ? Center(
                                    child: H1text(
                                      fonttext: "No News",
                                      size: screenwidth * 0.028,
                                      weight: FontWeight.w500,
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        value.categoryNews.articles!.length,
                                    itemBuilder: (context, index) {
                                      var items =
                                          value.categoryNews.articles![index];
                                      return Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          NewsCard(
                                              onTapFunction: () {},
                                              title: items.title.toString(),
                                              discription:
                                                  items.description.toString(),
                                              singleNews: items,
                                              image:
                                                  items.urlToImage.toString(),
                                              date:
                                                  items.publishedAt.toString(),
                                              author: items.author.toString())
                                        ],
                                      );
                                    },
                                  )),
                  );
                }),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
