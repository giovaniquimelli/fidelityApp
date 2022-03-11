import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/profile/edit.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Profile2State();
  }
}

class _Profile2State extends State<Profile2> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  Widget _buildList(Widget icon, String text1, String text2, bool clickable,
      bool isPassword) {
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
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                            fontSize: 16,
                            color: clickable ? Colors.black : Colors.grey[600],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
                      Icons.mode_edit,
                      color: clickable ? Colors.grey[500] : Colors.transparent,
                      size: 18,
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

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context, listen: true);

    bool _isLegalPerson = false;

    String _fullName;
    String _legalName;
    String _mobilePhone;
    String _email;
    String _username;

    _isLegalPerson = _authProvider.mainAccount?.legalName?.isNotEmpty ?? false;
    print(_isLegalPerson);
    String _usernameCode = 'CPF/CNPJ';
    _isLegalPerson ? _usernameCode = 'CNPJ' : _usernameCode = 'CPF';

    _fullName = _authProvider.mainAccount?.fullName ?? 'Nome completo';
    _legalName = _authProvider.mainAccount?.legalName ?? 'Razão social';
    _mobilePhone = _authProvider.mainAccount?.mobilePhone ?? 'Celular';
    _email = _authProvider.mainAccount?.email ?? 'e-mail';
    _username = _authProvider.mainAccount?.username ?? _usernameCode;

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
              'Profile',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4,
                  ),
                  Center(
                    child: new CustomCircleAvatar(
                        'https://p2.trrsf.com/image/fget/cf/460/0/images.terra.com/2020/07/07/2020-07-07T170434Z_1_LYNXMPEG661GX_RTROPTP_4_TECH-PANASONIC-TESLA.JPG',
                        'G',
                        Theme.of(context).primaryColor,
                        150,
                        60),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !_isLegalPerson
                      ? Column(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return new EditView('Name', _fullName,
                                            isfullName: true);
                                      },
                                      fullscreenDialog: true),
                                ).then((_) {
                                  Global.service.aciveScaffoldKey =
                                      _scaffoldKey;
                                });
                              },
                              child: _buildList(
                                Icon(
                                  Icons.person,
                                  color: Colors.grey[600],
                                  size: 24,
                                ),
                                'Name',
                                _fullName,
                                true,
                                false,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return new EditView('Nome', _fullName,
                                            isfullName: true);
                                      },
                                      fullscreenDialog: true),
                                ).then((_) {
                                  Global.service.aciveScaffoldKey =
                                      _scaffoldKey;
                                });
                              },
                              child: _buildList(
                                Icon(
                                  Icons.person,
                                  color: Colors.grey[600],
                                  size: 24,
                                ),
                                'Name',
                                _fullName,
                                true,
                                false,
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return new EditView(
                                            'Razão social', _legalName,
                                            islegalName: true);
                                      },
                                      fullscreenDialog: true),
                                ).then((_) {
                                  Global.service.aciveScaffoldKey =
                                      _scaffoldKey;
                                });
                              },
                              child: _buildList(
                                Icon(
                                  Icons.person,
                                  color: Colors.grey[600],
                                  size: 24,
                                ),
                                'Razão social',
                                _legalName,
                                true,
                                false,
                              ),
                            ),
                          ],
                        ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new EditView('Telefone', _mobilePhone,
                                  isMobilePhone: true);
                            },
                            fullscreenDialog: true),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = _scaffoldKey;
                      });
                    },
                    child: _buildList(
                      Icon(
                        Icons.phone,
                        color: Colors.grey[600],
                        size: 24,
                      ),
                      'Phone',
                      _mobilePhone,
                      true,
                      false,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new EditView('E-mail', _email,
                                  isEmail: true);
                            },
                            fullscreenDialog: true),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = _scaffoldKey;
                      });
                    },
                    child: _buildList(
                      Icon(
                        Icons.email,
                        color: Colors.grey[600],
                        size: 24,
                      ),
                      'E-mail',
                      _email,
                      true,
                      false,
                    ),
                  ),
                  _buildList(
                    Icon(
                      Icons.fingerprint,
                      color: Colors.grey[600],
                      size: 24,
                    ),
                    _usernameCode,
                    _username,
                    false,
                    false,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new EditView('Senha', '********',
                                  isPassword: true);
                            },
                            fullscreenDialog: true),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = _scaffoldKey;
                      });
                    },
                    child: _buildList(
                      Icon(Icons.lock, color: Colors.grey[600], size: 24),
                      'Password',
                      '********',
                      true,
                      true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
