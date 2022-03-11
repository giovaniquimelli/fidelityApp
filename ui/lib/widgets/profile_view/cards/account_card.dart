import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AccountCard extends StatefulWidget {
  final Account account;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AccountCard({this.account, this.scaffoldKey, Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountCardState();
  }
}

class _AccountCardState extends State<AccountCard> {
  String _getAccountCode() {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);

    return _authProvider.getAccountCode(widget.account.id);
  }

  String _dashAccountCode(String _code) {
    String _dashedCode = '';
    try {
      _dashedCode = _code.substring(0, 3) +
          '-' +
          _code.substring(3, 6) +
          '-' +
          _code.substring(6);
    } catch (e) {
      _dashedCode = '000-000-00';
    }

    return _dashedCode;
  }

  Widget _buildCardSummary(bool _shared, String _code) {
    return Dialog(
      insetPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: (MediaQuery.of(context).size.width - 75) * 0.67,
                color: Global.appConfig.primaryColor,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: MediaQuery.of(context).size.width / 2.7,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: QrImage(data: _code),
                            ),
                          ],
                        )
                        // CustomSquareShimming(
                        //     'https://i.imgur.com/Ck0CKsi.png',
                        //     MediaQuery.of(context).size.width / 3,
                        //     MediaQuery.of(context).size.width / 3)
                        ,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _dashAccountCode(_code),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                color: Colors.grey[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'RETURN',
                          style: TextStyle(
                              color: Global.appConfig.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              if (_shared) {
                                return new CardDetailShared(widget.account);
                              }
                              return new CardDetail(widget.account);
                            },
                          ),
                        ).then((_) {
                          Global.service.aciveScaffoldKey = widget.scaffoldKey;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'MORE',
                          style: TextStyle(
                              color: Global.appConfig.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      String _name, int _pointsSum, bool _shared, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: (MediaQuery.of(context).size.width - 40) * 0.65,
        width: MediaQuery.of(context).size.width - 40,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Global.appConfig.primaryColor,
          onPressed: () {
            String _code = _getAccountCode();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildCardSummary(_shared, _code);
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              _shared ? '-----' :
                              _pointsSum.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'POINTS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       height: 16,
                    //     ),
                    //     CustomSquareShimming(
                    //         'https://i.imgur.com/zXMOumn.png', 100, 100),
                    //   ],
                    // ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      _name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _name;
    bool _shared;
    var _pointsSum;

    final _authProvider = Provider.of<AuthProvider>(context, listen: false);

    _name = widget.account?.fullName ?? 'Nome Completo';
    _pointsSum = _authProvider.pointsSumMapByAccountId[widget.account?.id ?? ''] ?? '----';
    _shared = (widget.account?.account) != null;

    return _buildCard(_name, _pointsSum, _shared, context);
  }
}
