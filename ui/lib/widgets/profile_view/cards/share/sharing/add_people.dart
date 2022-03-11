import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicle_add.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicle_edit.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class ShareAddUsers extends StatefulWidget {
  const ShareAddUsers({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShareAddUsersState();
  }
}

class _ShareAddUsersState extends State<ShareAddUsers> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _usernameController;
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _changed = false;
  bool _accountFound = false;
  String _chosenAccountUsername = '';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  @override
  void dispose() {
    _node.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'CPF/CNPJ',
          filled: true,
          fillColor: Colors.grey[50],
          labelStyle: TextStyle(
            color: Colors.grey[600],
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo vazio';
        }
        return null;
      },
      onSaved: (String value) {
        _chosenAccountUsername = value;
      },
      onEditingComplete: _node.nextFocus,
      onChanged: (_) {
        setState(() {
          _changed = true;
        });
      },
    );
  }

  void _submitForm(AuthProvider _authProvider) async {
    bool checkProviderLoading = _authProvider?.isLoading ?? true;

    if (!_changed) {
      return;
    }

    if (checkProviderLoading || _loading) {
      showSnackBar('Tente novamente');
      return;
    }

    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    bool success;

    setState(() {
      _loading = true;
    });
    // Send form Data to try register and receive success or error message
    success = await Provider.of<AuthProvider>(context, listen: false)
        .fetchChosenAccount(_chosenAccountUsername);

    if (success) {
      setState(() {
        _accountFound = true;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  void _share(AuthProvider _authProvider) async {
    bool checkProviderLoading = _authProvider?.isLoading ?? true;

    if (checkProviderLoading || _loading) {
      showSnackBar('Tente novamente');
      return;
    }

    bool success;

    setState(() {
      _loading = true;
    });

    success = await Provider.of<AuthProvider>(context, listen: false)
        .createSubAccount();

    if (success) {
      setState(() {
        _accountFound = false;
      });
      Navigator.of(context).maybePop();
    }
    setState(() {
      _loading = false;
    });
  }

  Widget _searchUser(
      double deviceWidth, double targetWidth, AuthProvider _authProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
          child: Text(
            'Search User',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          width: deviceWidth,
          child: Form(
            key: _formKey,
            child: FocusScope(
              node: _node,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: targetWidth,
                    child: _buildUsernameField(),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  _loading
                      ? Container(
                          height: 34,
                          width: 34,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 48,
                          width: targetWidth,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: _changed
                                ? Theme.of(context).primaryColor
                                : Colors.grey[100],
                            textColor: Colors.black,
                            onPressed: () {
                              // setState(() {
                              _submitForm(_authProvider);
                              // });
                            },
                            child: Text(
                              "SEARCH",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                    _changed ? Colors.white : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showUser(
      double deviceWidth, double targetWidth, AuthProvider _authProvider) {
    String _initial = '';
    String _fullName = '';
    String _personType = 'F';
    String _username = '';

    try {
      _initial = _authProvider?.chosenAccount?.fullName
              ?.substring(0, 1)
              ?.toUpperCase() ??
          '';
    } catch (e) {
      _initial = '';
    }
    _fullName = _authProvider?.chosenAccount?.fullName ?? 'Nome Completo';
    
    if ((_authProvider?.chosenAccount?.legalName ?? '') == '') {
      _personType = 'F';
    } else {
      _personType = 'J';
    }
    _username = _authProvider?.chosenAccount?.username ?? 'CPF/CNPJ';

    if (_personType == 'F') {
      try {
        _username = _username.substring(0, 3) +
            '.' +
            _username.substring(3, 6) +
            '.' +
            _username.substring(6, 9) +
            '-' +
            _username.substring(9);
      } catch (e) {
        _username = '000.000.000-00';
      }
    } else {
      try {
        _username = _username.substring(0, 2) +
            '.' +
            _username.substring(2, 5) +
            '.' +
            _username.substring(5, 8) +
            '/' +
            _username.substring(8, 12) +
            '-' +
            _username.substring(12);
      } catch (e) {
        _username = '00.000.000/0000-00';
      }
    }

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(26, 12, 26, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    child: Center(
                      child: Text(
                        _initial,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    backgroundColor: Global.appConfig.primaryColor,
                  ),
                ),
              ),
              Container(
                // alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Personal data ",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'User',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _fullName,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _personType == 'F' ? 'CPF' : 'CNPJ',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              _username,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: _loading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                )
              : Container(
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
                            _share(_authProvider);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SHARE",
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

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.85;

    final _authProvider = Provider.of<AuthProvider>(context, listen: true);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        color: Colors.grey[50],
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[50],
              title: Text(
                'Share',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Theme.of(context).primaryColor),
                  onPressed: () async {
                    if (!_authProvider.isLoading &&
                        !_loading &&
                        !_accountFound) {
                      Navigator.of(context).pop();
                    }
                    if (_accountFound) {
                      setState(() {
                        _accountFound = false;
                      });
                    }
                  }),
            ),
            body: _accountFound
                ? _showUser(deviceWidth, targetWidth, _authProvider)
                : _searchUser(deviceWidth, targetWidth, _authProvider),
          ),
        ),
      ),
    );
  }
}
