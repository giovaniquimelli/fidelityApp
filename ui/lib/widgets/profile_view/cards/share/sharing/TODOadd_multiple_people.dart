import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';
// import 'package:ui/widgets/profile_view/cards/share/sharing/add_permissions.dart';
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

  TextEditingController _textController;
  final FocusScopeNode _node = FocusScopeNode();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  @override
  void dispose() {
    _node.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget _buildList(String _plate, String _name) {
    return Container(
      padding: EdgeInsets.fromLTRB(22, 0, 14, 14),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      _plate,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      _name,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.redAccent[400],
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: Column(
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
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return new ShareAddPermissions();
                      //     },
                      //   ),
                      // );
                    },
                    child: Text(
                      "AVANÇAR",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
              ],
            ),
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[50],
              title: Text(
                'Compartilhar',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(
                              height: 22,
                            ),
                            _buildList(
                              '123.456.789-00',
                              'Giovani de Sá Quimelli',
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            _buildList(
                              '987.654.321-00',
                              'Christian de Sá Quimelli',
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                              child: Text(
                                'Adicionar Usuário',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.77,
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: TextFormField(
                                    controller: _textController,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      labelText: 'CPF',
                                      hintText: '123.456.789-00',
                                      filled: true,
                                      fillColor: Colors.grey[50],
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Campo vazio';
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {},
                                    onEditingComplete: _node.unfocus,
                                    onChanged: (_) {},
                                  ),
                                ),
                                Column(
                                  children: [
                                    // SizedBox(height: 12,),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.23,
                                      height:
                                          MediaQuery.of(context).size.width * 0.12,
                                      child: Icon(
                                        Icons.add_box,
                                        size: MediaQuery.of(context).size.width *
                                            0.12,
                                        color: Global.appConfig.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}
