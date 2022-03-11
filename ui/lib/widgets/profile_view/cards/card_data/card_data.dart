import 'dart:developer';
import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CardData extends StatefulWidget {
  final bool shared;
  final Account account;

  const CardData(this.shared, this.account, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardDataState();
  }
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    // final _authProvider = Provider.of<AuthProvider>(context, listen: true);
    // String _selectedAccountId = _authProvider.selectedAccount?.id ?? '';
    String _personType = 'F';
    String _username = '';
    if ((widget?.account?.legalName ?? '') == '') {
      _personType = 'F';
    } else {
      _personType = 'J';
    }

    var _pointsSum;
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);
    _pointsSum = _authProvider.pointsSumMapByAccountId[widget.account?.id ?? ''] ?? '----';

    _username = widget?.account?.username ?? 'CPF/CNPJ';

    _username = maskUsername(_username, _personType);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            // alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dados pessoais ",
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
                  Text(
                    'Dono do cartão ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.account.fullName,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.account.legalName == '' ? 'CPF' : 'CNPJ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          _username,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dados do cartão ",
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
                  Text(
                    'Código do cartão ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'A287BX',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widget.shared
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pontuação atual ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              _pointsSum.toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
        // widget.account.id != _selectedAccountId ? Positioned(
        //   bottom: 0,
        //   child: Container(
        //     alignment: Alignment.bottomCenter,
        //     width: MediaQuery.of(context).size.width,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Container(
        //           height: 50,
        //           width: MediaQuery.of(context).size.width - 40,
        //           child: RaisedButton(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(4),
        //             ),
        //             color: Theme.of(context).primaryColor,
        //             textColor: Colors.white,
        //             onPressed: () {
        //               _authProvider.setSelectedAccount(widget.account);
        //             },
        //             child: Row(
        //               mainAxisSize: MainAxisSize.max,
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   "UTILIZAR CARTÃO",
        //                   style: TextStyle(
        //                     fontSize: 14.0,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 28,
        //         ),
        //       ],
        //     ),
        //   ),
        // ) : Container(),
      ],
    );
  }
}
