import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';
import 'package:ui/widgets/profile_view/cards/account_card.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class CardList extends StatefulWidget {
  const CardList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardListState();
  }
}

class _CardListState extends State<CardList> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  Widget _cardList(List<Account> _accountList) {
    if (_accountList.isEmpty) {
      return Center(
        child: Text('Nenhum cartão encontrado'),
      );
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                _accountList.length,
                (index) {
                  return AccountCard(
                    account: _accountList[index],
                    scaffoldKey: _scaffoldKey,
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

    List<Account> _accountList = _authProvider.allAccountsList ?? [];
    
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[50],
            title: Text(
              'My Wallet',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Container(child: _cardList(_accountList)),

          // CustomScrollView(
          //   slivers: <Widget>[
          //     SliverList(
          //       delegate: SliverChildListDelegate(
          //         [
          //           _buildListBEFORE(
          //             // Color(0xFFFF425B),
          //             Global.appConfig.primaryColor,
          //             'Giovani de Sá Quimelli',
          //             8750,
          //             false,
          //             'https://i.imgur.com/Ck0CKsi.png',
          //           ),
          //           _buildListBEFORE(
          //             // Colors.blueGrey[800],
          //             Global.appConfig.primaryColor,
          //             // Color(0xFFFF425B),
          //             'Maple Software',
          //             22500,
          //             true,
          //             'https://i.imgur.com/zXMOumn.png',
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
