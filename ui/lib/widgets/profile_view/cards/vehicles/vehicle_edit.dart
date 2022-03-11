import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class VehicleEdit extends StatefulWidget {
  final String plate;
  final String type;
  final String brand;
  final String model;

  const VehicleEdit(this.plate, this.type, this.model, this.brand, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VehicleEditState();
  }
}

class _VehicleEditState extends State<VehicleEdit> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _plateController;
  TextEditingController _typeController;
  TextEditingController _brandController;
  TextEditingController _modelController;
  final FocusScopeNode _node = FocusScopeNode();

  @override
  void initState() {
    super.initState();

    _plateController = TextEditingController();
    _typeController = TextEditingController();
    _brandController = TextEditingController();
    _modelController = TextEditingController();

    _plateController.value = TextEditingValue(text: widget.plate);
    _typeController.value = TextEditingValue(text: widget.type);
    _brandController.value = TextEditingValue(text: widget.brand);
    _modelController.value = TextEditingValue(text: widget.model);

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  @override
  void dispose() {
    _node.dispose();
    _plateController.dispose();
    _typeController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  Widget _buildList(String _plate, String _vehicle, int _radioValue) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return new FriendDetail(
        //           _initialLetter, _backgroundColor, _text1, _ammount, _url);
        //     },
        //   ),
        // )
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
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
                        _vehicle,
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
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
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
                      Navigator.maybePop(context);
                    },
                    child: Text(
                      "ATUALIZAR",
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
                'Editar Veículo',
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
                            Container(
                              padding: EdgeInsets.fromLTRB(22, 10, 22, 0),
                              child: TextFormField(
                                controller: _plateController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Placa',
                                  hintText: 'ABC-1234',
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  labelStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(4),
                                  // ),
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
                            Container(
                              padding: EdgeInsets.fromLTRB(22, 16, 22, 0),
                              child: TextFormField(
                                controller: _typeController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Tipo',
                                  hintText: 'Carro, Moto, Caminhão, etc.',
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  labelStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(4),
                                  // ),
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
                            Container(
                              padding: EdgeInsets.fromLTRB(22, 16, 22, 0),
                              child: TextFormField(
                                controller: _brandController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Marca',
                                  hintText: 'Marca do veículo',
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  labelStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(4),
                                  // ),
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
                            Container(
                              padding: EdgeInsets.fromLTRB(22, 16, 22, 0),
                              child: TextFormField(
                                controller: _modelController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Modelo',
                                  hintText: 'Modelo do veículo',
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  labelStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(4),
                                  // ),
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
                            SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      title: Text('Excluir veículo'),
                                      content: Text('Deseja excluir este veículo da sua conta?'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('SIM'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.pushReplacementNamed(
                                                context, '/');
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Excluir',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(
                                            Icons.delete_forever,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
