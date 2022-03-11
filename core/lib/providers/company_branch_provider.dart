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

class CompanyBranchProvider with ChangeNotifier {
  List<CompanyBranch> _allCompanhyBranchesList = [];
  List<CompanyBranch> _branchesByRewardList = [];

  // functional variables
  bool _isLoading = true;
  bool _hasInitialized = false;
  bool _isLoading2 = true;
  bool _hasInitialized2 = false;

  List<CompanyBranch> get allCompanhyBranchesList {
    return _allCompanhyBranchesList;
  }

  List<CompanyBranch> get branchesByRewardList {
    return _branchesByRewardList;
  }

  /// isLoading bool for Branches view
  bool get isLoading {
    return _isLoading;
  }

  /// hasInitialized bool for Branches view
  bool get hasInitialized {
    return _hasInitialized;
  }

  /// isLoading bool for Branches By Reward view
  bool get isLoading2 {
    return _isLoading2;
  }

  /// hasInitialized bool for Branches By Reward view
  bool get hasInitialized2 {
    return _hasInitialized2;
  }

  // 1
  Future<void> getAllCompanhyBranches() async {
    await getAllCompanhyBranchesFromDevice();
    await fetchAllCompanhyBranches();

    _isLoading = false;
    notifyListeners();
    return;
  }

  // 1.1
  Future<void> getAllCompanhyBranchesFromDevice() async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      String allCompanhyBranchesListJson =
          _prefs.getString('allCompanyBranches');

      if (allCompanhyBranchesListJson != null &&
          allCompanhyBranchesListJson != '') {
        List<CompanyBranch> _fetchedAllCompanhyBranchesList = [];
        List<dynamic> _fetchedDynamicList = [];

        _fetchedDynamicList = json.decode(allCompanhyBranchesListJson);

        _fetchedDynamicList.forEach((element) {
          final CompanyBranch _companyBranchElement =
              new CompanyBranch.fromJson(element);

          _fetchedAllCompanhyBranchesList.add(_companyBranchElement);
        });

        _allCompanhyBranchesList = _fetchedAllCompanhyBranchesList;
        // print('get company branches list from device:');
        // inspect(_allCompanhyBranchesList);
      } else {
        print('No Company Branches found');
      }
    } catch (e) {
      print('error getting company branches from storage');
      print(e.toString());
    }
    return;
  }

  // 1.2
  Future<void> fetchAllCompanhyBranches() async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add("get_all_companny_branches",
          router.appMobileCompanyBranchCompanyBranchGetallcompanybranches, {});

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return;
      }

      List<CompanyBranch> _fetchedAllCompanhyBranchesList = [];
      List<dynamic> _fetchedDynamicList = [];

      _fetchedDynamicList = payload.data['get_all_companny_branches']['data'];

      _fetchedDynamicList.forEach((element) {
        final CompanyBranch _allCompanhyBranchesElement =
            new CompanyBranch.fromJson(element);

        _fetchedAllCompanhyBranchesList.add(_allCompanhyBranchesElement);
      });

      _allCompanhyBranchesList = _fetchedAllCompanhyBranchesList;

      // print('fetch company branches list:');
      // inspect(_allCompanhyBranchesList);
      await saveAllCompanhyBranchesToDevice(_fetchedDynamicList);
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }
    return;
  }

  // 1.3
  Future<void> saveAllCompanhyBranchesToDevice(
      List<dynamic> _fetchedDynamicList) async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String allCompanhyBranchesListJson = json.encode(_fetchedDynamicList);

    _prefs.setString('allCompanyBranches', allCompanhyBranchesListJson);
    return;
  }

  // 2
  Future<void> getBranchesByReward(Reward _reward) async {
    if (_isLoading2 = false) {
      _isLoading2 = true;
      notifyListeners();
    }

    await fetchBranchesByRewardList(_reward);

    _isLoading2 = false;
    notifyListeners();
    return;
  }

  // 2.1
  Future<void> fetchBranchesByRewardList(Reward _reward) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add("get_all_branches_by_reward",
          router.appMobilerewardrewardGetallbranchesbyreward, _reward);

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return;
      }
      print(1);
      List<CompanyBranch> _fetchedBranchesByRewardList = [];
      List<dynamic> _fetchedDynamicList = [];

      print(2);
      _fetchedDynamicList = payload.data['get_all_branches_by_reward']['data'];

      print(3);
      _fetchedDynamicList.forEach((element) {
        final CompanyBranch _companhyBrancheElement =
            new CompanyBranch.fromJson(element);

        print(4);
        _fetchedBranchesByRewardList.add(_companhyBrancheElement);
      });

      print(5);
      _branchesByRewardList = _fetchedBranchesByRewardList;

      print(6);
      print('fetch branches by reward list:');
      inspect(_branchesByRewardList);
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }
    return;
  }

  void setInitialized(bool _value) {
    _hasInitialized = _value;
  }

  void setIsLoading(bool _value) {
    _isLoading = _value;

    notifyListeners();
  }

  /// isLoading bool for Branches By Reward view
  void setIsLoading2(bool _value) {
    _isLoading2 = _value;

    notifyListeners();
  }

  /// hasInitialized bool for Branches By Reward view
  void setInitialized2(bool _value) {
    _hasInitialized2 = _value;
  }

  void logout() {
    _isLoading = true;
    _hasInitialized = false;
    _isLoading2 = true;
    _hasInitialized2 = false;
  }
}
