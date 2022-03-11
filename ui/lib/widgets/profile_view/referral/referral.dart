import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class Referral extends StatefulWidget {
  const Referral({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReferralState();
  }
}

class _ReferralState extends State<Referral> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  Widget _buildReferralButton() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new ReferralCode();
                  },
                  fullscreenDialog: true),
            ).then((_) {
              Global.service.aciveScaffoldKey = _scaffoldKey;
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 14, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Indique e ganhe',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 17, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildList(
      String _url, String _initialLetter, String _text1, int _ammount) {
    Color _backgroundColor =
        Colors.accents[Random().nextInt(Colors.accents.length)][400];

    Widget _avatar =
        new CustomCircleAvatar(_url, _initialLetter, _backgroundColor, 54, 22);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new FriendDetail(
                  _initialLetter, _backgroundColor, _text1, _ammount, _url);
            },
          ),
        ).then((_) {
          Global.service.aciveScaffoldKey = _scaffoldKey;
        });
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
                  padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[_avatar],
                  ),
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _text1,
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
              height: 13,
            ),
          ],
        ),
      ),
    );
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
              'Indicações',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: <Widget>[
              _buildReferralButton(),
              Container(
                color: Colors.grey[200],
                height: 0.7,
                width: MediaQuery.of(context).size.width,
              ),
              Flexible(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          _buildList(
                            'https://i1.wp.com/www.pontojao.com.br/wp-content/uploads/2018/07/saitama-ok-aficionados-0.jpg?resize=500%2C320',
                            'A',
                            'André Kociuba Ferreira',
                            15,
                          ),
                          _buildList(
                            'https://veja.abril.com.br/wp-content/uploads/2016/06/presidente-dilma-rousseff-20120503-07-original1.jpeg',
                            'C',
                            'Christian de Sá Quimelli',
                            135,
                          ),
                          _buildList(
                            'https://p2.trrsf.com/image/fget/cf/460/0/images.terra.com/2020/07/07/2020-07-07T170434Z_1_LYNXMPEG661GX_RTROPTP_4_TECH-PANASONIC-TESLA.JPG',
                            'G',
                            'Giovani de Sá Quimelli',
                            0,
                          ),
                          _buildList(
                            'https://blog.portalpos.com.br/app/uploads/2019/07/steve-jobs.png',
                            'L',
                            'Luis Aparecido Peracini',
                            83,
                          ),
                          _buildList(
                            'https://assets.papelpop.com/wp-content/uploads/2019/02/amy-winehouse-660x402.jpg',
                            'E',
                            'Emillyn Drobenko Peracini',
                            432,
                          ),
                          _buildList(
                            'https://dev.observatoriodocinema.bol.uol.com.br/wp-content/uploads/2017/12/8-avatar.jpg',
                            'H',
                            'Henrique Almeia Nome Comprido de Teste',
                            7,
                          ),
                        ],
                      ),
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
}
