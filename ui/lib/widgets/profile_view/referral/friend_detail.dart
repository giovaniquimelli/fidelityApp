import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/extra_views/markdown_view.dart';

class FriendDetail extends StatefulWidget {
  final String _initialLetter;
  final Color _color;
  final String _fullName;
  final int _ammount;
  final String _url;

  const FriendDetail(this._initialLetter, this._color, this._fullName,
      this._ammount, this._url,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FriendDetailState();
  }
}

class _FriendDetailState extends State<FriendDetail> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
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
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4,
                  ),
                  Center(
                    child: new CustomCircleAvatar(widget._url,
                        widget._initialLetter, widget._color, 150, 60),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    widget._fullName,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Confira abaixo os pontos recebidos como bônus pelas compras de ' +
                        widget._fullName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new MarkdownView(
                                  'Regras', 'Regras do sistema');
                            },
                            fullscreenDialog: true),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = _scaffoldKey;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Como funciona?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'PONTOS RECEBIDOS',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget._ammount.toString(),
                    style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
