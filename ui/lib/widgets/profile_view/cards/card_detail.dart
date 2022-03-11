import 'dart:developer';
import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/card_data/card_data.dart';
import 'package:ui/widgets/profile_view/cards/share/card_share.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicles.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class CardDetail extends StatefulWidget {
  final Account account;
  const CardDetail(this.account, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardDetailState();
  }
}

class _CardDetailState extends State<CardDetail>
    with SingleTickerProviderStateMixin {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  PageController _myPage;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;

    _tabController = new TabController(vsync: this, length: 2);
    _myPage = new PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    _fetchSubAccounts();
  }

  void _fetchSubAccounts() async {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (!_authProvider.hasFetchedSubAccounts) {
      if (_authProvider.allSubAccountsList.isEmpty) {
        await _authProvider.fetchAllSubAccounts();
      }

      if (_authProvider.allSubAccountsList.isNotEmpty) {
        _authProvider.setFetchedSubAccounts(true);
        // inspect(_authProvider.allSubAccountsList);
      }
    }
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
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[50],
            title: Text(
              'Card',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            bottom: new TabBar(
              isScrollable: true,
              onTap: (int i) {
                _myPage.jumpToPage(i);
              },
              controller: _tabController,
              tabs: [
                Tab(
                  child: new Text(
                    '     DETAILS     ',
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
                '     SHARE     ',
                    style: TextStyle(
                        color: _page == 1
                            ? Theme.of(context).primaryColor
                            : Colors.grey[400],
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                // Tab(
                //   child: new Text(
                //     '   VEÍCULOS   ',
                //     style: TextStyle(
                //         color: _page == 2
                //             ? Theme.of(context).primaryColor
                //             : Colors.grey[400],
                //         fontSize: 13,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
              ],
            ),
          ),
          body: PageView(
            controller: _myPage,
            onPageChanged: (i) {
              print('Page Changed to index $i');

              setState(() {
                _page = i;
              });
              _tabController.animateTo(i);
            },
            children: <Widget>[
              CardData(false, widget.account),
              CardShare(_scaffoldKey),
              // Vehicles(false),
            ],
          ),
        ),
      ),
    );
  }
}
