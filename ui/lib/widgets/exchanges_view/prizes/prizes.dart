import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui/widgets/extra_components/CustomSquareShimming.dart';
import 'prize_detail.dart';

class Prizes extends StatefulWidget {
  final PageController _myPage;

  const Prizes(this._myPage, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PrizesState();
  }
}

class _PrizesState extends State<Prizes> with AutomaticKeepAliveClientMixin {
  bool keepAlive = true;
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
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: false);

    if (!_exchangeProvider.hasInitialized1) {
      _exchangeProvider.setInitialized1(true);
      _exchangeProvider.setIsLoading1(true);

      final _authProvider = Provider.of<AuthProvider>(context, listen: false);
      _exchangeProvider
          .setAuthenticatedUserId(_authProvider.authenticatedUserId);
      await _exchangeProvider.getRewardList();
      _exchangeProvider.setIsLoading1(false);

      keepAlive = true;
      updateKeepAlive();

      await Future.delayed(Duration(seconds: 90));

      _exchangeProvider.setInitialized1(false);
      keepAlive = false;
      updateKeepAlive();
    }
  }

  Widget _buildRewardCard(Reward _reward) {
    String _rewardName = '';
    String _points = '';

    _rewardName = _reward.name ?? 'Nome do Produto';
    _points = setDecimalPrecision(_reward.points, precision: 2) ?? 'Points';

    return GestureDetector(
      onTap: () {
        // _active
        //     ?
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new PrizeDetail(_reward, widget._myPage);
            },
          ),
        ).then((_) {
          Global.service.aciveScaffoldKey = _scaffoldKey;
        })
            // : print('Prize too expensive')
            ;
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 10, 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomSquareShimming(
              "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-green-select-2019?wid=834&hei=1000&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1566956144838",
              100,
              100,
              active: true,
              radius: 0,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 18, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
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
                        _points,
                        style: TextStyle(
                          fontSize: 16,
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

  Widget _cardList(List<Reward> _rewardList) {
    if (_rewardList.isEmpty) {
      return Center(
        child: Text('Nenhum prêmio encontrado'),
      );
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                _rewardList.length,
                (index) {
                  return _buildRewardCard(_rewardList[index]);
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
    final _exchangeProvider =
        Provider.of<ExchangeProvider>(context, listen: true);

    bool _isLoading1 = _exchangeProvider?.isLoading1 ?? false;

    List<Reward> _rewardList = _exchangeProvider.rewardList ?? [];

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return _isLoading1
        ? Column(
            children: <Widget>[
              LinearProgressIndicator(),
            ],
          )
        : _cardList(_rewardList);
  }

  @override
  bool get wantKeepAlive => keepAlive;
}

// return CustomScrollView(
//       slivers: <Widget>[
//         SliverList(
//           delegate: SliverChildListDelegate(
//             [
//               _buildList(
//                 1,
//                 'Caneta',
//                 '25p',
//                 "https://appelboom.com/image/cache/catalog/Parker/02.%20Premier/parker-premier-black-lacquer-gt-fountain-pen-1074x1074.jpg",
//                 true,
//               ),
//               _buildList(
//                 2,
//                 'Almoço Grátis',
//                 '650p',
//                 "https://www.teclasap.com.br/wp-content/uploads/2011/03/lunch-1.jpg",
//                 true,
//               ),
//               _buildList(
//                 3,
//                 'iPhone X',
//                 '9.000p',
//                 "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRiw7W7iv-ji5BW4fV8NaV4lEPyqM6tcLDKvw&usqp=CAU",
//                 false,
//               ),
//               _buildList(
//                 4,
//                 'Tesla Model 3',
//                 '6.0000p',
//                 "https://cdn.pocket-lint.com/r/s/970x/assets/images/147933-cars-review-tesla-model-3-review-lead-image1-sbkpbfvdsl-jpg.webp",
//                 false,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
