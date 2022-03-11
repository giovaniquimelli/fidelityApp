import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/widgets/extra_views/markdown_view.dart';

class Info extends StatefulWidget {
  const Info({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InfoState();
  }
}

class _InfoState extends State<Info> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  Widget _buildList(Widget icon, String text1, String text2, bool clickable) {
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
              'Informações',
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
                    height: 10,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: _buildList(
                        Icon(
                          Icons.people,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                        'Contato',
                        'Alguma dúvida?',
                        true),
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
                    child: _buildList(
                        Icon(
                          Icons.library_books,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                        'Regras',
                        'Como funciona?',
                        true),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new MarkdownView(
                                  'Termos', 'Termos de uso');
                            },
                            fullscreenDialog: true),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = _scaffoldKey;
                      });
                    },
                    child: _buildList(
                        Icon(
                          Icons.description,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                        'Termos de uso',
                        'Tudo que você precisa saber',
                        true),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new MarkdownView(
                                  'Privacidade', 'Política de privacidade');
                            },
                            fullscreenDialog: true),
                      ).then((_) {
                        Global.service.aciveScaffoldKey = _scaffoldKey;
                      });
                    },
                    child: _buildList(
                        Icon(
                          Icons.https,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                        'Política de privacidade',
                        'Para sua segurança',
                        true),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      // final SharedPreferences _prefs =
                      //     await SharedPreferences.getInstance();
                      final SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      _prefs.setBool('appActivated', false);

                      print('reseted activation to false');
                    },
                    child: _buildList(
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                        'Versão',
                        '1.0.0',
                        false),
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
