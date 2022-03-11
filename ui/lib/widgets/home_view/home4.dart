import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';
import 'package:ui/widgets/profile_view/benefits/benefits.dart';
import 'package:ui/widgets/profile_view/cards/card_detail.dart';
import 'package:ui/widgets/profile_view/cards/card_list.dart';
import 'package:ui/widgets/profile_view/notifications/notifications.dart';
import 'package:ui/widgets/profile_view/referral/referral.dart';
import 'package:ui/widgets/transactions_view/transactions/purchase_transaction_detail.dart';

class Home4 extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final PageController _pageController;

  const Home4(this._scaffoldKey, this._pageController, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home4State();
  }
}

class _Home4State extends State<Home4> with AutomaticKeepAliveClientMixin {
  bool keepAlive = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _fetchData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialFetch();
    });
  }

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _initialFetch();
    // });
    // Future.delayed(const Duration(milliseconds: 300), () {
    //   _initialFetch();
    // });
  }

  void _initialFetch() async {
    _fetchData();
  }

  void _fetchData() async {
    final _authProvider = Provider.of<AuthProvider>(context, listen: true);

    if (!_authProvider.hasInitialized) {
      _authProvider.setInitialized(true);
      _authProvider.setIsLoading(true);

      await _authProvider.getAllAccounts();
      await _authProvider.getAllAccountCodes();

      final _transactionRecordProvider =
          Provider.of<TransactionRecordProvider>(context, listen: false);
      _transactionRecordProvider
          .setAuthenticatedUserId(_authProvider.authenticatedUserId);
      await _transactionRecordProvider.getTransactionRecordList();
      _transactionRecordProvider.setInitialized(true);
      _transactionRecordProvider.setIsLoading(false);

      _authProvider.setIsLoading(false);

      keepAlive = true;
      updateKeepAlive();

      await Future.delayed(Duration(seconds: 90));

      _authProvider.setInitialized(false);
      keepAlive = false;
      updateKeepAlive();
    }
  }

  String _getAccountCode(Account _account) {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (_account.id == null) {
      return '00000000';
    }
    return _authProvider.getAccountCode(_account.id);
  }

  String _dashAccountCode(String _code) {
    String _dashedCode = '';
    try {
      _dashedCode = _code.substring(0, 3) +
          '-' +
          _code.substring(3, 6) +
          '-' +
          _code.substring(6);
    } catch (e) {
      _dashedCode = '000-000-00';
    }

    return _dashedCode;
  }

  Widget _buildTransactionRecordCard(TransactionRecord _transactionRecord) {
    int _type = 0;
    String _month;
    String _day;
    String _customDate;
    String _points = '';
    bool _isPositive = true;
    String _branchName = '';

    List<String> _transactionRecordType = [
      'Purchase',
      'Exchange',
      'Referral',
      'Sorteio',
      'Transferência',
      'Travada',
      'Estorno',
      'Expirada',
    ];

    _type = _transactionRecord.transactionType ?? 'Nome do Produto';
    if (_transactionRecord.localDateTime != null) {
      _month = parsedMonth(_transactionRecord.localDateTime) ?? 'Mês';
    } else {
      _month = 'Mês';
    }
    if (_transactionRecord.localDateTime != null) {
      _day = parsedDay(_transactionRecord.localDateTime) ?? '00';
    } else {
      _day = 'Dia';
    }
    _points = setDecimalPrecision(_transactionRecord.points, precision: 2) ??
        'Points';
    _isPositive = double.parse(_points) >= 0;
    _branchName = _transactionRecord.companyBranch?.name ?? 'Nome da Filial';

    _customDate = _day + ' de ' + _month;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new PurchaseTransactionDetail(
                _customDate,
                _transactionRecordType[_type],
                _branchName,
                _points,
              );
            },
          ),
        ).then((_) {
          Global.service.aciveScaffoldKey = widget._scaffoldKey;
        });
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
        margin: EdgeInsets.fromLTRB(13, 0, 14, 20),
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
                  color: _isPositive
                      ? Colors.greenAccent[400]
                      : Colors.redAccent[400],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _transactionRecordType[_type],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            _customDate,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 14, 0),
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
                              _points,
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

  Widget _buildCardSummary(Account _account) {
    String _code = _getAccountCode(_account);

    return Dialog(
      insetPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: (MediaQuery.of(context).size.width - 75) * 0.67,
                color: Global.appConfig.primaryColor,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: MediaQuery.of(context).size.width / 2.7,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: QrImage(data: _code),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _dashAccountCode(_code),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                color: Colors.grey[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'RETURN',
                          style: TextStyle(
                              color: Global.appConfig.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new CardDetail(_account);
                            },
                          ),
                        ).then((_) {
                          Global.service.aciveScaffoldKey = widget._scaffoldKey;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'MORE',
                          style: TextStyle(
                              color: Global.appConfig.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double _cardHeight = (MediaQuery.of(context).size.width - 48) * 0.65;
    final double _cardWidth = MediaQuery.of(context).size.width - 48;

    String _mainAccountId = '';
    var _pointsSum;

    final _authProvider = Provider.of<AuthProvider>(context, listen: true);
    final _transactionRecordProvider =
        Provider.of<TransactionRecordProvider>(context, listen: true);

    bool _isLoading = _authProvider?.isLoading ?? true;
    bool _isTransactionRecordLoading =
        _transactionRecordProvider?.isLoading ?? true;
    List<Account> _accountList =
        _authProvider.allAccountsList ?? [new Account()];
    List<TransactionRecord> _transactionRecordList =
        _transactionRecordProvider.transactionRecordList ?? [];

    String _fullName;
    _mainAccountId = _authProvider.mainAccount?.id ?? '0';
    _pointsSum =
        _authProvider.pointsSumMapByAccountId[_mainAccountId] ?? '----';
    _fullName = _authProvider.mainAccount?.fullName ?? 'Nome completo';
    // _fullName = _authProvider.selectedAccount?.fullName ?? 'Nome completo';

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Global.appConfig.primaryColor,
          padding:
              EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text(
                    Global.appConfig.company.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        _isLoading
            ? Column(
                children: <Widget>[
                  LinearProgressIndicator(),
                ],
              )
            : Flexible(
                child: CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          // Colored and grey background behind the card
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: (_cardHeight * 0.65) + 20,
                                color: Global.appConfig.primaryColor,
                                // color: Colors.redAccent[400]),
                              ),
                              Container(
                                color: Colors.grey[50],
                                height: (_cardHeight * 0.35) + 20,
                              ),
                            ],
                          ),
                          // Card
                          Positioned(
                            width: MediaQuery.of(context).size.width,
                            bottom: 14,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[50],
                                      offset: Offset(0, 0), //(x,y)
                                      blurRadius: 2,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                height: _cardHeight,
                                width: _cardWidth,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Global.appConfig.primaryColor,
                                  onPressed: () {
                                    _accountList.length == 1
                                        ? showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return _buildCardSummary(
                                                  _accountList[0]);
                                            },
                                          )
                                        : Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return new CardList();
                                                },
                                                fullscreenDialog: true),
                                          ).then((_) {
                                            Global.service.aciveScaffoldKey =
                                                widget._scaffoldKey;
                                          });
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 18,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      _pointsSum.toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 34,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'POINTS',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                // CustomSquareShimming(
                                                //     'https://i.imgur.com/Ck0CKsi.png',
                                                //     100,
                                                //     100),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(_fullName,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            SizedBox(
                                              height: 22,
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
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 7, 24, 22),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return new Notifications();
                                            },
                                            fullscreenDialog: true),
                                      ).then((_) {
                                        Global.service.aciveScaffoldKey =
                                            widget._scaffoldKey;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[400],
                                            offset: Offset(0.0, 1), //(x,y)
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      width: 130,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Container(
                                          color: Colors.white,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.notifications_none,
                                                  color: Colors.grey[600],
                                                  size: 24,
                                                ),
                                                Text(
                                                  'Notifications',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return new Referral();
                                            },
                                            fullscreenDialog: true),
                                      ).then((_) {
                                        Global.service.aciveScaffoldKey =
                                            widget._scaffoldKey;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[400],
                                            offset: Offset(0.0, 1), //(x,y)
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      width: 130,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Container(
                                          color: Colors.white,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.group_add,
                                                  color: Colors.grey[600],
                                                  size: 24,
                                                ),
                                                Text(
                                                  'Referrals',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return new Benefits();
                                            },
                                            fullscreenDialog: true),
                                      ).then((_) {
                                        Global.service.aciveScaffoldKey =
                                            widget._scaffoldKey;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[400],
                                            offset: Offset(0.0, 1), //(x,y)
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      width: 130,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Container(
                                          color: Colors.white,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  color: Colors.grey[600],
                                                  size: 24,
                                                ),
                                                Text(
                                                  'Coupons',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _isTransactionRecordLoading
                        ? SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  // decoration: BoxDecoration(color: Colors.grey[200]),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                )
                              ],
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildListDelegate(
                              _transactionRecordList.isEmpty
                                  ? [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // decoration: BoxDecoration(color: Colors.grey[200]),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 14, 0, 0),
                                          child: Center(
                                            child: Text(
                                                'Nenhum comprovante encontrado'),
                                          ),
                                        ),
                                      )
                                    ]
                                  : List.generate(
                                      _transactionRecordList.length > 6
                                          ? 6
                                          : _transactionRecordList.length,
                                      (index) {
                                        return _buildTransactionRecordCard(
                                            _transactionRecordList[index]);
                                      },
                                    ),
                            ),
                          ),
                    _isTransactionRecordLoading
                        ? SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Container(),
                              ],
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildListDelegate(
                                _transactionRecordList.isEmpty
                                    ? [
                                        Container(),
                                      ]
                                    : _transactionRecordList.length > 6
                                        ? [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              // decoration: BoxDecoration(color: Colors.grey[200]),
                                              child: GestureDetector(
                                                behavior:
                                                    HitTestBehavior.opaque,
                                                onTap: () {
                                                  widget._pageController
                                                      .jumpToPage(1);

                                                  // Global.service
                                                  //     .homePageController
                                                  //     .jumpToPage(1);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 8, 0, 56),
                                                  child: Center(
                                                    child: Text(
                                                      'Ver mais comprovantes',
                                                      style: TextStyle(
                                                          color: Global
                                                              .appConfig
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]
                                        : [
                                            Container(),
                                          ]),
                          ),
                  ],
                ),
              ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => keepAlive;
}
