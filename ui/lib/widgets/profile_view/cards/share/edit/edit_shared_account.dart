import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/extra_views/markdown_view.dart';

class EditSharedAccount extends StatefulWidget {
  final Account _account;
  final Color _color;

  const EditSharedAccount(this._account, this._color, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditSharedAccountState();
  }
}

class _EditSharedAccountState extends State<EditSharedAccount> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  void _cancelShare() async {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (_loading) {
      showSnackBar('Tente novamente');
      return;
    }

    setState(() {
      _loading = true;
    });

    bool success;

    success = await _authProvider.cancelSubAccount(widget._account);

    if (success) {
      Navigator.of(context).maybePop();
    }
    setState(() {
      _loading = false;
    });
  }

  Widget _showUser(Account _account) {
    String _initial = '';
    String _fullName = '';
    String _personType = 'F';
    String cpfCnpj = '';

    try {
      _initial =
          _account?.person?.fullName?.substring(0, 1)?.toUpperCase() ?? '';
    } catch (e) {
      _initial = '';
    }
    _fullName = _account?.person?.fullName ?? 'Nome Completo';

    _personType = _account?.person?.personType ?? 'F';

    cpfCnpj = _account?.person?.cpfCnpj ?? 'CPF/CNPJ';

    cpfCnpj = maskUsername(cpfCnpj, _personType);

    // if (_personType == 'F') {
    //   try {
    //     cpfCnpj = cpfCnpj.substring(0, 3) +
    //         '.' +
    //         cpfCnpj.substring(3, 6) +
    //         '.' +
    //         cpfCnpj.substring(6, 9) +
    //         '-' +
    //         cpfCnpj.substring(9);
    //   } catch (e) {
    //     cpfCnpj = '000.000.000-00';
    //   }
    // } else {
    //   try {
    //     cpfCnpj = cpfCnpj.substring(0, 2) +
    //         '.' +
    //         cpfCnpj.substring(2, 5) +
    //         '.' +
    //         cpfCnpj.substring(5, 8) +
    //         '/' +
    //         cpfCnpj.substring(8, 12) +
    //         '-' +
    //         cpfCnpj.substring(12);
    //   } catch (e) {
    //     cpfCnpj = '00.000.000/0000-00';
    //   }
    // }

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
                            "Dados pessoais ",
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
                        'Dono do cartão ',
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
                              cpfCnpj,
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  title: Text('Cancelar compartilhamento'),
                                  content: Text('Confirma o cancelamento deste compartilhamento?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('SIM'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _cancelShare();
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
                          child: Text(
                            "CANCELAR COMPARTILHAMENTO",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
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
              'Detalhes',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
                onPressed: () {
                  if (!_loading) {
                    Navigator.of(context).pop();
                  }
                }),
          ),
          body: _showUser(widget._account),
        ),
      ),
    );
  }
}
