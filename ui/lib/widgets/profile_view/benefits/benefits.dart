import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/card_data/card_data.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicles.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class Benefits extends StatefulWidget {
  const Benefits({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BenefitsState();
  }
}

class _BenefitsState extends State<Benefits>
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
              'Vantagens',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            bottom: new TabBar(
              onTap: (int i) {
                _myPage.jumpToPage(i);
              },
              controller: _tabController,
              tabs: [
                Tab(
                  child: new Text(
                    'PARCEIROS',
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
                    'CUPONS',
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
              Center(
                child: Text('Em breve...'),
              ),
              Center(
                child: Text('Em breve...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
