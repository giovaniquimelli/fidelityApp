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

class AuthProvider with ChangeNotifier {
  // auth variables
  String _authPassword = '';
  AccountAuthenticationDTO _authenticatedUser;

  // accounts variables
  List<Account> _allAccountsList = [];
  List<Account> _allSubAccountsList = [];
  Account _mainAccount;
  Account _selectedAccount;
  List<AccountCode> _allAccountCodesList = [];
  Account _chosenAccount; // Chosen account to share card with

  // functional variables
  bool _autoAuthenticated = false;
  bool _isLoading = true;
  bool _isLoadingShare = true;
  bool _hasInitialized = false;
  bool _hasFetchedSubAccounts = false;

  // other variables
  Map<String, dynamic> _pointsSumMapByAccountId = {};

  // getters
  Map<String, dynamic> get pointsSumMapByAccountId {
    return _pointsSumMapByAccountId;
  }

  List<AccountCode> get allAccountCodesList {
    return _allAccountCodesList;
  }

  Account get chosenAccount {
    return _chosenAccount;
  }

  Account get mainAccount {
    return _mainAccount;
  }

  List<Account> get allAccountsList {
    return _allAccountsList;
  }

  List<Account> get allSubAccountsList {
    return _allSubAccountsList;
  }

  Account get selectedAccount {
    return _selectedAccount;
  }

  String get authPassword {
    return _authPassword;
  }

  bool get isAuth {
    return userToken != null;
  }

  bool get isLoading {
    return _isLoading;
  }

  bool get isLoadingShare {
    return _isLoadingShare;
  }

  bool get autoAuthenticated {
    return _autoAuthenticated;
  }

  String get userToken {
    if (_authenticatedUser != null) {
      return _authenticatedUser.token;
    }
    return null;
  }

  String get authenticatedUserId {
    return _authenticatedUser.accountId;
  }

  String get fullName {
    return _authenticatedUser.fullName;
  }

  String get legalName {
    return _authenticatedUser.legalName;
  }

  String get username {
    return _authenticatedUser.username;
  }

  bool get hasInitialized {
    return _hasInitialized;
  }

  bool get hasFetchedSubAccounts {
    return _hasFetchedSubAccounts;
  }

  // Auth functions
  Future<Map<String, dynamic>> register({
    String username,
    String password,
    String fullName,
    String legalName,
    String email,
    String personType,
    String mobilePhone,
  }) async {
    try {
      // Create authData object
      AccountQuickRegistrationDTO registrationData =
          new AccountQuickRegistrationDTO();

      registrationData.username = username;
      registrationData.password = password;
      registrationData.fullName = fullName;
      registrationData.legalName = legalName;
      registrationData.email = email;
      registrationData.personType = personType;
      registrationData.mobilePhone = mobilePhone;

      registrationData.accountId = '';
      registrationData.account = '';

      // Send auth data to log in
      http.Response response;
      response = await Gateway()
          .register(registrationData)
          .timeout(Duration(seconds: 30));

      // Decode json response data
      final Map<String, dynamic> responseData = json.decode(response.body);
      bool hasError = true;
      String message = 'Algo deu errado, tente novamente.';

      // check if login successful
      if (response.statusCode == 201) {
        hasError = false;
        message = 'Cadastrado om sucesso.';

        _authPassword = password;

        Future.delayed(
            Duration(
              milliseconds: 200,
            ),
            () => showSnackBar('Cadastrado com sucesso!'));

        // Handling of errors
      } else if (response.statusCode != 201) {
        message = responseData['message'];
      }
      notifyListeners();

      // Return success or error message to the UI on auth_view
      return {'success': !hasError, 'message': message};
    } catch (error) {
      print(error);
      return {
        'success': false,
        'message': "Erro inesperado, verifique sua conexão"
      };
    }
  }

  Future<Map<String, dynamic>> authenticate(
      {String username, String password, String token}) async {
    try {
      // Create authData object
      var authData;

      authData = AccountAuthenticationDTO();

      authData.username = username;

      if (token != null) {
        authData.token = token;
        authData.password = 'bypass API null check';
      } else {
        authData.password = password;
      }

      // Send auth data to log in
      http.Response response;
      response =
          await Gateway().authenticate(authData).timeout(Duration(seconds: 30));

      authData.password = '';

      // Decode json response data
      final Map<String, dynamic> responseData = json.decode(response.body);
      bool hasError = true;
      String message = 'Algo deu errado, tente novamente.';

      // check if login successful
      if (response.statusCode == 201) {
        hasError = false;
        message = 'Login realizado com sucesso.';

        // Create authenticated user object
        AccountAuthenticationDTO _user =
            AccountAuthenticationDTO.fromJson(responseData['data']);
        _authenticatedUser = _user;

        // Store user properties on device to enable auto login
        final SharedPreferences prefs = Global.storage;
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', responseData['data']['username']);
        prefs.setString('token', responseData['data']['token']);
        prefs.setString('fullName', responseData['data']['fullName']);
        prefs.setString('legalName', responseData['data']['legalName']);
        prefs.setString('accountId', responseData['data']['accountId']);

        // Handling of errors
      } else if (response.statusCode != 201) {
        message = responseData['message'];
      }
      notifyListeners();

      // Return success or error message to the UI on auth_view
      return {'success': !hasError, 'message': message};
    } catch (error) {
      print(error);
      return {
        'success': false,
        'message': "Erro inesperado, verifique sua conexão"
      };
    }
  }

  Future<bool> tryAutoLogin() async {
    print('what');
    // Check existence of token on device to auto login
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final SharedPreferences prefs = Global.storage;

    final String token = prefs.getString('token');

    if (token != null /* and has our pattern */) {
      final String username = prefs.getString('username');
      final String fullName = prefs.getString('fullName');
      final String legalName = prefs.getString('legalName');

      // Create authenticated user object
      final String accountId = prefs.getString('accountId');
      AccountAuthenticationDTO _user = AccountAuthenticationDTO();
      _user.accountId = accountId;
      _user.username = username;
      _user.fullName = fullName;
      _user.legalName = legalName;
      _user.token = token;
      _authenticatedUser = _user;

      // await authenticate(username: username, token: token);
      _autoAuthenticated = true;
      notifyListeners();

      return true;
    }
    return false;
  }

  void logout() async {
    print('logout');
    // Delete authenticated user object
    _authenticatedUser = null;

    // Remove user properties stored on device to disable automatic login
    final SharedPreferences prefs = Global.storage;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // prefs.remove('token');
    // prefs.remove('username');
    // prefs.remove('fullName');
    // prefs.remove('legalName');
    // prefs.remove('accountId');
    // prefs.remove('stuff from accounts, vehicles   and accountcodes');

    _allSubAccountsList = [];
    _hasFetchedSubAccounts = false;

    _autoAuthenticated = false;

    _hasInitialized = false;
    _isLoading = true;
    notifyListeners();

    // accounts variables
    _allAccountsList = [];
    _allAccountCodesList = [];

    // functional variables
    _isLoadingShare = true;
  }

  void doLogin() async {
    print('do login');

    // Bypass validation and force login
    AccountAuthenticationDTO _user = AccountAuthenticationDTO();
    _user.accountId = 'accountId123123123';
    _user.username = 'username';
    _user.fullName = 'fullName';
    _user.legalName = 'legalName';
    _user.token = 'token';
    _authenticatedUser = _user;

    final SharedPreferences prefs = Global.storage;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _authenticatedUser.username);
    prefs.setString('fullName', _authenticatedUser.fullName);
    prefs.setString('legalName', _authenticatedUser.legalName);
    prefs.setString('token', _authenticatedUser.token);
    prefs.setString('accountId', _authenticatedUser.accountId);

    notifyListeners();
  }

  // Accounts functions
  // 1
  Future<void> getAllAccounts() async {
    await getAllAccountsFromDevice();
    await fetchAllAccounts();

    // _isLoading = false;
    // notifyListeners();
    return;
  }

  // 1.1
  Future<void> getAllAccountsFromDevice() async {
    print('get accounts from device');
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      String allAccountsListJson = _prefs.getString('allAccountsList');
      String selectedAccountEncoded = _prefs.getString('selectedAccount');

      if (allAccountsListJson != null && allAccountsListJson != '') {
        List<Account> _fetchedAllAccountsList = [];
        List<dynamic> _fetchedDynamicList = [];

        _fetchedDynamicList = json.decode(allAccountsListJson);

        _fetchedDynamicList.forEach((element) {
          final Account _accountsElement = new Account.fromJson(element);

          _fetchedAllAccountsList.add(_accountsElement);
        });

        _allAccountsList = _fetchedAllAccountsList;
        _mainAccount =
            _allAccountsList.firstWhere((element) => element.account == null);
      } else {
        print('No Accounts found');
      }

      if (selectedAccountEncoded != null && selectedAccountEncoded != '') {
        _selectedAccount =
            new Account.fromJson(json.decode(selectedAccountEncoded));
      } else {
        print('No Selected Accounts found');
      }
    } catch (e) {
      print('error getting accounts from storage');
      print(e.toString());
    }
    return;
  }

  // 1.2
  Future<void> fetchAllAccounts() async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add(
        "get_all_accounts",
        router.appMobileAccountAccountGetallaccounts,
        _authenticatedUser,
      );

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return;
      }

      List<Account> _fetchedAllAccountsList = [];
      List<dynamic> _fetchedDynamicList = [];

      _fetchedDynamicList = payload.data['get_all_accounts']['data'];

      _fetchedDynamicList.forEach((element) {
        final Account _allAccountsElement = new Account.fromJson(element);

        _fetchedAllAccountsList.add(_allAccountsElement);
      });

      _allAccountsList = _fetchedAllAccountsList;

      // print('1');
      if (_allAccountsList != null && _allAccountsList.isNotEmpty) {
        _mainAccount =
            _allAccountsList.firstWhere((element) => element.account == null);

        // print('2');
        bool _saveSelectedAccountToDevice = false;
        // if (_selectedAccount != null &&
        //     _selectedAccount != null &&
        //     _allAccountsList
        //         .contains((element) => element.id == _selectedAccount.id)) {
        //   print('3');
        //   var _selectedAccountFromFetchedList = _allAccountsList
        //       .firstWhere((element) => element.id == _selectedAccount.id);

        //   print('4');
        //   if (_selectedAccountFromFetchedList == null) {
        //     // if the account the user had selected got deleted
        //     _selectedAccount = _mainAccount;
        //     _saveSelectedAccountToDevice = true;
        //   }
        // } else {
        //   // if user has not selected an account yet
        //   _selectedAccount = _mainAccount;
        //   _saveSelectedAccountToDevice = true;
        // }

        _selectedAccount = _mainAccount;
        _saveSelectedAccountToDevice = true;
        await saveAllAccountsToDevice(
            _fetchedDynamicList, _saveSelectedAccountToDevice);
      }
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }
    return;
  }

  // 1.3
  Future<void> saveAllAccountsToDevice(
      List<dynamic> allAccountsList, bool saveSelectedAccountToDevice) async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String allAccountsListJson = json.encode(allAccountsList);

    _prefs.setString('allAccountsList', allAccountsListJson);
    _prefs.setString('selectedAccount', jsonEncode(_selectedAccount));
    return;
  }

  // 2
  Future<bool> editAccount(AccountQuickRegistrationDTO editedAccount) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      editedAccount.accountId = _mainAccount.id;

      gateway.add(
        "edit_account",
        router.appMobileAccountAccountEditaccount,
        editedAccount,
      );

      GatewayPayload payload = await gateway.request(logout, false);

      if (!payload.success) {
        showSnackBar('Solicitação falhou');
        return false;
      }

      Account _fetchedMainAccount;
      Map<String, dynamic> _fetchedData;

      _fetchedData = payload.data['edit_account']['data'];

      _fetchedMainAccount = new Account.fromJson(_fetchedData);

      if (_fetchedMainAccount != null) {
        _mainAccount = _fetchedMainAccount;

        int _mainSavedAccountIndex = _allAccountsList
            .indexWhere((element) => element.id == _fetchedMainAccount.id);
        _allAccountsList[_mainSavedAccountIndex] = _fetchedMainAccount;
        await saveAllAccountsToDevice(_allAccountsList, false);

        notifyListeners();
        Future.delayed(
            Duration(
              milliseconds: 200,
            ),
            () => showSnackBar('Conta editada com sucesso!'));
      }
    } catch (e) {
      print(e);
      print('what');
      showSnackBar('Erro na conexão');
      return false;
    }
    return true;
  }

// AccountCodes functions
// 3
  Future<void> getAllAccountCodes() async {
    // _isLoading = true;
    // notifyListeners();

    await getAllAccountCodesAndPointsSumFromDevice();
    await fetchAllAccountCodesAndPointsSum();

    // _isLoading = false;
    // notifyListeners();
    return;
  }

// 3.1
  Future<void> getAllAccountCodesAndPointsSumFromDevice() async {
    print('get AccountCodes from device');
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      String allAccountCodesListJson = _prefs.getString('allAccountCodesList');
      String pointsSumMapByAccountIdJson =
          _prefs.getString('pointsSumMapByAccountId');

      if (allAccountCodesListJson != null && allAccountCodesListJson != '') {
        List<AccountCode> _storedAccountCodesList = [];
        List<dynamic> _storedDynamicList = [];

        _storedDynamicList = json.decode(allAccountCodesListJson);

        _storedDynamicList.forEach((element) {
          final AccountCode _accountsElement =
              new AccountCode.fromJson(element);

          _storedAccountCodesList.add(_accountsElement);
        });

        _allAccountCodesList = _storedAccountCodesList;
      } else {
        print('No accountCodes found');
      }
      if (pointsSumMapByAccountIdJson != null &&
          pointsSumMapByAccountIdJson != '') {
        _pointsSumMapByAccountId = json.decode(pointsSumMapByAccountIdJson);
      } else {
        print('No points sum found');
      }
    } catch (e) {
      print('error getting accountCodes and points sum from storage');
      print(e.toString());
    }
    return;
  }

// 3.2
  Future<void> fetchAllAccountCodesAndPointsSum() async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      // For each account on _allAccountsList ->
      // add one gateway request to get Codes for each Account
      if (_allAccountsList.isNotEmpty) {
        for (var i = 0; i < _allAccountsList.length; i++) {
          gateway.add(
            "get_all_accountcodes" + i.toString(),
            router.appMobileAccountAccountGetallaccountcodes,
            {"accountId": _allAccountsList[i].id},
          );
          gateway.add(
            "get_points_sum" + i.toString(),
            router.appMobileTransactionRecordTransactionRecordGetpointssum,
            {"accountId": _allAccountsList[i].id},
          );
        }
      } else {
        return;
      }

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return;
      }

      // For each account on _allAccountsList ->
      // create Code List for the specific account
      // set the Account property for each Code element based on the _allAccountsList[index]
      // add Code List to _allAccountCodesList
      _allAccountCodesList = [];

      for (var i = 0; i < _allAccountsList.length; i++) {
        List<AccountCode> _fetchedAllCodesList = [];
        List<dynamic> _fetchedCodesDynamicList = [];

        _fetchedCodesDynamicList =
            payload.data["get_all_accountcodes" + i.toString()]['data'];

        _fetchedCodesDynamicList.forEach((element) {
          final AccountCode _codeElement = new AccountCode.fromJson(element);
          _codeElement.account = _allAccountsList[i];

          _fetchedAllCodesList.add(_codeElement);
        });
        _allAccountCodesList.addAll(_fetchedAllCodesList);

        dynamic _fetchedPointsSum;

        _fetchedPointsSum =
            payload.data["get_points_sum" + i.toString()]['data'];

        _pointsSumMapByAccountId[_allAccountsList[i].id] = _fetchedPointsSum;
      }

      if (_allAccountCodesList != null && _allAccountCodesList.isNotEmpty) {
        await saveAllAccountCodesAndPointsSumToDevice();
      }
    } catch (e) {
      print(e);
      print('what');
      showSnackBar('Erro na conexão');
    }
    return;
  }

// 3.2
  Future<void> saveAllAccountCodesAndPointsSumToDevice() async {
    final SharedPreferences _prefs = Global.storage;
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String allAccountCodesListJson = json.encode(_allAccountCodesList);
    String pointsSumMapByAccountIdJson = json.encode(_pointsSumMapByAccountId);

    print('save points sum json to device:');
    print(pointsSumMapByAccountIdJson);
    _prefs.setString('allAccountCodesList', allAccountCodesListJson);
    _prefs.setString('pointsSumMapByAccountId', pointsSumMapByAccountIdJson);
    return;
  }

  // 3.3
  String getAccountCode(String accountId) {
    AccountCode _accountCode = new AccountCode();
    try {
      // find first code from _allAccountCodesList that belongs to the accountId passed as arg
      _accountCode = _allAccountCodesList
          .firstWhere((element) => element.account.id == accountId);
      // move to end of list and return it
      _allAccountCodesList.remove(_accountCode);
      _allAccountCodesList.add(_accountCode);
    } catch (e) {
      _accountCode.code = '00000000';
    }

    return _accountCode.code;
  }

  // SubAccount functions
  // 4
  Future<void> fetchAllSubAccounts() async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();
      print('///////////');
      print(_allSubAccountsList);
      print('///////////');
      gateway.add(
        "get_all_subaccounts",
        router.appMobileAccountAccountGetallsubaccounts,
        {"accountId": _mainAccount.id},
      );

      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return;
      }

      if (!payload.success) {
        showSnackBar('Solicitação falhou');

        return;
      }

      List<Account> _fetchedAllSubAccountsList = [];
      _allSubAccountsList = [];
      List<dynamic> _fetchedDynamicList = [];

      _fetchedDynamicList = payload.data['get_all_subaccounts']['data'];

      _fetchedDynamicList.forEach((element) {
        final Account _allAccountsElement = new Account.fromJson(element);

        _fetchedAllSubAccountsList.add(_allAccountsElement);
      });

      _allSubAccountsList = _fetchedAllSubAccountsList;
      print('///////////');
      print(_allSubAccountsList);
      print('///////////');
    } catch (e) {
      print(e);
      print('erro');
      showSnackBar('Erro na conexão');
    }
    _isLoadingShare = false;
    notifyListeners();
    return;
  }

  // 4.2
  Future<bool> fetchChosenAccount(String _chosenAccountUsername) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add(
        "get_chosen_account",
        router.appMobileAccountAccountGetaccount,
        {"username": _chosenAccountUsername},
      );
      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return false;
      }

      if (!payload.success) {
        showSnackBar(payload.message);

        return false;
      }

      Account _fetchedChosenAccount;
      Map<String, dynamic> _fetchedData;

      _fetchedData = payload.data['get_chosen_account']['data'];

      _fetchedChosenAccount = new Account.fromJson(_fetchedData);

      if (_fetchedChosenAccount != null) {
        _chosenAccount = _fetchedChosenAccount;
        return true;
      } else {
        showSnackBar('Não foi possível buscar usuário');
        return false;
      }
    } catch (e) {
      print(e);
      print('what');
      return false;
    }
  }

  // 4.3
  Future<bool> createSubAccount() async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add(
        "create_sub_account",
        router.appMobileAccountAccountcreatesubaccount,
        {
          "mainAccountId": _mainAccount.id,
          "chosenAccountId": _chosenAccount.id
        },
      );
      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return false;
      }

      if (!payload.success) {
        showSnackBar(payload.message);

        return false;
      }

      List<Account> _fetchedAllSubAccountsList = [];
      List<dynamic> _fetchedDynamicList = [];

      _fetchedDynamicList = payload.data['create_sub_account']['data'];

      _fetchedDynamicList.forEach((element) {
        final Account _allAccountsElement = new Account.fromJson(element);

        _fetchedAllSubAccountsList.add(_allAccountsElement);
      });

      _allSubAccountsList = _fetchedAllSubAccountsList;

      print(_allSubAccountsList);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      print('what');
      return false;
    }
  }

  // 4.3
  Future<bool> cancelSubAccount(Account _accountToDelete) async {
    try {
      Gateway gateway = new Gateway();
      GatewayRouter router = new GatewayRouter();

      gateway.add(
        "cancel_sub_account",
        router.appMobileAccountAccountcancelsubaccount,
        {
          "mainAccountId": _mainAccount.id,
          "chosenAccountId": _accountToDelete.id
        },
      );
      GatewayPayload payload = await gateway.request(logout, false);

      if (payload.statusCode == 401) {
        showSnackBar('Não autorizado');

        return false;
      }

      if (!payload.success) {
        showSnackBar(payload.message);

        return false;
      }

      List<Account> _fetchedAllSubAccountsList = [];
      List<dynamic> _fetchedDynamicList = [];

      _fetchedDynamicList = payload.data['cancel_sub_account']['data'];

      _fetchedDynamicList.forEach((element) {
        final Account _allAccountsElement = new Account.fromJson(element);

        _fetchedAllSubAccountsList.add(_allAccountsElement);
      });

      _allSubAccountsList = _fetchedAllSubAccountsList;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      print('what');
      return false;
    }
  }

  void setInitialized(bool _value) {
    _hasInitialized = _value;
    // notifyListeners();
  }

  void setFetchedSubAccounts(bool _value) {
    _hasFetchedSubAccounts = _value;
  }

  void setIsLoading(bool _value) {
    if (_isLoading && _value) {
      return;
    }
    _isLoading = _value;

    notifyListeners();
  }

  void setSelectedAccount(Account account) {
    _selectedAccount = account;

    final SharedPreferences _prefs = Global.storage;
    _prefs.setString('selectedAccount', jsonEncode(_selectedAccount));

    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}

// Vehicle variables
// List<AccountVehicle> _allVehiclesList = [];
// AccountVehicle _selectedVehicle;

// Vehicle functions
// // 3
// Future<void> getAllVehicles() async {
//   _isLoading = true;
//   notifyListeners();

//   await getAllVehiclesFromDevice();
//   await fetchAllVehicles();

//   _isLoading = false;
//   notifyListeners();
//   return;
// }

// // 3.1
// Future<void> getAllVehiclesFromDevice() async {
//   print('get vehicles from device');
//   final SharedPreferences _prefs = Global.storage;
//   // final SharedPreferences _prefs = await SharedPreferences.getInstance();

//   try {
//     String allVehiclesListJson = _prefs.getString('allVehiclesList');
//     String selectedVehicleEncoded = _prefs.getString('selectedVehicle');

//     if (allVehiclesListJson != null && allVehiclesListJson != '') {
//       List<AccountVehicle> _fetchedAllVehiclesList = [];
//       List<dynamic> _fetchedDynamicList = [];

//       _fetchedDynamicList = json.decode(allVehiclesListJson);

//       _fetchedDynamicList.forEach((element) {
//         final AccountVehicle _accountsElement = new AccountVehicle.fromJson(element);

//         _fetchedAllVehiclesList.add(_accountsElement);
//       });

//       _allVehiclesList = _fetchedAllVehiclesList;
//     } else {
//       print('No Vehicles found');
//     }

//     if (selectedVehicleEncoded != null && selectedVehicleEncoded != '') {
//       _selectedVehicle =
//           new AccountVehicle.fromJson(json.decode(selectedVehicleEncoded));
//     } else {
//       print('No Selected Vehicle found');
//     }
//   } catch (e) {
//     print('error getting vehicles from storage');
//     print(e.toString());
//   }
//   return;}

// // 3.2
// Future<void> fetchAllVehicles() async {
//   try {
//     Gateway gateway = new Gateway();
//     GatewayRouter router = new GatewayRouter();

//     gateway.add(
//       "get_all_accountvehicles",
//       router.appMobileAccountAccountGetallaccountvehicles,
//       _authenticatedUser,
//     );

//     GatewayPayload payload = await gateway.request(logout, false);

//     if (payload.statusCode == 401) {
//       showSnackBar('Não autorizado');

//       return;
//     }

//     if (!payload.success) {
//       showSnackBar('Solicitação falhou');

//       return;
//     }

//     List<AccountVehicle> _fetchedAllVehiclesList = [];
//     List<dynamic> _fetchedDynamicList = [];

//     _fetchedDynamicList = payload.data['get_all_accountvehicles']['data'];

//     _fetchedDynamicList.forEach((element) {
//       final AccountVehicle _allVehiclesElement = new AccountVehicle.fromJson(element);

//       _fetchedAllVehiclesList.add(_allVehiclesElement);
//     });

//     _allVehiclesList = _fetchedAllVehiclesList;

//     if (_allVehiclesList != null && _allVehiclesList.isNotEmpty) {

//       bool _saveSelectedVehicleToDevice = false;
//       if (_selectedVehicle != null) {
//         var _selectedVehicleFromFetchedList = _allVehiclesList
//             .firstWhere((element) => element.id == _selectedVehicle.id);

//         if (_selectedVehicleFromFetchedList == null) {
//           // if the vehicle the user had selected got deleted
//           _selectedVehicle = null;
//           _saveSelectedVehicleToDevice = true;
//         }
//       } else {
//         // if user has not selected a vehicle yet
//         _selectedVehicle = null;
//         _saveSelectedVehicleToDevice = true;
//       }

//       await saveAllVehiclesToDevice(
//           _fetchedDynamicList, _saveSelectedVehicleToDevice);
//     }
//   } catch (e) {
//     print(e);
//     print('what');
//     showSnackBar('Erro na conexão');
//   }
//   return;}

// // 3.2
// Future<void> saveAllVehiclesToDevice(
//     List<dynamic> allVehiclesList, bool saveSelectedVehicleToDevice) async {
//   final SharedPreferences _prefs = Global.storage;
//   // final SharedPreferences _prefs = await SharedPreferences.getInstance();

//   String allVehiclesListJson = json.encode(allVehiclesList);

//   _prefs.setString('allVehiclesList', allVehiclesListJson);
//   _prefs.setString('selectedVehicle', jsonEncode(_selectedVehicle));
//   return;
// }

// // 4
// Future<void> createVehicle() async {}

// // 5
// Future<void> editVehicle() async {}
