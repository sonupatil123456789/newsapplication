import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:nuseapp/view/screens/home_screen.dart';
import 'package:nuseapp/view/screens/news_details_screen.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  dynamic isOnboardingScreen;
  dynamic isUserAuthanticated;

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
