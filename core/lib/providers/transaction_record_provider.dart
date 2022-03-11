import 'dart:developer';

import 'package:core/dto/account_authenticationDTO.dart';
import 'package:core/dto/account_quick_registerDTO.dart';
import 'package:core/entities/entities.dart';
import 'package:core/gateway/gateway_routes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../global.dart';

import '../gateway/gateway.dart';
import '../core.dart';

class TransactionRecordProvider with ChangeNotifier {
  List<TransactionRecord> _allTransactionRecordList = [];
  List<TransactionRecord> _positiveTransactionRecordList = [];
  List<TransactionRecord> _negativeTransactionRecordList = [];

  // auth variables
  String _authenticatedUserId = '';

  // functional variables
  bool _isLoading = true;
  bool _hasInitialized = false;
  bool _reachedAllPaginationEnd = false;
  bool _reachedPositivePaginationEnd = false;
  bool _reachedNegativePaginationEnd = false;

  int _firstAllItem = Global.appConfig.transactionsPaginationLength;
  int _firstPositiveItem = Global.appConfig.transactionsPaginationLength;
  int _firstNegativeItem = Global.appConfig.transactionsPaginationLength;

  List<TransactionRecord> get transactionRecordList {
    return _allTransactionRecordList;
  }

  List<TransactionRecord> get transactionRecordListPositive {
    return _positiveTransactionRecordList;
  }

  List<TransactionRecord> get transactionRecordListNegative {
    return _negativeTransactionRecordList;
  }

  bool get reachedAllPaginationEnd {
    return _reachedAllPaginationEnd;
  }

  bool get reachedPositivePaginationEnd {
    return _reachedPositivePaginationEnd;
  }

  bool get reachedNegativePaginationEnd {
    return _reachedNegativePaginationEnd;
  }

  int get firstAllItem {
    return _firstAllItem;
  }

  int get firstPositiveItem {
    return _firstPositiveItem;
  }

  int get firstNegativeItem {
    return _firstNegativeItem;
  }

  String get authenticatedUserId {
    return _authenticatedUserId;
  }

  /// isLoading bool for Branches view
  bool get isLoading {
    return _isLoading;
  }

  /// hasInitialized bool for Branches view
  bool get hasInitialized {
    return _hasInitialized;
  }

  // 1
  Future<void> getTransactionRecordList({bool notify = true}) async {
    await getTransactionRecordListFromDevice();
    await fetchTransactionRecordList();

    _isLoading = false;
    if (notify) {
      notifyListeners();
    }
    return;
  }

  // 1.1
  Future<void> getTransactionRecordListFromDevice() async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      String transactionRecordListJson =
          _prefs.getString('transactionRecordList');

      if (transactionRecordListJson != null &&
          transactionRecordListJson != '') {
        List<TransactionRecord> _fetchedtransactionRecordList = [];
        List<dynamic> _fetchedDynamicList = [];

        _fetchedDynamicList = json.decode(transactionRecordListJson);

        _fetchedDynamicList.forEach((element) {
          final TransactionRecord _transactionRecordElement =
              new TransactionRecord.fromJson(element);

          _fetchedtransactionRecordList.add(_transactionRecordElement);
        });

        _allTransactionRecordList = _fetchedtransactionRecordList;
        print('get transactionRecordList from device:');
        inspect(_allTransactionRecordList);
      } else {
        print('No Transaction Records found');
      }
    } catch (e) {
      print('error getting Transaction Records from storage');
      print(e.toString());
    }
    return;
  }

  // 1.2
  Future<bool> fetchTransactionRecordList(
      [pagination = false, itemsToLoad = 10, firstItem = 0, type = 0]) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      if (_authenticatedUserId == '') {
        showSnackBar('Não foi possível verificar sua conta');

        return false;
      }
      if (!pagination || (pagination && type == 0)) {
        gateway.add(
          "get_all_transaction_records",
          router
              .appMobiletransactionrecordtransactionrecordGetalltransactionrecords,
          {
            "accountId": _authenticatedUserId,
            "itemsToLoad": itemsToLoad,
            "firstItem": firstItem,
            "type": 0
          },
        );
      }
      if (!pagination || (pagination && type == 1)) {
        gateway.add(
          "get_positive_transaction_records",
          router
              .appMobiletransactionrecordtransactionrecordGetalltransactionrecords,
          {
            "accountId": _authenticatedUserId,
            "itemsToLoad": itemsToLoad,
            "firstItem": firstItem,
            "type": 1
          },
        );
      }
      if (!pagination || (pagination && type == -1)) {
        gateway.add(
          "get_negative_transaction_records",
          router
              .appMobiletransactionrecordtransactionrecordGetalltransactionrecords,
          {
            "accountId": _authenticatedUserId,
            "itemsToLoad": itemsToLoad,
            "firstItem": firstItem,
            "type": -1
          },
        );
      }

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return false;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return false;
      }

      List<dynamic> _fetchedAllDynamicList = [];
      List<dynamic> _fetchedPositiveDynamicList = [];
      List<dynamic> _fetchedNegativeDynamicList = [];

      if (!pagination || (pagination && type == 0)) {
        _fetchedAllDynamicList =
            payload.data['get_all_transaction_records']['data'];
        if (_fetchedAllDynamicList.isEmpty ||
            _fetchedAllDynamicList.length <
                Global.appConfig.transactionsPaginationLength) {
          _reachedAllPaginationEnd = true;
        } else {
          _reachedAllPaginationEnd = false;
        }
      }
      if (!pagination || (pagination && type == 1)) {
        _fetchedPositiveDynamicList =
            payload.data['get_positive_transaction_records']['data'];
        if (_fetchedPositiveDynamicList.isEmpty ||
            _fetchedPositiveDynamicList.length <
                Global.appConfig.transactionsPaginationLength) {
          _reachedPositivePaginationEnd = true;
        } else {
          _reachedPositivePaginationEnd = false;
        }
      }
      if (!pagination || (pagination && type == -1)) {
        _fetchedNegativeDynamicList =
            payload.data['get_negative_transaction_records']['data'];

        if (_fetchedNegativeDynamicList.isEmpty ||
            _fetchedNegativeDynamicList.length <
                Global.appConfig.transactionsPaginationLength) {
          _reachedNegativePaginationEnd = true;
        } else {
          _reachedNegativePaginationEnd = false;
        }
      }

      if (!pagination) {
        _allTransactionRecordList = [];
        _positiveTransactionRecordList = [];
        _negativeTransactionRecordList = [];

        _firstAllItem = Global.appConfig.transactionsPaginationLength;
        _firstPositiveItem = Global.appConfig.transactionsPaginationLength;
        _firstNegativeItem = Global.appConfig.transactionsPaginationLength;
      }

      if (!pagination || (pagination && type == 0)) {
        _fetchedAllDynamicList.forEach((element) {
          final TransactionRecord _transactionRecordElement =
              new TransactionRecord.fromJson(element);

          _allTransactionRecordList.add(_transactionRecordElement);
        });
      }
      if (!pagination || (pagination && type == 1)) {
        _fetchedPositiveDynamicList.forEach((element) {
          final TransactionRecord _transactionRecordElement =
              new TransactionRecord.fromJson(element);

          _positiveTransactionRecordList.add(_transactionRecordElement);
        });
      }
      if (!pagination || (pagination && type == -1)) {
        _fetchedNegativeDynamicList.forEach((element) {
          final TransactionRecord _transactionRecordElement =
              new TransactionRecord.fromJson(element);

          _negativeTransactionRecordList.add(_transactionRecordElement);
        });
      }

      print('All transaction records: ');
      inspect(_allTransactionRecordList);
      print('Positive: ');
      inspect(_positiveTransactionRecordList);
      print('Negative: ');
      inspect(_negativeTransactionRecordList);
      await saveTransactionRecordListToDevice(_fetchedAllDynamicList);
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }
    return true;
  }

  // 1.3
  Future<void> saveTransactionRecordListToDevice(
      List<dynamic> _fetchedDynamicList) async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String transactionRecordListJson = json.encode(_fetchedDynamicList);

    _prefs.setString('transactionRecordList', transactionRecordListJson);
    return;
  }

  void setInitialized(bool _value) {
    _hasInitialized = _value;
  }

  void setIsLoading(bool _value) {
    _isLoading = _value;

    notifyListeners();
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
    _isLoading = true;
    _hasInitialized = false;
    _reachedAllPaginationEnd = false;
    _reachedPositivePaginationEnd = false;
    _reachedNegativePaginationEnd = false;

    _firstAllItem = Global.appConfig.transactionsPaginationLength;
    _firstPositiveItem = Global.appConfig.transactionsPaginationLength;
    _firstNegativeItem = Global.appConfig.transactionsPaginationLength;
  }

  void updateFirstPaginationItem(int _type) {
    if (_type == 1) {
      _firstPositiveItem =
          _firstPositiveItem + Global.appConfig.transactionsPaginationLength;
    } else if (_type == -1) {
      _firstNegativeItem =
          _firstNegativeItem + Global.appConfig.transactionsPaginationLength;
    } else {
      _firstAllItem =
          _firstAllItem + Global.appConfig.transactionsPaginationLength;
    }
  }

  void notify() {
    notifyListeners();
  }
}
