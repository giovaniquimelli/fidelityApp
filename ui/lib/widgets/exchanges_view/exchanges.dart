import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/exchanges_view/prizes/prizes.dart';
import 'package:ui/widgets/exchanges_view/vouchers/exchange_receipts.dart';


class Exchanges extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  
  const Exchanges(this._scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExchangesState();
  }
}

class _ExchangesState extends State<Exchanges>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _myPage;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: 2);
    _myPage = new PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _myPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text(
                    'EXCHANGES',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              new TabBar(
                onTap: (int i) {
                  _myPage.jumpToPage(i);
                },
                controller: _tabController,
                tabs: [
                  Tab(
                    child: new Text(
                      'PRODUCTS',
                      style: TextStyle(
                            color: _page == 0
                                ? Theme.of(context).primaryColor
                                : Colors.grey[400],
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Tab(
                    child: new Text(
                      'RECEIPTS',
                      style: TextStyle(
                            color: _page == 1
                                ? Theme.of(context).primaryColor
                                : Colors.grey[400],
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Flexible(
          child: PageView(
            controller: _myPage,
            onPageChanged: (i) {
              print('Page Changes to index $i');

              setState(() {
                _page = i;
              });
              _tabController.animateTo(i);
            },
            children: <Widget>[
              Prizes(_myPage),
              ExchangeReceipts(widget._scaffoldKey),
            ],
          ),
        ),
      ],
    );
  }
}
