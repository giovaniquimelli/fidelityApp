import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'purchase_transaction_detail.dart';

class AllTransactions extends StatefulWidget {
  /// type of transaction
  /// All: 0
  /// Positive: 1
  /// Negative: -1
  final int _type;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  const AllTransactions(this._type, this._scaffoldKey, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AllTransactionsState();
  }
}

class _AllTransactionsState extends State<AllTransactions> {
  ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(
      () async {
        final _transactionRecordProvider =
            Provider.of<TransactionRecordProvider>(context, listen: true);
        bool _reachedPaginationEnd = false;

        if (widget._type == 1) {
          _reachedPaginationEnd =
              _transactionRecordProvider.reachedPositivePaginationEnd ?? false;
        } else if (widget._type == -1) {
          _reachedPaginationEnd =
              _transactionRecordProvider.reachedNegativePaginationEnd ?? false;
        } else {
          _reachedPaginationEnd =
              _transactionRecordProvider.reachedAllPaginationEnd ?? false;
        }

        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (_reachedPaginationEnd) {
            showSnackBar('Não há mais comprovantes a serem carregados');
            return;
          }
          if (await getMoreData()) {
            _transactionRecordProvider.updateFirstPaginationItem(widget._type);
            _transactionRecordProvider.notify();
            print('More data fetched OK');
          }
        }
      },
    );
  }

  Future<bool> getMoreData() async {
    print('Try fetching more data');

    final _transactionRecordProvider =
        Provider.of<TransactionRecordProvider>(context, listen: true);

    int _firstItem = 0;

    if (widget._type == 1) {
      _firstItem = _transactionRecordProvider.firstPositiveItem ?? 7;
    } else if (widget._type == -1) {
      _firstItem = _transactionRecordProvider.firstNegativeItem ?? 7;
    } else {
      _firstItem = _transactionRecordProvider.firstAllItem ?? 7;
    }

    return await _transactionRecordProvider.fetchTransactionRecordList(true,
        Global.appConfig.receiptsPaginationLength, _firstItem, widget._type);
  }

  Widget _buildTransactionRecordCard(
      TransactionRecord _transactionRecord, int _index) {
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
    _month = parsedMonth(_transactionRecord.localDateTime) ?? 'Mês';
    _day = parsedDay(_transactionRecord.localDateTime) ?? '00';
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
        margin: EdgeInsets.fromLTRB(13, _index == 0 ? 12 : 0, 14, 20),
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

  @override
  Widget build(BuildContext context) {
    final _transactionRecordProvider =
        Provider.of<TransactionRecordProvider>(context, listen: true);

    bool _isTransactionRecordLoading =
        _transactionRecordProvider?.isLoading ?? true;

    List<TransactionRecord> _listToUse = [];
    if (widget._type == 1) {
      _listToUse =
          _transactionRecordProvider.transactionRecordListPositive ?? [];
    } else if (widget._type == -1) {
      _listToUse =
          _transactionRecordProvider.transactionRecordListNegative ?? [];
    } else {
      _listToUse = _transactionRecordProvider.transactionRecordList ?? [];
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    bool _reachedPaginationEnd = false;

    if (widget._type == 1) {
      _reachedPaginationEnd =
          _transactionRecordProvider.reachedPositivePaginationEnd ?? false;
    } else if (widget._type == -1) {
      _reachedPaginationEnd =
          _transactionRecordProvider.reachedNegativePaginationEnd ?? false;
    } else {
      _reachedPaginationEnd =
          _transactionRecordProvider.reachedAllPaginationEnd ?? false;
    }

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        await Provider.of<TransactionRecordProvider>(context, listen: true)
            .getTransactionRecordList();
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          _isTransactionRecordLoading
              ? SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    ],
                  ),
                )
              : SliverList(
                  delegate: SliverChildListDelegate(
                    _listToUse.isEmpty
                        ? [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // decoration: BoxDecoration(color: Colors.grey[200]),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                child: Center(
                                  child: Text('Nenhum comprovante encontrado'),
                                ),
                              ),
                            )
                          ]
                        : List.generate(
                            _reachedPaginationEnd
                                ? _listToUse.length
                                : _listToUse.length + 1,
                            (index) {
                              if (!_reachedPaginationEnd &&
                                  index == _listToUse.length) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              return _buildTransactionRecordCard(
                                  _listToUse[index], index);
                            },
                          ),
                  ),
                ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 46,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
