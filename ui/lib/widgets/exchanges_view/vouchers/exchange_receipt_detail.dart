import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';
import 'package:ui/widgets/extra_views/markdown_view.dart';

class ExchangeReceiptDetail extends StatefulWidget {
  final TransactionRecordExchangeRefReward exchangeReceipt;

  const ExchangeReceiptDetail(this.exchangeReceipt, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExchangeReceiptDetailState();
  }
}

class _ExchangeReceiptDetailState extends State<ExchangeReceiptDetail> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  @override
  Widget build(BuildContext context) {
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: false);

    Map<String, Map<String, dynamic>> _receiptDetailsMap =
        _exchangeProvider.receiptDetailsMap ?? {};
    String _companyBranch;
    String _transactionCode;
    _companyBranch = _receiptDetailsMap[widget.exchangeReceipt.id]
            ['companyBranchName'] ??
        'Filial';
    _transactionCode = _receiptDetailsMap[widget.exchangeReceipt.id]
            ['transactionCode'] ??
        '00000000';

    String _rewardName = '';
    String _quantity = '';
    // String _description = '';
    String _points = '';

    _rewardName = widget.exchangeReceipt.reward.name ?? 'Nome do Produto';
    _quantity = widget.exchangeReceipt.quantity ?? 'Quantidade';
    // _description = widget.exchangeReceipt.reward.description ?? 'Descrição';
    _points = setDecimalPrecision(widget.exchangeReceipt.reward.points,
            precision: 2) ??
        'Points';

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            title: Text(
              'Detalhes',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 46,
                    height: MediaQuery.of(context).size.width - 46,
                    child: QrImage(data: _transactionCode),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        double.parse(_quantity).round().toString() +
                            ' ' +
                            _rewardName,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _points + ' Points',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   _description,
                      //   style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      // ),
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
                        _companyBranch,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        height: 16,
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
