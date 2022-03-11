import 'dart:io';

import 'package:app_contorno/configure.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/screens/auth_view.dart';
import 'package:ui/screens/splash_view.dart';
import 'package:ui/screens/home_view.dart';
import 'package:ui/screens/register_view.dart';
import 'package:ui/widgets/profile_view/profile/profile2.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';

// import 'package:ui/widgets/profile_view/profile/profile2.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configure();
  await Global.initStorage();

  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CompanyBranchProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ExchangeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TransactionRecordProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(builder: (ctx, auth, _) {
        return MaterialApp(
          navigatorKey: Global.service.globalNavigatorKey,
          debugShowCheckedModeBanner: false, // TODO remove
          title: 'Fidelity Club',
          theme: ThemeData(
            primarySwatch: Global.appConfig.primarySwatch,
            primaryColor: Global.appConfig.primaryColor,
          ),
          // home: AuthView(),
          home: auth.isAuth
              ? HomeView()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthView(),
                ),
          routes: {
            '/home': (BuildContext context) => HomeView(),
            // '/auth_view': (BuildContext context) => AuthView(),
            '/register': (BuildContext context) => RegisterView(),
            '/profile': (BuildContext context) => Profile2(),
          },
        );
      }),
    );
  }
}
