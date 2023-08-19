import 'package:flutter/material.dart';
import 'package:nuseapp/view/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../controllers/connectiviety_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/bottom_bar.dart';
import '../exceptionscreen/no_internet.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Screens = [MainScreen(), ProfileScreen()];

  int index = 0;

  late ConnectivityStatus connectionStatus = ConnectivityStatus.None;
  // AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi ||
        connectionStatus == ConnectivityStatus.Cellular) {
      return Consumer<TheamColors>(
          builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          body: Container(
            color: TheamColors.backgroundColor,
            child: SafeArea(
              child: Column(
                children: [
                  Screens[index],
                  BottomBar(
                    screen: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    backgroundColor: TheamColors.cardColor,
                    iconColor: TheamColors.primaryColor,
                  )
                ],
              ),
            ),
          ),
        );
      });
    } else {
      return NoInternet();
    }
  }
}
