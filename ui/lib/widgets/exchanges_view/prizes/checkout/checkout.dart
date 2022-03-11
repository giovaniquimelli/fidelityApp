import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/exchanges_view/vouchers/exchange_receipt_detail.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';

class Checkout extends StatefulWidget {
  final Reward _reward;
  final String _companyBranchFullAddress;
  final String _companyBranchName;
  final CompanyBranch _companyBranch;
  final GlobalKey<ScaffoldState> _prizeDetailScaffoldKey;

  const Checkout(
      this._reward,
      this._companyBranchFullAddress,
      this._companyBranchName,
      this._companyBranch,
      this._prizeDetailScaffoldKey,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CheckoutState();
  }
}

class _CheckoutState extends State<Checkout> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  @override
  Widget build(BuildContext context) {
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: false);

    String _rewardName = '';
    String _points = '';

    _rewardName = widget._reward.name ?? 'Nome do Produto';
    _points =
        setDecimalPrecision(widget._reward.points, precision: 2) ?? 'Points';

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
              onPressed: () {
                if (_loading) {
                  return;
                }
                Navigator.maybePop(context);
              },
            ),
          ),
          body: Stack(
            children: <Widget>[
              Column(
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
                            'Prêmio',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _rewardName,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _points + ' Points',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
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
                            'Local de retirada',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget._companyBranchName,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget._companyBranchFullAddress,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          onPressed: () async {
                            if (_loading) {
                              return;
                            }

                            setState(() {
                              _loading = true;
                            });

                            bool _exchangeSuccess;
                            _exchangeSuccess =
                                await _exchangeProvider.makeExchange(
                                    widget._reward, widget._companyBranch);

                            setState(() {
                              _loading = false;
                            });

                            if (_exchangeSuccess) {
                              _exchangeProvider.setIsLoading2(true);
                              _exchangeProvider.setInitialized2(false);
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/'));
                              Global.service.homePageController.jumpToPage(0);
                            }

                            if (_exchangeProvider.lastTransactionReceipt !=
                                null) {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return new ExchangeReceiptDetail(
                                        _exchangeProvider
                                            .lastTransactionReceipt);
                                  },
                                ),
                              ).then((_) {
                                Global.service.aciveScaffoldKey =
                                    Global.service.homeScaffoldKey;
                              });

                              final _authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);
                              _authProvider.setInitialized(false);
                              _authProvider.notify();
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _loading ? "AGUARDE..." : "CONFIRMAR TROCA",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
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
