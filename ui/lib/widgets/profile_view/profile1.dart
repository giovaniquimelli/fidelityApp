import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/extra_views/markdown_view.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/profile_view/benefits/benefits.dart';
import 'package:ui/widgets/profile_view/cards/card_list.dart';
import 'package:ui/widgets/profile_view/info/info.dart';
import 'package:ui/widgets/profile_view/notifications/notifications.dart';
import 'package:ui/widgets/profile_view/referral/referral.dart';

class Profile1 extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  const Profile1(this._scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Profile1State();
  }
}

class _Profile1State extends State<Profile1> {
  List<String> attachments = [];
  bool isHTML = false;

  final TextEditingController _recipientController = new TextEditingController(
    text: 'contato@maplesoftware.com.br',
  );
  final TextEditingController _subjectController =
      new TextEditingController(text: '');
  final TextEditingController _bodyController = new TextEditingController(
    text: '',
  );

  Widget _buildProfileWidget(Widget icon, bool showSecond, int type) {
    final _authProvider = Provider.of<AuthProvider>(context, listen: true);

    String _fullName;

    _fullName = _authProvider.mainAccount?.fullName ?? 'Nome completo';

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/profile').then((_) {
        Global.service.aciveScaffoldKey = widget._scaffoldKey;
      }),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).padding.top + 28, 0, 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  icon,
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _fullName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[500],
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(Widget icon, String text1, String text2, bool clickable,
      [bool notification = false]) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    icon,
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text1,
                          style: TextStyle(
                            fontSize: 16,
                            color: clickable ? Colors.black : Colors.grey[600],
                          ),
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          color: notification
                              ? Colors.redAccent[400]
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 12,
                            color: notification
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      color: clickable ? Colors.grey[500] : Colors.transparent,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }

  Future<void> send() async {
    // final Email email = Email(
    //   body: _bodyController.text,
    //   subject: _subjectController.text,
    //   recipients: [_recipientController.text],
    //   attachmentPaths: attachments,
    //   isHTML: isHTML,
    // );

    // String platformResponse;

    // try {
    //   await FlutterEmailSender.send(email);
    // } catch (error) {
    //   // platformResponse = error.toString();
    //   platformResponse = 'Erro inesperado';

    //   AlertDialog(
    //     title: Text('Erro'),
    //     content: Text(platformResponse),
    //   );
    //   // scaffoldKeys['Key8'].currentState.showSnackBar(SnackBar(
    //   //       content: Text(platformResponse),
    //   // ),);
    // }

    // if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _buildProfileWidget(
                new CustomCircleAvatar(
                    // new NetworkImage('https://i.imgur.com/8VJkqIl.png'),

                    'https://p2.trrsf.com/image/fget/cf/460/0/images.terra.com/2020/07/07/2020-07-07T170434Z_1_LYNXMPEG661GX_RTROPTP_4_TECH-PANASONIC-TESLA.JPG',
                    'G',
                    Theme.of(context).primaryColor,
                    54,
                    22),
                true,
                1),
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new CardList();
                      },
                      fullscreenDialog: true),
                ).then((_) {
                  Global.service.aciveScaffoldKey = widget._scaffoldKey;
                });
              },
              child: _buildList(
                  Icon(
                    Icons.credit_card,
                    color: Colors.grey[600],
                    size: 24,
                  ),
                  'My Wallet',
                  'Manage your cards',
                  true),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new Notifications();
                      },
                      fullscreenDialog: true),
                ).then((_) {
                  Global.service.aciveScaffoldKey = widget._scaffoldKey;
                });
              },
              child: _buildList(
                  Icon(
                    Icons.notifications_none,
                    color: Colors.grey[600],
                    size: 24,
                  ),
                  'Notifications',
                  'Notifications View',
                  true,
                  true),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new Benefits();
                      },
                      fullscreenDialog: true),
                ).then((_) {
                  Global.service.aciveScaffoldKey = widget._scaffoldKey;
                });
              },
              child: _buildList(
                  Icon(
                    Icons.attach_money,
                    color: Colors.grey[600],
                    size: 24,
                  ),
                  'Coupons',
                  'Custom coupons just for you!',
                  true),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new Referral();
                      },
                      fullscreenDialog: true),
                ).then((_) {
                  Global.service.aciveScaffoldKey = widget._scaffoldKey;
                });
              },
              child: _buildList(
                  Icon(
                    Icons.group_add,
                    color: Colors.grey[600],
                    size: 24,
                  ),
                  'Referrals',
                  'Reffer and profit!',
                  true),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new Info();
                      },
                      fullscreenDialog: true),
                ).then((_) {
                  Global.service.aciveScaffoldKey = widget._scaffoldKey;
                });
              },
              child: _buildList(
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey[600],
                    size: 24,
                  ),
                  'Info',
                  'About the app',
                  true),
            ),
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // Provider.of<Provider1>(context, listen: false).changeProvider2var();
                // Provider.of<Provider2>(context, listen: false).changeVarInternal('yo');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      title: Text('Finalizar sessão'),
                      content: Text('Deseja sair desta conta?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('SIM'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Provider.of<AuthProvider>(context, listen: false)
                                .logout();

                            Provider.of<CompanyBranchProvider>(context,
                                    listen: false)
                                .logout();

                            Provider.of<ExchangeProvider>(context,
                                    listen: false)
                                .logout();

                            Provider.of<TransactionRecordProvider>(context,
                                    listen: false)
                                .logout();

                            // Navigator.pushReplacementNamed(context, '/');
                          },
                        ),
                        FlatButton(
                          child: Text('NÃO'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(21, 18, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Log out',
                      // 'provider2var: ' + Provider.of<Provider2>(context, listen: true).provider2var,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
