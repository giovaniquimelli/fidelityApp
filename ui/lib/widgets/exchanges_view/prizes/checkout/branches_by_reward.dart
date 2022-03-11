import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/exchanges_view/prizes/checkout/checkout.dart';
import 'package:ui/widgets/extra_views/markdown_view.dart';
import 'package:share/share.dart';

class BranchesByReward extends StatefulWidget {
  final Reward _reward;
  final GlobalKey<ScaffoldState> _prizeDetailScaffoldKey;
  const BranchesByReward(this._reward, this._prizeDetailScaffoldKey, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BranchesByRewardState();
  }
}

class _BranchesByRewardState extends State<BranchesByReward> {
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    Global.service.aciveScaffoldKey = _scaffoldKey;
  }

  void _initialFetch() async {
    _fetchData();
  }

  Future<void> _fetchData() async {
    final _companyBranchProvider =
        Provider.of<CompanyBranchProvider>(context, listen: false);

    if (!_companyBranchProvider.hasInitialized2) {
      // _companyBranchProvider.setIsLoading(true);
      await _companyBranchProvider.getBranchesByReward(widget._reward);

      _companyBranchProvider.setIsLoading(false);
      _companyBranchProvider.setInitialized2(true);
    }
  }

  Widget _buildCompanyBranchCard(CompanyBranch _companyBranch) {
    String _name = '';
    String _address = '';
    String _number = '';
    String _complement = '';
    String _district = '';
    String _zipCode = '';
    String _distance = '0km';

    String _fullAddress = '';

    _name = _companyBranch.name ?? 'Filial';
    _address = _companyBranch.address ?? 'Endereço';
    _number = _companyBranch.number.toString() ?? 'Número';
    _complement = _companyBranch.complement ?? 'Complemento';
    _district = _companyBranch.district ?? 'Bairro';
    _zipCode = _companyBranch.zipCode.toString() ?? 'CEP';
    _name = _companyBranch.name ?? 'Filial';

    _fullAddress = _address +
        ', ' +
        _number +
        ', ' +
        _complement +
        ', ' +
        _district +
        ', ' +
        _zipCode;

    return GestureDetector(
      onTap: () {
        // customPush(context, new MaterialPageRoute(
        //   builder: (BuildContext context) {
        //     return new BranchDetail(_address, _branch);
        //   },
        // ), widget._scaffoldKey);
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new Checkout(widget._reward, _fullAddress, _name,
                  _companyBranch, widget._prizeDetailScaffoldKey);
            },
          ),
        ).then((_) {
          Global.service.aciveScaffoldKey = _scaffoldKey;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 18),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // CustomSquareShimming(
              //   'https://postocontornocidade.com.br/wp-content/uploads/2017/01/WhatsApp-Image-2018-07-10-at-10.47.44.jpeg',
              //   double.maxFinite,
              //   145,
              //   radius: 0,
              // ),
              SizedBox(
                height: 12,
              ),
              Text(
                _name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _fullAddress,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                _distance,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardList(List<CompanyBranch> _companyBranchList) {
    if (_companyBranchList.isEmpty) {
      return Center(
        child: Text('Nenhuma filial encontrada'),
      );
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 8, 12, 8),
                        child: Text(
                          'Selecione um local para retirada do prêmio',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                _companyBranchList.length,
                (index) {
                  return _buildCompanyBranchCard(_companyBranchList[index]);
                },
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _companyBranchProvider =
        Provider.of<CompanyBranchProvider>(context, listen: true);

    bool _isLoading2 = _companyBranchProvider?.isLoading2 ?? false;

    List<CompanyBranch> _branchesByRewardList =
        _companyBranchProvider.branchesByRewardList ?? [];

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
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              elevation: 0,
              // title: Text(
              //   'Ativação',
              //   style:
              //       TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              // ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
                onPressed: () {
                  ;
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: _isLoading2
                ? Column(
                    children: <Widget>[
                      LinearProgressIndicator(),
                    ],
                  )
                : _cardList(_branchesByRewardList),
          ),
        ),
      ),
    );
  }
}
