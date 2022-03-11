import 'package:core/global/service.dart';
import 'package:core/global/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  // Define configuration object as Singleton property
  static AppConfig appConfig;
  static Service service;
  static SharedPreferences storage;

  static Future initStorage() async {
    storage = await SharedPreferences.getInstance();
  }

  // static final Global _global = new Global._internal();

  // factory Global() {
  //   return _global;
  // }
  // Global._internal();
}
