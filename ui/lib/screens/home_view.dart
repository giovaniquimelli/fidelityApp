import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/branches_view/branches.dart';
import 'package:ui/widgets/exchanges_view/exchanges.dart';
import 'package:ui/widgets/home_view/home.dart';
import 'package:ui/widgets/home_view/home2.dart';
import 'package:ui/widgets/home_view/home3.dart';
import 'package:ui/widgets/home_view/home4.dart';
import 'package:ui/widgets/profile_view/profile1.dart';
import 'package:ui/widgets/transactions_view/transactions.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  PageController _myPage;
  int _page = 2;

  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 2);

    Global.service.aciveScaffoldKey = _scaffoldKey;
    Global.service.homeScaffoldKey = _scaffoldKey;
    Global.service.homePageController = _myPage;
  }

  @override
  void dispose() {
    _myPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      // key: Singleton.global.scaffoldKeys.key2,
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 54,
        width: 54,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              // setState(() {
              _myPage.jumpToPage(2);
              // });
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        child: Container(
          height: 48,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () {
                  // setState(() {
                  _myPage.jumpToPage(0);
                  // });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.card_giftcard,
                        color: _page == 0
                            ? Theme.of(context).primaryColor
                            : Colors.grey[400],
                        size: 20,
                      ),
                      SizedBox(height: 2),
                      Text(
                        '   Exchanges   ',
                        style: TextStyle(
                          fontSize: 10,
                          color: _page == 0
                              ? Theme.of(context).primaryColor
                              : Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  _myPage.jumpToPage(1);
                  // });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: _page == 1
                            ? Theme.of(context).primaryColor
                            : Colors.grey[400],
                        size: 20,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 10,
                          color: _page == 1
                              ? Theme.of(context).primaryColor
                              : Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              SizedBox(
                width: 1,
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  _myPage.jumpToPage(3);
                  // });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.store,
                        color: _page == 3
                            ? Theme.of(context).primaryColor
                            : Colors.grey[400],
                        size: 20,
                      ),
                      SizedBox(height: 2),
                      Text(
                        '    Branches    ',
                        style: TextStyle(
                          fontSize: 10,
                          color: _page == 3
                              ? Theme.of(context).primaryColor
                              : Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  _myPage.jumpToPage(4);
                  // });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        color: _page == 4
                            ? Theme.of(context).primaryColor
                            : Colors.grey[400],
                        size: 20,
                      ),
                      SizedBox(height: 2),
                      Text(
                        '    Profile    ',
                        style: TextStyle(
                          fontSize: 10,
                          color: _page == 4
                              ? Theme.of(context).primaryColor
                              : Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _myPage,
        onPageChanged: (i) {
          setState(() {
            _page = i;
          });
        },
        children: <Widget>[
          Exchanges(_scaffoldKey),
          Transactions(_scaffoldKey),
          Home4(_scaffoldKey, _myPage),
          Branches(_scaffoldKey),
          Profile1(_scaffoldKey),
        ],
        // physics:
        //     NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
    );
  }
}
