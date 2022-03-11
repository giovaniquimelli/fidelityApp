import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  GlobalKey<NavigatorState> globalNavigatorKey = new GlobalKey<NavigatorState>();
  // ScaffoldKeys scaffoldKeys = ScaffoldKeys();
  GlobalKey<ScaffoldState> aciveScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

  PageController homePageController;
  // SharedPreferences prefs;

  // Service(
    // {@required this.prefs,}
    // );
}