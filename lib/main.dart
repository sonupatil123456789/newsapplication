import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nuseapp/utils/constants/colorpallets.dart';
import 'package:nuseapp/utils/routes/routes.dart';
import 'package:nuseapp/utils/routes/routes_name.dart';
// shreyas290320
// 2e84bca55c074be98bd9802fc81002f6
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'controllers/connectiviety_controller.dart';
import 'controllers/news_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
            create: (_) {
              return ConnectivityService().connectionStatusController.stream;
          },
          initialData: ConnectivityStatus.None),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return TheamColors();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return NewsController();
          },
        )
      ],
      child: MaterialApp(
        theme: ThemeData(),
        initialRoute: RoutesName.app,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

// FlDhqN6MvsKE1oAB2fdTFIvGkYuJdEeXUIAMjmR85qXR6cjB

// 'https://api.currentsapi.services/v1/latest-news?' +
//     'language=us&' +
//     'apiKey=FlDhqN6MvsKE1oAB2fdTFIvGkYuJdEeXUIAMjmR85qXR6cjB';

// 'https://api.currentsapi.services/v1/latest-news?language=us&apiKey=FlDhqN6MvsKE1oAB2fdTFIvGkYuJdEeXUIAMjmR85qXR6cjB';

// https://newsapi.org/v2/top-headlines?country=us&apiKey=2e84bca55c074be98bd9802fc81002f6
