import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/transactions_view/transactions/all_transactions.dart';
import 'package:ui/widgets/transactions_view/transactions/exchange_transactions.dart';
import 'package:ui/widgets/transactions_view/transactions/purchase_transactions.dart';

class Transactions extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  
  const Transactions(this._scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TransactionsState();
  }
}

class _TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _myPage;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: 3);
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
                    'TRANSACTIONS',
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
                      'ALL',
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
                      'PURCHASES',
                      style: TextStyle(
                            color: _page == 1
                                ? Theme.of(context).primaryColor
                                : Colors.grey[400],
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Tab(
                    child: new Text(
                      'EXCHANGES',
                      style: TextStyle(
                            color: _page == 2
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
              // AllTransactions(widget._scaffoldKey),
              // PurchaseTransactions(widget._scaffoldKey),
              // ExchangeTransactions(widget._scaffoldKey),
              AllTransactions(0, widget._scaffoldKey),
              AllTransactions(1, widget._scaffoldKey),
              AllTransactions(-1, widget._scaffoldKey),
            ],
          ),
        ),
      ],
    );
  }
}
