import 'dart:developer';

import 'package:core/dto/account_authenticationDTO.dart';
import 'package:core/dto/account_quick_registerDTO.dart';
import 'package:core/entities/entities.dart';
import 'package:core/gateway/gateway_routes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:core/providers/auth_provider.dart' as auth;

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../global.dart';

import '../gateway/gateway.dart';
import '../core.dart';

class ExchangeProvider with ChangeNotifier {
  List<Reward> _rewardList = [];
  List<TransactionRecordExchangeRefReward> _exchangeReceiptList = [];
  TransactionRecordExchangeRefReward _lastTransactionReceipt;

  Map<String, Map<String, dynamic>> _receiptDetailsMap = {};

  // auth variables
  String _authenticatedUserId = '';

  // functional variables
  bool _isLoading1 = true;
  bool _hasInitialized1 = false;
  bool _isLoading2 = true;
  bool _hasInitialized2 = false;
  bool _reachedPaginationEnd = false;

  List<TransactionRecordExchangeRefReward> get exchangeReceiptList {
    return _exchangeReceiptList;
  }

  Map<String, Map<String, dynamic>> get receiptDetailsMap {
    return _receiptDetailsMap;
  }

  TransactionRecordExchangeRefReward get lastTransactionReceipt {
    return _lastTransactionReceipt;
  }

  List<Reward> get rewardList {
    return _rewardList;
  }

  /// isLoading bool for Exchange Rewards view
  bool get isLoading1 {
    return _isLoading1;
  }

  /// hasInitialized bool for Exchange Rewards view
  bool get hasInitialized1 {
    return _hasInitialized1;
  }

  /// isLoading bool for Exchange Receipts view
  bool get isLoading2 {
    return _isLoading2;
  }

  /// hasInitialized bool for Exchange Receipts view
  bool get hasInitialized2 {
    return _hasInitialized2;
  }

  String get authenticatedUserId {
    return _authenticatedUserId;
  }

  bool get reachedPaginationEnd {
    return _reachedPaginationEnd;
  }

  // 1
  Future<void> getRewardList() async {
    await getRewardListFromDevice();
    await fetchRewardList();

    // _isLoading1 = false;
    // notifyListeners();
    return;
  }

  // 1.1
  Future<void> getRewardListFromDevice() async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      String rewardListJson = _prefs.getString('rewardList');

      if (rewardListJson != null && rewardListJson != '') {
        List<Reward> _fetchedrewardListList = [];
        List<dynamic> _fetchedDynamicList = [];

        _fetchedDynamicList = json.decode(rewardListJson);

        _fetchedDynamicList.forEach((element) {
          final Reward _rewardElement = new Reward.fromJson(element);

          _fetchedrewardListList.add(_rewardElement);
        });

        _rewardList = _fetchedrewardListList;
        print('get rewardlist from device:');
        inspect(_rewardList);
      } else {
        print('No rewardlist found');
      }
    } catch (e) {
      print('error getting rewardlist list from storage');
      print(e.toString());
    }
    return;
  }

  // 1.2
  Future<void> fetchRewardList() async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add("get_all_mobile_rewards",
          router.appMobilerewardrewardGetallmobilerewards, {});

      GatewayPayload payload = await gateway.request(logout, false);

      print(0);
      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return;
      }
      print(1);
      List<Reward> _fetchedRewardList = [];
      List<dynamic> _fetchedDynamicList = [];

      print(2);
      _fetchedDynamicList = payload.data['get_all_mobile_rewards']['data'];

      print(3);
      _fetchedDynamicList.forEach((element) {
        print(element);
        final Reward _rewardElement = new Reward.fromJson(element);

        _fetchedRewardList.add(_rewardElement);
      });

      print(4);
      _rewardList = _fetchedRewardList;

      print(5);
      print('fetch reward list:');
      inspect(_rewardList);
      await saveRewardListToDevice(_fetchedDynamicList);
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }
    return;
  }

  // 1.3
  Future<void> saveRewardListToDevice(List<dynamic> _fetchedDynamicList) async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String _rewardListJson = json.encode(_fetchedDynamicList);

    _prefs.setString('rewardList', _rewardListJson);
    return;
  }

  // 2
  Future<void> getExchangeReceiptList() async {
    await getExchangeReceiptListFromDevice();
    await fetchExchangeReceiptList();

    _isLoading2 = false;
    notifyListeners();
    return;
  }

  // 2.1
  Future<void> getExchangeReceiptListFromDevice() async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      String exchangeReceiptListJson = _prefs.getString('exchangeReceiptList');

      if (exchangeReceiptListJson != null && exchangeReceiptListJson != '') {
        List<TransactionRecordExchangeRefReward> _fetchedExchangeReceiptList =
            [];
        List<dynamic> _fetchedDynamicList = [];

        _fetchedDynamicList = json.decode(exchangeReceiptListJson);

        _fetchedDynamicList.forEach((element) {
          final TransactionRecordExchangeRefReward _exchangeReceiptElement =
              new TransactionRecordExchangeRefReward.fromJson(
                  element['transactionRecordExchangeRefReward']);

          _fetchedExchangeReceiptList.add(_exchangeReceiptElement);

          _receiptDetailsMap[_exchangeReceiptElement.id] = {
            'companyBranchName': element['companyBranchName'],
            'transactionCode': element['transactionCode'],
            'transactionStatus': element['transactionStatus'],
          };
        });

        _exchangeReceiptList = _fetchedExchangeReceiptList;
        print('get exchange receipt list from device:');
        inspect(_exchangeReceiptList);
      } else {
        print('No exchange receipts found');
      }
    } catch (e) {
      print('error getting exchange receipt list from storage');
      print(e.toString());
    }
    return;
  }

  // 2.2
  Future<bool> fetchExchangeReceiptList(
      [pagination = false, itemsToLoad = 7, firstItem = 0]) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add(
          "get_exchange_receipts",
          router.appMobileTransactionRecordTransactionRecordGetexchangerecepits,
          {
            "accountId": _authenticatedUserId,
            "itemsToLoad": itemsToLoad,
            "firstItem": firstItem
          });

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return false;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return false;
      }
      List<TransactionRecordExchangeRefReward> _fetchedExchangeReceiptList = [];
      List<dynamic> _fetchedDynamicList = [];

      _fetchedDynamicList = payload.data['get_exchange_receipts']['data'];

      if (_fetchedDynamicList.isEmpty) {
        _reachedPaginationEnd = true;
      } else {
        _reachedPaginationEnd = false;
      }
      print('_reachedPaginationEnd');
      print(_reachedPaginationEnd);
      _fetchedDynamicList.forEach((element) {
        final TransactionRecordExchangeRefReward _exchangeReceiptElement =
            new TransactionRecordExchangeRefReward.fromJson(
                element['transactionRecordExchangeRefReward']);

        if (pagination) {
          _exchangeReceiptList.add(_exchangeReceiptElement);
        } else {
          _fetchedExchangeReceiptList.add(_exchangeReceiptElement);
        }

        Map<String, dynamic> _details = {};
        _details = {
          'companyBranchName': element['companyBranchName'],
          'transactionCode': element['transactionCode'],
          'transactionStatus': element['transactionStatus'],
        };
        _receiptDetailsMap[_exchangeReceiptElement.id] = _details;
      });

      if (!pagination) {
        _exchangeReceiptList = _fetchedExchangeReceiptList;

        await saveExchangeReceiptListToDevice(_fetchedDynamicList);
      }
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }

    if (pagination) {
      notifyListeners();
    }
    return true;
  }

  // 2.3
  Future<void> saveExchangeReceiptListToDevice(
      List<dynamic> _fetchedDynamicList) async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String exchangeReceiptListJson = json.encode(_fetchedDynamicList);

    _prefs.setString('exchangeReceiptList', exchangeReceiptListJson);
    return;
  }

  // 3
  Future<bool> makeExchange(
      Reward _reward, CompanyBranch _companyBranch) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      if (_authenticatedUserId == '') {
        showSnackBar('Não foi possível verificar sua conta');

        return false;
      }

      gateway.add("make_exchange", router.appMobilerewardrewardMakeexchange, {
        "accountId": _authenticatedUserId,
        "rewardId": _reward.id,
        "companyBranchId": _companyBranch.id
      });

      GatewayPayload payload = await gateway.request(logout, false);

      print(0);
      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return false;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return false;
      }
      print(1);

      var _fetchedDynamicReceipt;

      print(2);
      _fetchedDynamicReceipt = payload.data['make_exchange']['data'];

      print(3);
      _lastTransactionReceipt = new TransactionRecordExchangeRefReward.fromJson(
          _fetchedDynamicReceipt);

      print('make exchange (receipt):');
      inspect(_lastTransactionReceipt);
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
      return false;
    }
    return true;
  }

  /// isLoading bool for Exchange Rewards view
  void setIsLoading1(bool _value) {
    if (_isLoading1 && _value) {
      return;
    }
    _isLoading1 = _value;

    notifyListeners();
  }

  /// hasInitialized bool for Exchange Rewards view
  void setInitialized1(bool _value) {
    _hasInitialized1 = _value;
  }

  /// isLoading bool for Exchange Receipts view
  void setIsLoading2(bool _value) {
    if (_isLoading1 && _value) {
      return;
    }
    _isLoading2 = _value;

    notifyListeners();
  }

  /// hasInitialized bool for Exchange Receipts view
  void setInitialized2(bool _value) {
    _hasInitialized2 = _value;
  }

  /// hasInitialized bool for Exchange Receipts view
  void setAuthenticatedUserId(String _account) {
    try {
      _authenticatedUserId = _account;
    } catch (e) {
      _authenticatedUserId = '';
    }
  }

  void logout() {
    _isLoading1 = true;
    _hasInitialized1 = false;
    _isLoading2 = true;
    _hasInitialized2 = false;
    _reachedPaginationEnd = false;
  }
}
