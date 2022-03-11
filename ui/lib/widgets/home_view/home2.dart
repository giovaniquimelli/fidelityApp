import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/widgets/profile_view/cards/card_list.dart';
import 'package:ui/widgets/transactions_view/transactions/purchase_transaction_detail.dart';

class Home2 extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final PageController _pageController;

  const Home2(this._scaffoldKey, this._pageController, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home2State();
  }
}

class _Home2State extends State<Home2> {
  Widget _buildList2(
      Color _firstColor,
      bool showSecond,
      String _text,
      String _date,
      Icon _icon,
      Text _symbol,
      int _value,
      bool _referral,
      bool _exchange) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // Navigator.push(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return new PurchaseTransactionDetail(
        //           'https://postocontornocidade.com.br/wp-content/uploads/2017/01/WhatsApp-Image-2018-07-10-at-10.47.44.jpeg',
        //           _value,
        //           _text,
        //           _date,
        //           'Rua Professora Izaura Torres Cruz, 319. Ponta Grossa - PR',
        //           _referral,
        //           _exchange);
        //     },
        //   ),
        // ).then((_) {
        //   Global.service.aciveScaffoldKey = widget._scaffoldKey;
        // });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              offset: Offset(0.0, 1), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        margin: EdgeInsets.fromLTRB(12, 15, 16, 5),
        // width: MediaQuery.of(context).size.width - 32,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 8,
                  color: _firstColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _text,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            _date,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            // _symbol,
                            Text(
                              '$_value',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Text(
                                'p',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _cardHeight = (MediaQuery.of(context).size.width - 60) * 0.65;
    final double _cardWidth = MediaQuery.of(context).size.width - 60;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight:
              MediaQuery.of(context).padding.top + 20 + _cardHeight + 26,
          title: Text(
            Global.appConfig.company.toUpperCase(),
            style: TextStyle(fontSize: 14),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: (_cardHeight * 0.65) +
                          59 +
                          MediaQuery.of(context).padding.top,
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors: [
                      //       Global.config.primaryColor,
                      //       Global.config.primaryColor
                      //     ],
                      //   ),
                      // ),
                      // color: Colors.redAccent[400]),
                    ),
                    Container(
                      color: Colors.grey[50],
                      height: (_cardHeight * 0.35) + 31,
                    ),
                  ],
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 24,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[50],
                            offset: Offset(0, 0), //(x,y)
                            blurRadius: 2,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      height: (MediaQuery.of(context).size.width - 60) * 0.65,
                      width: (MediaQuery.of(context).size.width - 60),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Global.appConfig.primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return new CardList();
                                },
                                fullscreenDialog: true),
                          ).then((_) {
                            Global.service.aciveScaffoldKey =
                                widget._scaffoldKey;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '8750',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'PONTOS',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Giovani Quimelli',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                  ),
                ),
              ],
            ),
            // titlePadding: EdgeInsets.zero,
            // title: Text(
            //   "US\$ 123.456.78",
            // ),
            // centerTitle: true,
          ),
          // backgroundColor: Colors.grey[50],
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _buildList2(
                Colors.greenAccent[400],
                true,
                'Abastecimento',
                '18/07/2020',
                Icon(
                  Icons.local_gas_station,
                  color: Colors.grey[600],
                  size: 32,
                ),
                Text(
                  '+ ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.greenAccent[400],
                  ),
                ),
                160,
                false,
                false,
              ),
              _buildList2(
                Colors.redAccent[400],
                true,
                'Troca',
                '12/07/2020',
                Icon(
                  Icons.money_off,
                  color: Colors.grey[600],
                  size: 32,
                ),
                Text(
                  '- ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.redAccent[400],
                  ),
                ),
                620,
                false,
                true,
              ),
              _buildList2(
                  Colors.greenAccent[400],
                  true,
                  'Indicação',
                  '20/07/2020',
                  Icon(
                    Icons.person,
                    color: Colors.grey[600],
                    size: 32,
                  ),
                  Text(
                    '+ ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.greenAccent[400],
                    ),
                  ),
                  25,
                  true,
                  false),
              _buildList2(
                Colors.greenAccent[400],
                true,
                'Abastecimento',
                '27/06/2020',
                Icon(
                  Icons.local_gas_station,
                  color: Colors.grey[600],
                  size: 32,
                ),
                Text(
                  '+ ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.greenAccent[400],
                  ),
                ),
                185,
                false,
                false,
              ),
              _buildList2(
                Colors.greenAccent[400],
                true,
                'Abastecimento',
                '25/06/2020',
                Icon(
                  Icons.local_gas_station,
                  color: Colors.grey[600],
                  size: 32,
                ),
                Text(
                  '+ ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.greenAccent[400],
                  ),
                ),
                145,
                false,
                false,
              ),
              _buildList2(
                  Colors.redAccent[400],
                  true,
                  'Troca',
                  '15/06/2020',
                  Icon(
                    Icons.money_off,
                    color: Colors.grey[600],
                    size: 32,
                  ),
                  Text(
                    '- ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent[400],
                    ),
                  ),
                  800,
                  false,
                  true),
              _buildList2(
                Colors.greenAccent[400],
                true,
                'Indicação',
                '25/06/2020',
                Icon(
                  Icons.person,
                  color: Colors.grey[600],
                  size: 32,
                ),
                Text(
                  '+ ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.greenAccent[400],
                  ),
                ),
                35,
                true,
                false,
              ),
              _buildList2(
                Colors.greenAccent[400],
                false,
                'Indicação',
                '25/06/2020',
                Icon(
                  Icons.person,
                  color: Colors.grey[600],
                  size: 32,
                ),
                Text(
                  '+ ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.greenAccent[400],
                  ),
                ),
                60,
                true,
                false,
              ),
              // _buildList(
              //     false,
              //     true,
              //     'Abastecimento',
              //     '18/07/2020',
              //     Icon(
              //       Icons.local_gas_station,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '+ ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.greenAccent[400],
              //       ),
              //     ),
              //     160),
              // _buildList(
              //     true,
              //     true,
              //     'Troca',
              //     '12/07/2020',
              //     Icon(
              //       Icons.money_off,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '- ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.redAccent[400],
              //       ),
              //     ),
              //     620),
              // _buildList(
              //     true,
              //     true,
              //     'Indicação',
              //     '20/07/2020',
              //     Icon(
              //       Icons.person,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '+ ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.greenAccent[400],
              //       ),
              //     ),
              //     25),
              // _buildList(
              //     true,
              //     true,
              //     'Abastecimento',
              //     '27/06/2020',
              //     Icon(
              //       Icons.local_gas_station,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '+ ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.greenAccent[400],
              //       ),
              //     ),
              //     185),
              // _buildList(
              //     true,
              //     true,
              //     'Abastecimento',
              //     '25/06/2020',
              //     Icon(
              //       Icons.local_gas_station,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '+ ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.greenAccent[400],
              //       ),
              //     ),
              //     145),
              // _buildList(
              //     true,
              //     true,
              //     'Troca',
              //     '15/06/2020',
              //     Icon(
              //       Icons.money_off,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '- ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.redAccent[400],
              //       ),
              //     ),
              //     800),
              // _buildList(
              //     true,
              //     true,
              //     'Indicação',
              //     '25/06/2020',
              //     Icon(
              //       Icons.person,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '+ ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.greenAccent[400],
              //       ),
              //     ),
              //     35),
              // _buildList(
              //     true,
              //     false,
              //     'Indicação',
              //     '25/06/2020',
              //     Icon(
              //       Icons.person,
              //       color: Colors.grey[600],
              //       size: 32,
              //     ),
              //     Text(
              //       '+ ',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.greenAccent[400],
              //       ),
              //     ),
              //     60),
            ],
          ),
        ),
      ],
    );
  }
}

// before sliverappbartry

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Home extends StatefulWidget {
//   final PageController _pageController;

//   const Home(this._pageController, {Key key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _HomeState();
//   }
// }

// class _HomeState extends State<Home> {
//   Widget _buildList(bool showFirst, bool showSecond, String _text, String _date,
//       Icon _icon, Text _symbol, int _value, ) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.fromLTRB(22, 0, 14, 0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   color: showFirst ? Colors.grey[600] : Colors.transparent,
//                   height: 24,
//                   width: 2,
//                 ),
//                 _icon,
//                 Container(
//                   color: showSecond ? Colors.grey[600] : Colors.transparent,
//                   height: 24,
//                   width: 2,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       _text,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       _date,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ]),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 8, 24, 8),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       _symbol,
//                       Text(
//                         '$_value',
//                         style: TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 1),
//                         child: Text(
//                           'p',
//                           style: TextStyle(
//                             fontSize: 11,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildList2(Color _firstColor, bool showSecond, String _text,
//       String _date, Icon _icon, Text _symbol, int _value) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(12, 15, 16, 5),
//       // width: MediaQuery.of(context).size.width - 32,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(4),
//         child: Container(
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 height: 75,
//                 width: 8,
//                 color: _firstColor,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           _text,
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 6,
//                         ),
//                         Text(
//                           _date,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ]),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           // _symbol,
//                           Text(
//                             '$_value',
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 0),
//                             child: Text(
//                               'p',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
//     return Column(
//       children: <Widget>[
//         Stack(
//           overflow: Overflow.visible,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       // gradient: LinearGradient(
//                       //   begin: Alignment.topLeft,
//                       //   end: Alignment.bottomRight,
//                       //   colors: [Colors.redAccent[400], Colors.redAccent[400]],
//                       // ),
//                       color: Colors.redAccent[400]),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(
//                         20, MediaQuery.of(context).padding.top + 24, 20, 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'Rede de Postos Contorno',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.w500),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Meus pontos',
//                           style: TextStyle(color: Colors.white, fontSize: 14),
//                         ),
//                         Text(
//                           '8750.00',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 26,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//               ],
//             ),
//             Positioned(
//               width: MediaQuery.of(context).size.width,
//               bottom: 0,
//               child: Center(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       height: 50,
//                       // width: MediaQuery.of(context).size.width - 48,
//                       constraints: BoxConstraints(
//                           minWidth: MediaQuery.of(context).size.width / 1.5,
//                           maxWidth: MediaQuery.of(context).size.width * 0.95),

//                       child: RaisedButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         color: Colors.white,
//                         textColor: Colors.black,
//                         onPressed: () {
//                           widget._pageController.jumpToPage(0);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
//                           child: Text(
//                             "Troque seus pontos!",
//                             style: TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//         Flexible(
//           child: CustomScrollView(
//             slivers: <Widget>[
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     _buildList2(
//                         Colors.greenAccent[400],
//                         true,
//                         'Abastecimento',
//                         '18/07/2020',
//                         Icon(
//                           Icons.local_gas_station,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         160),
//                     _buildList2(
//                         Colors.redAccent[400],
//                         true,
//                         'Troca',
//                         '12/07/2020',
//                         Icon(
//                           Icons.money_off,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '- ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.redAccent[400],
//                           ),
//                         ),
//                         620),
//                     _buildList2(
//                         Colors.greenAccent[400],
//                         true,
//                         'Indicação',
//                         '20/07/2020',
//                         Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         25),
//                     _buildList2(
//                         Colors.greenAccent[400],
//                         true,
//                         'Abastecimento',
//                         '27/06/2020',
//                         Icon(
//                           Icons.local_gas_station,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         185),
//                     _buildList2(
//                         Colors.greenAccent[400],
//                         true,
//                         'Abastecimento',
//                         '25/06/2020',
//                         Icon(
//                           Icons.local_gas_station,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         145),
//                     _buildList2(
//                         Colors.redAccent[400],
//                         true,
//                         'Troca',
//                         '15/06/2020',
//                         Icon(
//                           Icons.money_off,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '- ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.redAccent[400],
//                           ),
//                         ),
//                         800),
//                     _buildList2(
//                         Colors.greenAccent[400],
//                         true,
//                         'Indicação',
//                         '25/06/2020',
//                         Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         35),
//                     _buildList2(
//                         Colors.greenAccent[400],
//                         false,
//                         'Indicação',
//                         '25/06/2020',
//                         Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         60),
//                     _buildList(
//                         false,
//                         true,
//                         'Abastecimento',
//                         '18/07/2020',
//                         Icon(
//                           Icons.local_gas_station,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         160),
//                     _buildList(
//                         true,
//                         true,
//                         'Troca',
//                         '12/07/2020',
//                         Icon(
//                           Icons.money_off,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '- ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.redAccent[400],
//                           ),
//                         ),
//                         620),
//                     _buildList(
//                         true,
//                         true,
//                         'Indicação',
//                         '20/07/2020',
//                         Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         25),
//                     _buildList(
//                         true,
//                         true,
//                         'Abastecimento',
//                         '27/06/2020',
//                         Icon(
//                           Icons.local_gas_station,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         185),
//                     _buildList(
//                         true,
//                         true,
//                         'Abastecimento',
//                         '25/06/2020',
//                         Icon(
//                           Icons.local_gas_station,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         145),
//                     _buildList(
//                         true,
//                         true,
//                         'Troca',
//                         '15/06/2020',
//                         Icon(
//                           Icons.money_off,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '- ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.redAccent[400],
//                           ),
//                         ),
//                         800),
//                     _buildList(
//                         true,
//                         true,
//                         'Indicação',
//                         '25/06/2020',
//                         Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         35),
//                     _buildList(
//                         true,
//                         false,
//                         'Indicação',
//                         '25/06/2020',
//                         Icon(
//                           Icons.person,
//                           color: Colors.grey[600],
//                           size: 32,
//                         ),
//                         Text(
//                           '+ ',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.greenAccent[400],
//                           ),
//                         ),
//                         60),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
