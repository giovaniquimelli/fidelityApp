import 'dart:developer';
import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/share/edit/edit_shared_account.dart';
import 'package:ui/widgets/profile_view/cards/share/sharing/add_people.dart';

class CardShare extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CardShare(this.scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardShareState();
  }
}

class _CardShareState extends State<CardShare> {
  Widget _buildList(Account _account) {
    // inspect(_account);
    Color _backgroundColor =
        Colors.accents[Random().nextInt(Colors.accents.length)][400];

    String _initial = '';
    String _fullName = '';

    try {
      _initial = _account?.person?.fullName?.substring(0, 1) ?? '';
    } catch (e) {
      _initial = '';
    }

    _fullName = _account?.person?.fullName ?? 'Nome Completo';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new EditSharedAccount(_account, _backgroundColor);
            },
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 46,
                        width: 46,
                        child: CircleAvatar(
                          child: Center(
                            child: Text(
                              _initial,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          backgroundColor: _backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _fullName,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[600],
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardList(List<Account> _accountList) {
    if (_accountList.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 34.0),
          child: Text(
            'Card has not been shared',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                _accountList.length,
                (index) {
                  return _buildList(
                    _accountList[index],
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final _authProvider = Provider.of<AuthProvider>(context, listen: true);

    bool _loading = false;
    _loading = _authProvider.isLoadingShare ?? false;

    List<Account> _subAccountsList = _authProvider.allSubAccountsList ?? [];

    inspect(_authProvider.allSubAccountsList);
    return Stack(
      children: <Widget>[
        _loading
            ? Column(
                children: <Widget>[
                  LinearProgressIndicator(),
                ],
              )
            : _cardList(_subAccountsList),
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) {
                            return new ShareAddUsers();
                          },
                        ),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = widget.scaffoldKey;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SHARE CARD",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
