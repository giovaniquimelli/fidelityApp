import 'package:core/core.dart';
import 'package:flutter/material.dart';

customPush<T extends Object>(BuildContext context, Route<T> route, GlobalKey<ScaffoldState> scaffoldKey) {
  return Navigator.of(context).push(route).then((_) {
          Global.service.aciveScaffoldKey = scaffoldKey;
        });
}
