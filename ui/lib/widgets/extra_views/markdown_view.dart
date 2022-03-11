import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_text/styled_text.dart';

class MarkdownView extends StatefulWidget {
  final String _title;
  final String _body;

  const MarkdownView(this._title, this._body, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MarkdownViewState();
  }
}

class _MarkdownViewState extends State<MarkdownView> {
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
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            title: Text(
              widget._title,
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
                padding: EdgeInsets.fromLTRB(20, 26, 20, 0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget._body,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      StyledText(
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey[600], height: 1.8, fontSize: 16),
                        newLineAsBreaks: true,
                        text: '''Data de atualiação: 20 de julho de 2020

Donec et bibendum ligula. Etiam maximus ac quam vitae fermentum. Pellentesque commodo tortor non augue feugiat, in congue ipsum molestie. Donec sit amet libero velit. Praesent in ullamcorper massa, a varius justo. Fusce ut leo ultrices, varius tellus placerat, mollis magna. Maecenas pharetra nibh augue, ac porttitor odio rutrum condimentum. Ut non odio lorem.

Nullam semper est vitae dictum venenatis. <bold>Pellentesque</bold> loborti



s sem a urna condimentum maximus. Vivamus viverra tempus nibh a aliquet. In congue pulvinar risus, id rutrum mi. Integer interdum arcu nec mi euismod, quis accumsan felis tempus. Donec at gravida nisi, eu ultricies metus. Donec faucibus nisl neque, vitae tincidunt nisl porttitor eget. Vivamus feugiat eu mauris ac porttitor. Proin felis tortor, porttitor vel bibendum eget, ultricies a sapien. Cras vel orci id arcu sagittis viverra sed non sapien. Vestibulum facilisis sodales risus, eu accumsan est. Suspendisse potenti.

Donec ac tempus orci. Curabitur consectetur aliquet turpis. Ut a congue enim. Vestibulum bibendum fringilla dolor non finibus. Suspendisse suscipit purus ut hendrerit laoreet. Praesent pellentesque quam sed mi aliquam, auctor fermentum enim fringilla. Ut sagittis suscipit nisl vitae gravida. Sed tempor turpis in enim fermentum, id fringilla tortor viverra. Nulla tellus ante, pulvinar a purus in, tempor iaculis diam. Quisque eget nisi nec nibh sagittis cursus nec quis nulla. Sed bibendum enim vel mi consequat, eget scelerisque elit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur quis gravida magna. Aenean at lacinia lorem, a scelerisque est. Nullam viverra, massa a egestas venenatis, purus ligula pellentesque augue, et sodales purus ipsum eu magna.''',
                        styles: {
                          'bold': TextStyle(fontWeight: FontWeight.bold),
                        },
                      ),
//                   Text(
//                     '''Data de atualiação: 20 de julho de 2020

// Donec et bibendum ligula. Etiam maximus ac quam vitae fermentum. Pellentesque commodo tortor non augue feugiat, in congue ipsum molestie. Donec sit amet libero velit. Praesent in ullamcorper massa, a varius justo. Fusce ut leo ultrices, varius tellus placerat, mollis magna. Maecenas pharetra nibh augue, ac porttitor odio rutrum condimentum. Ut non odio lorem.

// Nullam semper est vitae dictum venenatis. Pellentesque lobortis sem a urna condimentum maximus. Vivamus viverra tempus nibh a aliquet. In congue pulvinar risus, id rutrum mi. Integer interdum arcu nec mi euismod, quis accumsan felis tempus. Donec at gravida nisi, eu ultricies metus. Donec faucibus nisl neque, vitae tincidunt nisl porttitor eget. Vivamus feugiat eu mauris ac porttitor. Proin felis tortor, porttitor vel bibendum eget, ultricies a sapien. Cras vel orci id arcu sagittis viverra sed non sapien. Vestibulum facilisis sodales risus, eu accumsan est. Suspendisse potenti.

// Donec ac tempus orci. Curabitur consectetur aliquet turpis. Ut a congue enim. Vestibulum bibendum fringilla dolor non finibus. Suspendisse suscipit purus ut hendrerit laoreet. Praesent pellentesque quam sed mi aliquam, auctor fermentum enim fringilla. Ut sagittis suscipit nisl vitae gravida. Sed tempor turpis in enim fermentum, id fringilla tortor viverra. Nulla tellus ante, pulvinar a purus in, tempor iaculis diam. Quisque eget nisi nec nibh sagittis cursus nec quis nulla. Sed bibendum enim vel mi consequat, eget scelerisque elit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur quis gravida magna. Aenean at lacinia lorem, a scelerisque est. Nullam viverra, massa a egestas venenatis, purus ligula pellentesque augue, et sodales purus ipsum eu magna.''',
//                     textAlign: TextAlign.justify,
//                     style: TextStyle(
//                         height: 1.6, color: Colors.grey[600], fontSize: 16),
//                   )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
