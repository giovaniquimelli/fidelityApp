import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';

class BranchDetail extends StatefulWidget {
  final String _address;
  final String _branch;

  const BranchDetail(this._address, this._branch, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BranchDetailState();
  }
}

class _BranchDetailState extends State<BranchDetail> {
  static GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

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
          // key: Singleton.global.scaffoldKeys.key3,
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
          body: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget._branch,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Endereço',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget._address,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Horário de atendimento',
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w500),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Seg a Sex das 06:00 às 22:00',
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showSnackBar('Branch Detail View', 3);
                      //   },
                      //   behavior: HitTestBehavior.opaque,
                      //   child: Text('Snackbar Test'),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
