import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_detail_shared.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicle_add.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicle_edit.dart';
import 'package:ui/widgets/profile_view/referral/friend_detail.dart';
import 'package:ui/widgets/profile_view/referral/referral_code.dart';

class VehiclesEdit extends StatefulWidget {
  const VehiclesEdit({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VehiclesEditState();
  }
}

class _VehiclesEditState extends State<VehiclesEdit> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  Widget _buildList(String _plate, String _type, String _brand, String _model,
      int _radioValue) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new VehicleEdit(_plate, _type, _brand, _model);
            },
          ),
        );
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
                        _brand + '' + _model,
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
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new VehicleAdd();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "ADICIONAR VEÍCULO",
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
              'Editar Veículos',
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
                            'ARJ-0717',
                            'Carro',
                            'Toyota',
                            'Corolla',
                            1,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          _buildList(
                            'AOP-2933',
                            'Caminhonete',
                            'Nissan',
                            'Xterra',
                            0,
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
    );
  }
}
