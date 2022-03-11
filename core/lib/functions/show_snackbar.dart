import 'package:flutter/material.dart';
import 'package:core/core.dart';

void showSnackBar(String text, [int duration = 3]) {
  GlobalKey<ScaffoldState> _key;

  // Singleton.global.scaffoldKeys.scaffoldKeysMap.forEach((key, value) {
  //   try {
  //     if (value?.currentContext != null) {
  //       if (ModalRoute.of(value?.currentContext)?.isCurrent ?? false) {
  //         _key = value;
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // });

  _key = Global.service.aciveScaffoldKey;

  try {
    _key.currentState.removeCurrentSnackBar();
  } catch (e) {
    print('Could not remove current snackbar');
  }
  try {
    _key.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Global.appConfig.primaryColor,
      content: Text(text),
      duration: Duration(seconds: duration),
    ));
  } catch (e) {
    print('Could not show snackbar');
  }
}
