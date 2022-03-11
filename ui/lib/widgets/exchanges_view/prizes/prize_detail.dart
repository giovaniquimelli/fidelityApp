import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/widgets/exchanges_view/prizes/checkout/branches_by_reward.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';

class PrizeDetail extends StatefulWidget {
  final Reward _reward;
  final PageController _myPage;

  const PrizeDetail(this._reward, this._myPage, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PrizeDetailState();
  }
}

class _PrizeDetailState extends State<PrizeDetail> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // bool _showPasswordField = false;
  // TextEditingController _textController;
  ScrollController _scrollController;

  final FocusScopeNode _node = FocusScopeNode();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;

    // _textController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // _node.dispose();
    // _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Future<bool> _appActivated() async {
  //   // final SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   final SharedPreferences _prefs = Global.storage;

  //   final bool _isActivated = _prefs.getBool('appActivated');

  //   if (_isActivated != null && _isActivated) {
  //     return true;
  //   }

  //   return false;
  // }

  Widget _fab(String _points) {
    final _companyBranchProvider =
        Provider.of<CompanyBranchProvider>(context, listen: false);
    return
        // _showPasswordField
        //     ? Container()
        //     :
        Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 40,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () /*async*/ {
              // bool _hasActivated = await _appActivated();

              // if (_hasActivated) {
              // setState(() {
              //   _showPasswordField = !_showPasswordField;
              //   Timer(Duration(milliseconds: 100), () {
              //     _scrollController.animateTo(
              //       _scrollController.position.maxScrollExtent,
              //       duration: Duration(milliseconds: 130),
              //       curve: Curves.easeOut,
              //     );
              //   });
              // });
              // } else {
              _companyBranchProvider.setInitialized2(false);
              _companyBranchProvider.setIsLoading2(true);
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new BranchesByReward(widget._reward, _scaffoldKey);
                  },
                ),
              ).then((_) {
                Global.service.aciveScaffoldKey = _scaffoldKey;
              });
              // }
            },
            child: Text(
              "EXCHANGE - " + _points,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String _rewardName = '';
    String _description = '';
    String _points = '';

    _rewardName = widget._reward.name ?? 'Nome do Produto';
    _description = widget._reward.description ?? 'Descrição';
    _points =
        setDecimalPrecision(widget._reward.points, precision: 2) ?? 'Points';

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
            floatingActionButton: _fab(_points),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              elevation: 0,
              title: Text(
                'Details',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: CustomSquareShimming(
                          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-green-select-2019?wid=834&hei=1000&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1566956144838",
                          MediaQuery.of(context).size.width,
                          200,
                          radius: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              _rewardName,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Container(
                          width: double.maxFinite,
                          child: Text(
                            _description,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      // _showPasswordField
                      //     ? Expanded(
                      //         child: Container(),
                      //       )
                      //     : Container(),
                      // _showPasswordField
                      //     ? Container()
                      //     :
                      SizedBox(
                        height: 110,
                      ),
                      // _showPasswordField
                      //     ? Column(
                      //         children: <Widget>[
                      //           SizedBox(
                      //             height: 50,
                      //           ),
                      //           Container(
                      //             width: MediaQuery.of(context).size.width - 40,
                      //             child: Text(
                      //               'Digite sua senha para confirmar',
                      //               style: TextStyle(
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w500),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 18,
                      //           ),
                      //           Container(
                      //             width: MediaQuery.of(context).size.width - 40,
                      //             child: TextFormField(
                      //               controller: _textController,
                      //               textInputAction: TextInputAction.next,
                      //               decoration: InputDecoration(
                      //                 labelText: 'Senha',
                      //                 // hintText: 'Senha',
                      //                 filled: true,
                      //                 fillColor: Colors.grey[50],
                      //                 labelStyle: TextStyle(
                      //                   color: Colors.grey[600],
                      //                 ),
                      //               ),
                      //               validator: (String value) {
                      //                 if (value.isEmpty) {
                      //                   return 'Campo vazio';
                      //                 }
                      //                 return null;
                      //               },
                      //               onSaved: (String value) {},
                      //               onEditingComplete: _node.unfocus,
                      //               onChanged: (_) {},
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 25,
                      //           ),
                      //           Container(
                      //             height: 50,
                      //             width: MediaQuery.of(context).size.width - 40,
                      //             child: RaisedButton(
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(4),
                      //                 ),
                      //                 color: Theme.of(context).primaryColor,
                      //                 textColor: Colors.white,
                      //                 onPressed: () {
                      //                   setState(() {
                      //                     _showPasswordField =
                      //                         !_showPasswordField;
                      //                   });
                      //                   Navigator.popUntil(
                      //                       context, ModalRoute.withName('/'));
                      //                   widget._myPage.jumpToPage(1);
                      //                 },
                      //                 child: Text(
                      //                   "CONFIRMAR - " + _points,
                      //                   style: TextStyle(
                      //                     fontSize: 14.0,
                      //                   ),
                      //                 )),
                      //           ),
                      //           SizedBox(height: 26),
                      //         ],
                      //       )
                      //     : Container(),
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
