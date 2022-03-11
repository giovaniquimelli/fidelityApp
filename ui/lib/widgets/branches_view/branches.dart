import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/functions/custom_push.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/branches_view/branch_detail.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';

class Branches extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  const Branches(this._scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BranchesState();
  }
}

class _BranchesState extends State<Branches>
    with AutomaticKeepAliveClientMixin {
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
  }

  void _initialFetch() async {
    _fetchData();
  }

  Future<void> _fetchData() async {
    final _companyBranchProvider =
        Provider.of<CompanyBranchProvider>(context, listen: false);

    if (!_companyBranchProvider.hasInitialized) {
      // _companyBranchProvider.setIsLoading(true);
      await _companyBranchProvider.getAllCompanhyBranches();

      _companyBranchProvider.setInitialized(true);
      // _companyBranchProvider.setIsLoading(false);
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
              return new BranchDetail(_fullAddress, _name);
            },
          ),
        ).then((_) {
          Global.service.aciveScaffoldKey = widget._scaffoldKey;
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

    bool _isLoading = _companyBranchProvider?.isLoading ?? false;

    List<CompanyBranch> _companyBranchList =
        _companyBranchProvider.allCompanhyBranchesList ?? [];

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text(
                    'BRANCHES',
                    style: TextStyle(
                        color: Colors.grey[800],
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
                child: _cardList(_companyBranchList),
              ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding:
//               EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   child: Text(
//                     'FILIAIS',
//                     style: TextStyle(
//                         color: Colors.grey[800],
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Flexible(
//           child: CustomScrollView(
//             slivers: <Widget>[
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     _buildList2(
//                       1,
//                       'Rua Professora Izaura Torres Cruz, 319. Ponta Grossa - PR',
//                       '2,7km',
//                       "https://postocontornocidade.com.br/wp-content/uploads/2017/01/WhatsApp-Image-2018-07-10-at-10.47.44.jpeg",
//                       'Contorno I',
//                     ),
//                     _buildList2(
//                       2,
//                       'Avenida Vincente Machado, 111. Ponta Grossa - PR',
//                       '4,9km',
//                       "https://arede.info/img/normal/230000/normal_00235382_00.jpg",
//                       'Contorno II',
//                     ),
//                     _buildList2(
//                       3,
//                       'Teste de rua com nome comprido Teste de rua com nome comprido Teste de rua com nome comprido, 999. Ponta Grossa - PR',
//                       '8km',
//                       "https://www.postocontorno.com.br/arquivos/2336d97cfd9d69527818f4754273c127.jpg",
//                       'Contorno III',
//                     ),
//                     _buildList2(
//                       4,
//                       'Rua Siqueira Campos 222. Ponta Grossa - PR',
//                       '12km',
//                       "https://arede.info/img/normal/210000/normal_00210752_00.jpg",
//                       'Contorno IV',
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
