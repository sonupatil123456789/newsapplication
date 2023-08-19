
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:like_button/like_button.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/cart_controller.dart';
// import '../../controllers/category_controller.dart';
// import '../../utils/constants/colorpallets.dart';
// import '../components/card.dart';
// import '../components/choice_chips.dart';
// import '../components/coustom_redio.dart';
// import '../components/heading_text.dart';
// import '../components/increment_decrement.dart';

// bool expandedheight = false;
// bool textellips = false;

// class ProductDetailsScreen extends StatefulWidget {
//   dynamic product;

//   ProductDetailsScreen({super.key, required this.product});

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   CartController cartController = CartController();
//   late CategoryController categoryController = CategoryController();

//   @override
//   void initState() {
//     categoryController =
//         Provider.of<CategoryController>(context, listen: false);

//     categoryController.fetchProductByCategoryController(
//         context, widget.product['SingleProduct'].category['_id'].toString());

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     cartController = Provider.of<CartController>(context, listen: false);
//     final dynamic screenhight = MediaQuery.of(context).size.height;
//     final dynamic screenwidth = MediaQuery.of(context).size.width;

//     Map data = {
//       "product": widget.product['SingleProduct'].sId,
//     };
//     final List<String>? imgList = widget.product['SingleProduct'].productImages;
//     late String likes = "200000";
//     var discription = widget.product['SingleProduct'].discription;

//     return Scaffold(
//       body: Container(
//         color: TheamColors.backgroundColor,
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //////////////////////

//               Stack(
//                 children: [
//                   Container(
//                     height: screenhight * 0.36,
//                     // color: Color.fromARGB(255, 19, 19, 19),
//                     child: PageView.builder(
//                         padEnds: false,
//                         itemCount: imgList!.length,
//                         controller: PageController(keepPage: true),
//                         pageSnapping: true,
//                         itemBuilder: (context, pagePosition) {
//                           return Container(
//                               child: Image.network(
//                             imgList[pagePosition],
//                             fit: BoxFit.contain,
//                           ));
//                         }),
//                   ),
//                   Positioned(
//                     top: screenwidth * 0.02,
//                     left: screenhight * 0.02,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: screenwidth * 0.10,
//                         height: screenhight * 0.045,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Color.fromARGB(255, 229, 243, 250),
//                         ),
//                         child: Icon(
//                           Icons.arrow_back_ios_new,
//                           size: screenwidth * 0.05,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       top: screenwidth * 0.02,
//                       right: screenhight * 0.02,
//                       child: Container(
//                         width: screenwidth * 0.10,
//                         height: screenhight * 0.045,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Color.fromARGB(255, 229, 243, 250),
//                         ),
//                         child: LikeButton(
//                           padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                           circleColor: const CircleColor(
//                               start: Color(0xff00ddff), end: Color(0xff0099cc)),
//                           bubblesColor: BubblesColor(
//                             dotPrimaryColor: Color(0xff33b5e5),
//                             dotSecondaryColor: Color(0xff0099cc),
//                           ),
//                           likeBuilder: (bool isLiked) {
//                             print(isLiked);
//                             return Icon(
//                               Icons.favorite,
//                               color: isLiked
//                                   ? Colors.deepPurpleAccent
//                                   : Colors.grey,
//                               size: screenwidth * 0.050,
//                             );
//                           },
//                         ),
//                       )),
//                 ],
//               ),


//               ////////////////////

//               Expanded(
//                   child: Container(
//                 width: screenwidth,
//                 height: screenhight * 0.36,
//                 // color: Color.fromARGB(255, 214, 83, 83),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: screenhight * 0.02,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             H1text(
//                               fonttext: widget.product['SingleProduct'].title,
//                               size: screenwidth * 0.046,
//                               weight: FontWeight.w600,
//                             ),
//                             Text(
//                                 " \u{20B9} ${widget.product['SingleProduct'].price.toString()}",
//                                 style: GoogleFonts.rubik(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: screenwidth * 0.047,
//                                   color: Colors.deepPurpleAccent,
//                                 )),
//                           ],
//                         ),
//                         SizedBox(
//                           height: screenhight * 0.03,
//                         ),
//                         ///////////////
//                         Container(
//                           height: expandedheight == false
//                               ? screenhight * 0.07
//                               : discription!.length.toDouble() / 3,
//                           width: screenwidth * 0.90,
//                           // color: Color.fromARGB(255, 227, 255, 68),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 discription!,
//                                 textAlign: TextAlign.start,
//                                 textDirection: TextDirection.ltr,
//                                 overflow: textellips == false
//                                     ? TextOverflow.ellipsis
//                                     : TextOverflow.visible,
//                                 softWrap: true,
//                                 maxLines: textellips == false ? 3 : null,
//                                 style: GoogleFonts.aBeeZee(
//                                     color: TheamColors.PtexrtColor1,
//                                     fontSize: screenwidth * 0.028,
//                                     fontWeight: FontWeight.w300),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Visibility(
//                           visible: discription.length >= 240 ? true : false,
//                           child: TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   expandedheight = !expandedheight;
//                                   print(expandedheight);
//                                   textellips = !textellips;
//                                 });
//                               },
//                               child: Text(
//                                 textellips == false ? "Show more" : "Show less",
//                                 style: TextStyle(
//                                     fontSize: screenwidth * 0.028,
//                                     fontWeight: FontWeight.w700),
//                               )),
//                         ),
//                         SizedBox(
//                           height: screenhight * 0.02,
//                         ),

//                         ////////////////
//                         H1text(
//                           fonttext: "Size",
//                           size: screenwidth * 0.038,
//                           weight: FontWeight.w600,
//                         ),
//                         Container(
//                             height: screenhight * 0.072,
//                             width: screenwidth * 0.90,
//                             // color: Color.fromARGB(59, 227, 221, 221),
//                             child: ChoiceChipCatogary(
//                               data: widget.product['SingleProduct'].size
//                                   as dynamic,
//                               bgColor: TheamColors.backgroundColor,
//                               selectColor: TheamColors.backgroundColor,
//                               textColor: TheamColors.PtexrtColor1,
//                               isVisible: false,
//                               ChoiceChip: (choiceValue) {
//                                 data['size'] = choiceValue;
//                                 print(choiceValue);
//                               },
//                               chipType: 'Size',
//                             )),
//                         SizedBox(
//                           height: screenhight * 0.02,
//                         ),
//                         H1text(
//                           fonttext: "Color",
//                           size: screenwidth * 0.038,
//                           weight: FontWeight.w600,
//                         ),
//                         Container(
//                           width: screenwidth * 0.90,
//                           height: screenhight * 0.08,
//                           // color: Colors.amberAccent,
//                           child: CoustomRedio(
//                             width: screenwidth * 0.10,
//                             height: screenwidth * 0.10,
//                             pL: screenwidth * 0.01,
//                             pR: screenwidth * 0.03,
//                             activeBtn: TheamColors.primaryColor,
//                             data: widget.product['SingleProduct'].color
//                                 as dynamic,
//                             getColorValue: (colorValue) {
//                               data['color'] = colorValue;
//                             },
//                             chipType: 'Color',
//                           ),
//                         ),

//                         SizedBox(
//                           height: screenhight * 0.02,
//                         ),
//                         H1text(
//                           fonttext: "Quantity",
//                           size: screenwidth * 0.038,
//                           weight: FontWeight.w600,
//                         ),
//                         Container(
//                             alignment: Alignment.center,
//                             width: screenwidth * 0.90,
//                             height: screenhight * 0.06,
//                             // color: Color.fromARGB(255, 64, 255, 166),
//                             child: IncrementDecrementButton(
//                               quantityValue: (quantity) {
//                                 data['quantity'] = quantity;
//                               },
//                               initialQuantity: 1,
//                             )),
//                         SizedBox(
//                           height: screenhight * 0.05,
//                         ),

//                         /////////////////////////////////////////////////////////////
//                         DataTable(
//                           // border: TableBorder.all(),
//                           columns: [
//                             DataColumn(
//                                 label: Text('Parameters',
//                                     style: TextStyle(
//                                         color: TheamColors.primaryColor,
//                                         fontSize: screenwidth * 0.042,
//                                         fontWeight: FontWeight.bold))),
//                             DataColumn(
//                                 label: Text('Specifacation',
//                                     style: TextStyle(
//                                         color: TheamColors.primaryColor,
//                                         fontSize: screenwidth * 0.042,
//                                         fontWeight: FontWeight.bold))),
//                           ],
//                           rows: [
//                             DataRow(cells: [
//                               DataCell(Text(
//                                 'Stephen',
//                                 style: TextStyle(
//                                   color: TheamColors.primaryColor,
//                                 ),
//                               )),
//                               DataCell(Text(
//                                   widget.product['SingleProduct'].sId
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Name',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(Text(
//                                   widget.product['SingleProduct'].title
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Price',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(Text(
//                                   widget.product['SingleProduct'].price
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Discounr price',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(Text(
//                                   widget.product['SingleProduct']
//                                       .discountPercentage
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Brand',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(Text(
//                                   widget.product['SingleProduct'].brand['title']
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Category',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(Text(
//                                   widget.product['SingleProduct']
//                                       .category['title']
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Rating',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                         widget.product['SingleProduct'].rating
//                                             .toString(),
//                                         style: TextStyle(
//                                           color: TheamColors.primaryColor,
//                                         )),
//                                     SizedBox(
//                                       width: 6,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.deepPurpleAccent,
//                                       size: screenwidth * 0.04,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]),
//                             DataRow(cells: [
//                               DataCell(Text('Likes',
//                                   style: TextStyle(
//                                     color: TheamColors.primaryColor,
//                                   ))),
//                               DataCell(
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                     "200",
//                                         style: TextStyle(
//                                           color: TheamColors.primaryColor,
//                                         )),
//                                     SizedBox(
//                                       width: 6,
//                                     ),
//                                     Icon(
//                                       Icons.favorite,
//                                       color: Colors.deepPurpleAccent,
//                                       size: screenwidth * 0.04,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]),
//                           ],
//                         ),

//                         SizedBox(
//                           height: screenhight * 0.05,
//                         ),
//                         H1text(
//                           fonttext: "Similar Products",
//                           size: screenwidth * 0.038,
//                           weight: FontWeight.w600,
//                         ),
//                         Consumer<CategoryController>(builder:
//                             (BuildContext context, value, Widget? child) {
//                           var items = value.products.products;
//                           return Container(
//                               width: screenwidth * 0.90,
//                               height: screenhight * 0.40,
//                               alignment: Alignment.center,
//                               // color: Color.fromARGB(255, 214, 83, 83),
//                               child: value.loading == true || items == null
//                                   ? Container(
//                                       alignment: Alignment.center,
//                                       child: const CircularProgressIndicator(
//                                         color: Colors.deepPurpleAccent,
//                                       ))
//                                   : items.length == 0
//                                       ? const Center(
//                                           child: Text("No products"),
//                                         )
//                                       : ListView.builder(
//                                           scrollDirection: Axis.horizontal,
//                                           itemCount:
//                                               value.products.products!.length,
//                                           itemBuilder: (context, index) {
//                                             var items =
//                                                 value.products.products![index];
//                                             return Wrap(
//                                               crossAxisAlignment:
//                                                   WrapCrossAlignment.center,
//                                               runAlignment:
//                                                   WrapAlignment.center,
//                                               children: [
//                                                 Card1(
//                                                   addToCart: () {
//                                                     Map data = {
//                                                       "product": items.sId,
//                                                       "quantity": 1,
//                                                       "color": items.color![0],
//                                                       "size": items.size![0]
//                                                     };
//                                                     cartController
//                                                         .addToCartController(
//                                                             context, data);
//                                                   },
//                                                   discription: items.discription
//                                                       .toString(),
//                                                   price: items.price.toString(),
//                                                   thumbnailImage: items
//                                                       .thumbnail
//                                                       .toString(),
//                                                   title: items.title.toString(),
//                                                   productId:
//                                                       items.sId.toString(),
//                                                   SingleProduct: items,
//                                                   likes: items.likes,
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         ));
//                         }),
//                       ],
//                     ),
//                   ),
//                 ),
//               )),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
