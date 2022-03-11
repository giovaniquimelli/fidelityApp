import 'package:flutter/material.dart';

class ScaffoldKeys {
  static GlobalKey<ScaffoldState> _scaffoldKey1 =
      GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> _scaffoldKey2 =
      GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> _scaffoldKey3 =
      GlobalKey<ScaffoldState>();

  /// AuthView
  GlobalKey<ScaffoldState> get key1 {
    return _scaffoldKey1;
  }

  /// HomeView
  GlobalKey<ScaffoldState> get key2 {
    return _scaffoldKey2;
  }

  /// BranchDetail
  GlobalKey<ScaffoldState> get key3 {
    return _scaffoldKey3;
  }

  Map<String, GlobalKey<ScaffoldState>> get scaffoldKeysMap {
    return {
      'Key1dsadas': _scaffoldKey1,
      'Keydasdasd2': _scaffoldKey2,
      'Kdasdasdey3': _scaffoldKey3
    };
  }
}
