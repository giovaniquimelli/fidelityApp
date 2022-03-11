import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ui/widgets/exchanges_view/vouchers/exchange_receipt_detail.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';

class ExchangeReceipts extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const ExchangeReceipts(this._scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExchangeReceiptsState();
  }
}

class _ExchangeReceiptsState extends State<ExchangeReceipts>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController = ScrollController();
  int _firstItem = Global.appConfig.receiptsPaginationLength;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialFetch();
    });
  }

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = widget._scaffoldKey;

    _scrollController.addListener(
      () async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (Provider.of<ExchangeProvider>(context, listen: false)
              .reachedPaginationEnd) {
            showSnackBar('Não há mais comprovantes a serem carregados');
            return;
          }
          if (await getMoreData()) {
            _firstItem = _firstItem + Global.appConfig.receiptsPaginationLength;

            print('More data fetched OK');
          }
        }
      },
    );
  }

  Future<void> _fetchData() async {
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: false);

    if (!_exchangeProvider.hasInitialized2) {
      final _authProvider = Provider.of<AuthProvider>(context, listen: false);
      _exchangeProvider
          .setAuthenticatedUserId(_authProvider.authenticatedUserId);

      // _companyBranchProvider.setIsLoading2(true);
      await _exchangeProvider.getExchangeReceiptList();

      _exchangeProvider.setInitialized2(true);
      _exchangeProvider.setIsLoading2(false);
    }
  }

  Future<bool> getMoreData() async {
    print('Try fetching more data');

    return await Provider.of<ExchangeProvider>(context, listen: false)
        .fetchExchangeReceiptList(
            true, Global.appConfig.receiptsPaginationLength, _firstItem);
  }

  void _initialFetch() async {
    _fetchData();
  }
  // static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildExchangeReceiptCard(
      TransactionRecordExchangeRefReward _exchangeReceipt,
      Map<String, Map<String, dynamic>> _receiptDetailsMap) {
    String _rewardName = '';
    String _quantity = '';
    String _month;
    String _day;
    String _customDate;

    String _companyBranch;
    String _transactionCode;

    _rewardName = _exchangeReceipt.reward.name ?? 'Nome do Produto';
    _quantity = _exchangeReceipt.quantity ?? 'Quantidade';
    if (_exchangeReceipt.createdAt != null) {
      _month = parsedMonth(_exchangeReceipt.createdAt) ?? 'Mês';
    } else {
      _month = 'Mês';
    }
    if (_exchangeReceipt.createdAt != null) {
      _day = parsedDay(_exchangeReceipt.createdAt) ?? '00';
    } else {
      _day = 'Dia';
    }

    _customDate = _day + ' de ' + _month;

    _companyBranch = _receiptDetailsMap[_exchangeReceipt.id]
            ['companyBranchName'] ??
        'Filial';
    _transactionCode = _receiptDetailsMap[_exchangeReceipt.id]
            ['transactionCode'] ??
        '00000000';

    return GestureDetector(
      onTap: () {
        // _active
        //     ?
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new ExchangeReceiptDetail(_exchangeReceipt);
            },
          ),
        ).then((_) {
          Global.service.aciveScaffoldKey = widget._scaffoldKey;
        })
            // : print('Brinde já resgatado')
            ;
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 10, 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: QrImage(data: _transactionCode),
            ),
            // ColorFiltered(
            //   colorFilter:
            //   // !_active
            //       // ? ColorFilter.mode(
            //       //     Colors.white.withOpacity(0.7), BlendMode.plus)
            //       // :
            //       ColorFilter.mode(
            //           Colors.white.withOpacity(0), BlendMode.plus),
            //   child: CustomSquareShimming(
            //     _url,
            //     100,
            //     100,
            //     radius: 0,
            //   ),
            // ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 18, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        double.parse(_quantity).round().toString() +
                            ' ' +
                            _rewardName,
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              // !_active ? Colors.grey[600] :
                              Colors.black,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        _customDate,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              // !_active ? Colors.grey[600] :
                              Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardList(
      List<TransactionRecordExchangeRefReward> _exchangeReceiptList,
      Map<String, Map<String, dynamic>> _receiptDetailsMap) {
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: false);

    Widget content = Container();

    if (_exchangeReceiptList.isEmpty) {
      content = Center(
        child: Text('Nenhum comprovante encontrado'),
      );
    } else {
      content = CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                _exchangeProvider.reachedPaginationEnd
                    ? _exchangeReceiptList.length
                    : _exchangeReceiptList.length + 1,
                (index) {
                  if (!_exchangeProvider.reachedPaginationEnd &&
                      index == _exchangeReceiptList.length) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return _buildExchangeReceiptCard(
                      _exchangeReceiptList[index], _receiptDetailsMap);
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 46,
              ),
            ]),
          ),
        ],
      );
    }

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        _exchangeProvider.setInitialized2(false);
        // _exchangeProvider.setIsLoading2(true);
        _firstItem = Global.appConfig.receiptsPaginationLength;
        await _fetchData();
      },
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: true);

    bool _isLoading2 = _exchangeProvider?.isLoading2 ?? false;

    List<TransactionRecordExchangeRefReward> _exchangeReceiptList =
        _exchangeProvider.exchangeReceiptList ?? [];

    Map<String, Map<String, dynamic>> _receiptDetailsMap =
        _exchangeProvider.receiptDetailsMap ?? {};

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return _isLoading2
        ? Column(
            children: <Widget>[
              LinearProgressIndicator(),
            ],
          )
        : _cardList(_exchangeReceiptList, _receiptDetailsMap);
  }

  @override
  bool get wantKeepAlive => true;
}

// @override
//   Widget build(BuildContext context) {
//     final _exchangeProvider =
//         Provider.of<ExchangeProvider>(context, listen: true);

//     bool _isLoading2 = _exchangeProvider?.isLoading2 ?? false;

//     List<TransactionRecordExchangeRefReward> _exchangeReceiptList =
//         _exchangeProvider.exchangeReceiptList ?? [];

//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//     return CustomScrollView(
//       slivers: <Widget>[
//         SliverList(
//           delegate: SliverChildListDelegate(
//             [
//               _buildList(
//                 1,
//                 'Caneta',
//                 '31/07/2020',
//                 "https://raw.githubusercontent.com/zpao/qrcode.react/64ab1ce2895baae6f5715829306b0dba9c97258d/qrcode.png",
//                 true,
//               ),
//               _buildList(
//                 2,
//                 'Almoço Grátis',
//                 '23/06/2020',
//                 "https://raw.githubusercontent.com/zpao/qrcode.react/64ab1ce2895baae6f5715829306b0dba9c97258d/qrcode.png",
//                 true,
//               ),
//               _buildList(
//                 3,
//                 'Caneta',
//                 '05/04/2020',
//                 "https://raw.githubusercontent.com/zpao/qrcode.react/64ab1ce2895baae6f5715829306b0dba9c97258d/qrcode.png",
//                 false,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
