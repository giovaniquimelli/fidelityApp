import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/extra_components/CustomCircleAvatar.dart';
import 'package:ui/widgets/profile_view/cards/vehicles/vehicles_edit.dart';

class Vehicles extends StatefulWidget {
  final bool shared;

  const Vehicles(this.shared, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VehiclesState();
  }
}

class _VehiclesState extends State<Vehicles> {
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
        padding: EdgeInsets.fromLTRB(22, 0, 14, 0),
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
                  Radio(
                    value: _radioValue,
                    groupValue: 0,
                    onChanged: ((i) => {}),
                    activeColor: Global.appConfig.primaryColor,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          _buildList(
            'ARJ-0717',
            'Carro - Toyota Corolla',
            1,
          ),
          SizedBox(
            height: 14,
          ),
          _buildList(
            'AOP-2933',
            'Caminhonete - Nissan Xterra',
            0,
          ),
          SizedBox(
            height: 428,
          ),
          !widget.shared
              ? Container(
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
                            return new VehiclesEdit();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "EDITAR",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
