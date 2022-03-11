import 'dart:developer';
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

class EditSharedAccount extends StatefulWidget {
  final Account account;
  const EditSharedAccount(this.account, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditSharedAccountState();
  }
}

class _EditSharedAccountState extends State<EditSharedAccount> {
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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[50],
              title: Text(
                'Editar',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Editar permissões ",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Permitir visualização da pontuação do cartão ',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Switch(
                              value: false,
                              onChanged: ((value) {}),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Permitir realização de trocas',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Switch(
                              value: false,
                              onChanged: ((value) {}),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Exigir placa do veículo para pontuar',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Switch(
                              value: true,
                              onChanged: ((value) {}),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Permitir pontuação em conta diferente da fatura',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Switch(
                              value: false,
                              onChanged: ((value) {}),
                            ),
                          ],
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
                                      borderRadius: BorderRadius.circular(4)),
                                  title: Text('Excluir veículo'),
                                  content: Text(
                                      'Deseja excluir este veículo da sua conta?'),
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
                                  'Excluir compartilhamento',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.cancel,
                                        color: Theme.of(context).primaryColor,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
