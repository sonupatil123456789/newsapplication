import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nuseapp/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

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
