import 'dart:convert';

import 'package:flutter/foundation.dart'; 


class AccessControl {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AccessControl();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AccessControl.jsonDecode(String jsonString) =>
      AccessControl.fromJson(json.decode(jsonString));
  factory AccessControl.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AccessControl obj = new AccessControl();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Account {
  Person person;
  Account account;
  bool active = false;
  String username;
  String password;
  String email;
  String birthDate;
  String mobilePhone;
  String fullName;
  String legalName;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Account();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Account.jsonDecode(String jsonString) =>
      Account.fromJson(json.decode(jsonString));
  factory Account.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Account obj = new Account();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    person = Person.fromJson(json['person']);
    account = Account.fromJson(json['account']);
    active = json['active'] ?? active;
    username = json['username'] ?? username;
    password = json['password'] ?? password;
    email = json['email'] ?? email;
    birthDate = json['birthDate'] ?? birthDate;
    mobilePhone = json['mobilePhone'] ?? mobilePhone;
    fullName = json['fullName'] ?? fullName;
    legalName = json['legalName'] ?? legalName;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['person'] = person;
    obj['account'] = account;
    obj['active'] = active;
    obj['username'] = username;
    obj['password'] = password;
    obj['email'] = email;
    obj['birthDate'] = birthDate;
    obj['mobilePhone'] = mobilePhone;
    obj['fullName'] = fullName;
    obj['legalName'] = legalName;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AccountAuthToken {
  String mainRole;
  DateTime expiresAt;
  String token;
  String rolesJson;
  String payload;
  String ipAddress;
  String userAgent;
  bool isValid = true;
  String account;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AccountAuthToken();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AccountAuthToken.jsonDecode(String jsonString) =>
      AccountAuthToken.fromJson(json.decode(jsonString));
  factory AccountAuthToken.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AccountAuthToken obj = new AccountAuthToken();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    mainRole = json['mainRole'] ?? mainRole;
    expiresAt = DateTime.tryParse(json['expiresAt'] ?? '') ?? expiresAt;
    token = json['token'] ?? token;
    rolesJson = json['rolesJson'] ?? rolesJson;
    payload = json['payload'] ?? payload;
    ipAddress = json['ipAddress'] ?? ipAddress;
    userAgent = json['userAgent'] ?? userAgent;
    isValid = json['isValid'] ?? isValid;
    account = json['account'] ?? account;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['mainRole'] = mainRole;
    obj['expiresAt'] = expiresAt.toString();
    obj['token'] = token;
    obj['rolesJson'] = rolesJson;
    obj['payload'] = payload;
    obj['ipAddress'] = ipAddress;
    obj['userAgent'] = userAgent;
    obj['isValid'] = isValid;
    obj['account'] = account;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AccountCode {
  String turnstileCode;
  String rfidAccessoryCode;
  String barCode;
  String qrCode;
  Account account;
  String code;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AccountCode();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AccountCode.jsonDecode(String jsonString) =>
      AccountCode.fromJson(json.decode(jsonString));
  factory AccountCode.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AccountCode obj = new AccountCode();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    turnstileCode = json['turnstileCode'] ?? turnstileCode;
    rfidAccessoryCode = json['rfidAccessoryCode'] ?? rfidAccessoryCode;
    barCode = json['barCode'] ?? barCode;
    qrCode = json['qrCode'] ?? qrCode;
    account = Account.fromJson(json['account']);
    code = json['code'] ?? code;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['turnstileCode'] = turnstileCode;
    obj['rfidAccessoryCode'] = rfidAccessoryCode;
    obj['barCode'] = barCode;
    obj['qrCode'] = qrCode;
    obj['account'] = account;
    obj['code'] = code;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AccountPermissionRefAccount {
  String account;
  String allowShowPoints;
  String allowExchange;
  String requirePlate;
  String allowPointsOnDifferentAccount;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AccountPermissionRefAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AccountPermissionRefAccount.jsonDecode(String jsonString) =>
      AccountPermissionRefAccount.fromJson(json.decode(jsonString));
  factory AccountPermissionRefAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AccountPermissionRefAccount obj = new AccountPermissionRefAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    account = json['account'] ?? account;
    allowShowPoints = json['allowShowPoints'] ?? allowShowPoints;
    allowExchange = json['allowExchange'] ?? allowExchange;
    requirePlate = json['requirePlate'] ?? requirePlate;
    allowPointsOnDifferentAccount = json['allowPointsOnDifferentAccount'] ?? allowPointsOnDifferentAccount;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['account'] = account;
    obj['allowShowPoints'] = allowShowPoints;
    obj['allowExchange'] = allowExchange;
    obj['requirePlate'] = requirePlate;
    obj['allowPointsOnDifferentAccount'] = allowPointsOnDifferentAccount;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AccountVehicle {
  Account account;
  bool active = false;
  String plate;
  String type;
  String brand;
  String model;
  String year;
  String color;
  String fuelConsumption;
  bool imported = false;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AccountVehicle();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AccountVehicle.jsonDecode(String jsonString) =>
      AccountVehicle.fromJson(json.decode(jsonString));
  factory AccountVehicle.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AccountVehicle obj = new AccountVehicle();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    account = Account.fromJson(json['account']);
    active = json['active'] ?? active;
    plate = json['plate'] ?? plate;
    type = json['type'] ?? type;
    brand = json['brand'] ?? brand;
    model = json['model'] ?? model;
    year = json['year'] ?? year;
    color = json['color'] ?? color;
    fuelConsumption = json['fuelConsumption'] ?? fuelConsumption;
    imported = json['imported'] ?? imported;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['account'] = account;
    obj['active'] = active;
    obj['plate'] = plate;
    obj['type'] = type;
    obj['brand'] = brand;
    obj['model'] = model;
    obj['year'] = year;
    obj['color'] = color;
    obj['fuelConsumption'] = fuelConsumption;
    obj['imported'] = imported;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AdministrationOfficeDocument {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AdministrationOfficeDocument();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AdministrationOfficeDocument.jsonDecode(String jsonString) =>
      AdministrationOfficeDocument.fromJson(json.decode(jsonString));
  factory AdministrationOfficeDocument.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AdministrationOfficeDocument obj = new AdministrationOfficeDocument();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AuthPermission {
  String name;
  String description;
  String permissionName;
  String controller;
  String action;
  String config;
  int systemId;
  AuthPermissionCategory authPermissionCategory;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AuthPermission();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AuthPermission.jsonDecode(String jsonString) =>
      AuthPermission.fromJson(json.decode(jsonString));
  factory AuthPermission.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AuthPermission obj = new AuthPermission();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    description = json['description'] ?? description;
    permissionName = json['permissionName'] ?? permissionName;
    controller = json['controller'] ?? controller;
    action = json['action'] ?? action;
    config = json['config'] ?? config;
    systemId = json['systemId'] ?? systemId;
    authPermissionCategory = AuthPermissionCategory.fromJson(json['authPermissionCategory']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['description'] = description;
    obj['permissionName'] = permissionName;
    obj['controller'] = controller;
    obj['action'] = action;
    obj['config'] = config;
    obj['systemId'] = systemId;
    obj['authPermissionCategory'] = authPermissionCategory;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AuthPermissionCategory {
  String name;
  int systemId;
  AuthPermissionCategory authPermissionCategory;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AuthPermissionCategory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AuthPermissionCategory.jsonDecode(String jsonString) =>
      AuthPermissionCategory.fromJson(json.decode(jsonString));
  factory AuthPermissionCategory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AuthPermissionCategory obj = new AuthPermissionCategory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    systemId = json['systemId'] ?? systemId;
    authPermissionCategory = AuthPermissionCategory.fromJson(json['authPermissionCategory']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['systemId'] = systemId;
    obj['authPermissionCategory'] = authPermissionCategory;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AuthRole {
  String name;
  String description;
  String roleName;
  bool sysadmin = false;
  int systemId;
  AuthRole authRole;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AuthRole();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AuthRole.jsonDecode(String jsonString) =>
      AuthRole.fromJson(json.decode(jsonString));
  factory AuthRole.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AuthRole obj = new AuthRole();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    description = json['description'] ?? description;
    roleName = json['roleName'] ?? roleName;
    sysadmin = json['sysadmin'] ?? sysadmin;
    systemId = json['systemId'] ?? systemId;
    authRole = AuthRole.fromJson(json['authRole']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['description'] = description;
    obj['roleName'] = roleName;
    obj['sysadmin'] = sysadmin;
    obj['systemId'] = systemId;
    obj['authRole'] = authRole;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class AuthRoleRefAuthPermission {
  AuthRole authRole;
  AuthPermission authPermission;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  AuthRoleRefAuthPermission();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory AuthRoleRefAuthPermission.jsonDecode(String jsonString) =>
      AuthRoleRefAuthPermission.fromJson(json.decode(jsonString));
  factory AuthRoleRefAuthPermission.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    AuthRoleRefAuthPermission obj = new AuthRoleRefAuthPermission();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    authRole = AuthRole.fromJson(json['authRole']);
    authPermission = AuthPermission.fromJson(json['authPermission']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['authRole'] = authRole;
    obj['authPermission'] = authPermission;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Bank {
  String name;
  String bankCode;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Bank();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Bank.jsonDecode(String jsonString) =>
      Bank.fromJson(json.decode(jsonString));
  factory Bank.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Bank obj = new Bank();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    bankCode = json['bankCode'] ?? bankCode;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['bankCode'] = bankCode;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class City {
  String name;
  String ibgeCode;
  CountryState countryState;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  City();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory City.jsonDecode(String jsonString) =>
      City.fromJson(json.decode(jsonString));
  factory City.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    City obj = new City();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    ibgeCode = json['ibgeCode'] ?? ibgeCode;
    countryState = CountryState.fromJson(json['countryState']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['ibgeCode'] = ibgeCode;
    obj['countryState'] = countryState;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CommonCancellationReason {
  bool isImmutable = false;
  int type;
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CommonCancellationReason();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CommonCancellationReason.jsonDecode(String jsonString) =>
      CommonCancellationReason.fromJson(json.decode(jsonString));
  factory CommonCancellationReason.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CommonCancellationReason obj = new CommonCancellationReason();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    isImmutable = json['isImmutable'] ?? isImmutable;
    type = json['type'] ?? type;
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['isImmutable'] = isImmutable;
    obj['type'] = type;
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CompanyBranch {
  Person person;
  String name;
  String legalName = "";
  String cpfCnpj = "";
  String address;
  int number;
  String district;
  String complement;
  int zipCode;
  String postBox;
  String latitude = "0";
  String longitude = "0";
  City city;
  bool active = false;
  RewardCompanyBranch rewardCompanyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CompanyBranch();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CompanyBranch.jsonDecode(String jsonString) =>
      CompanyBranch.fromJson(json.decode(jsonString));
  factory CompanyBranch.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CompanyBranch obj = new CompanyBranch();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    person = Person.fromJson(json['person']);
    name = json['name'] ?? name;
    legalName = json['legalName'] ?? legalName;
    cpfCnpj = json['cpfCnpj'] ?? cpfCnpj;
    address = json['address'] ?? address;
    number = json['number'] ?? number;
    district = json['district'] ?? district;
    complement = json['complement'] ?? complement;
    zipCode = json['zipCode'] ?? zipCode;
    postBox = json['postBox'] ?? postBox;
    latitude = json['latitude'] ?? latitude;
    longitude = json['longitude'] ?? longitude;
    city = City.fromJson(json['city']);
    active = json['active'] ?? active;
    rewardCompanyBranch = RewardCompanyBranch.fromJson(json['rewardCompanyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['person'] = person;
    obj['name'] = name;
    obj['legalName'] = legalName;
    obj['cpfCnpj'] = cpfCnpj;
    obj['address'] = address;
    obj['number'] = number;
    obj['district'] = district;
    obj['complement'] = complement;
    obj['zipCode'] = zipCode;
    obj['postBox'] = postBox;
    obj['latitude'] = latitude;
    obj['longitude'] = longitude;
    obj['city'] = city;
    obj['active'] = active;
    obj['rewardCompanyBranch'] = rewardCompanyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CompanyBranchCategory {
  String name;
  String reducedName;
  String active;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CompanyBranchCategory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CompanyBranchCategory.jsonDecode(String jsonString) =>
      CompanyBranchCategory.fromJson(json.decode(jsonString));
  factory CompanyBranchCategory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CompanyBranchCategory obj = new CompanyBranchCategory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    reducedName = json['reducedName'] ?? reducedName;
    active = json['active'] ?? active;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['reducedName'] = reducedName;
    obj['active'] = active;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CompanyBranchGroup {
  String name;
  String reducedName;
  String active = "1";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CompanyBranchGroup();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CompanyBranchGroup.jsonDecode(String jsonString) =>
      CompanyBranchGroup.fromJson(json.decode(jsonString));
  factory CompanyBranchGroup.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CompanyBranchGroup obj = new CompanyBranchGroup();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    reducedName = json['reducedName'] ?? reducedName;
    active = json['active'] ?? active;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['reducedName'] = reducedName;
    obj['active'] = active;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CompanyBranchImage {
  String companyBranch;
  String cover = "";
  String logo = "";
  String thumbnail = "";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CompanyBranchImage();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CompanyBranchImage.jsonDecode(String jsonString) =>
      CompanyBranchImage.fromJson(json.decode(jsonString));
  factory CompanyBranchImage.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CompanyBranchImage obj = new CompanyBranchImage();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    companyBranch = json['companyBranch'] ?? companyBranch;
    cover = json['cover'] ?? cover;
    logo = json['logo'] ?? logo;
    thumbnail = json['thumbnail'] ?? thumbnail;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['companyBranch'] = companyBranch;
    obj['cover'] = cover;
    obj['logo'] = logo;
    obj['thumbnail'] = thumbnail;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CompanyBranchRefCategory {
  CompanyBranch companyBranch;
  CompanyBranchCategory companyBranchCategory;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CompanyBranchRefCategory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CompanyBranchRefCategory.jsonDecode(String jsonString) =>
      CompanyBranchRefCategory.fromJson(json.decode(jsonString));
  factory CompanyBranchRefCategory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CompanyBranchRefCategory obj = new CompanyBranchRefCategory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    companyBranchCategory = CompanyBranchCategory.fromJson(json['companyBranchCategory']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['companyBranch'] = companyBranch;
    obj['companyBranchCategory'] = companyBranchCategory;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CompanyBranchRefGroup {
  CompanyBranch companyBranch;
  CompanyBranchGroup companyBranchGroup;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CompanyBranchRefGroup();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CompanyBranchRefGroup.jsonDecode(String jsonString) =>
      CompanyBranchRefGroup.fromJson(json.decode(jsonString));
  factory CompanyBranchRefGroup.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CompanyBranchRefGroup obj = new CompanyBranchRefGroup();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    companyBranchGroup = CompanyBranchGroup.fromJson(json['companyBranchGroup']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['companyBranch'] = companyBranch;
    obj['companyBranchGroup'] = companyBranchGroup;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Config {
  String name;
  ConfigType configType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Config();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Config.jsonDecode(String jsonString) =>
      Config.fromJson(json.decode(jsonString));
  factory Config.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Config obj = new Config();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    configType = ConfigType.fromJson(json['configType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['configType'] = configType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ConfigCategory {
  String name;
  String description;
  ConfigCategory configCategory;
  ConfigType configType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ConfigCategory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ConfigCategory.jsonDecode(String jsonString) =>
      ConfigCategory.fromJson(json.decode(jsonString));
  factory ConfigCategory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ConfigCategory obj = new ConfigCategory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    description = json['description'] ?? description;
    configCategory = ConfigCategory.fromJson(json['configCategory']);
    configType = ConfigType.fromJson(json['configType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['description'] = description;
    obj['configCategory'] = configCategory;
    obj['configType'] = configType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ConfigList {
  String configCode;
  String name;
  String defaultValue;
  String description;
  int dataType;
  ConfigCategory configCategory;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ConfigList();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ConfigList.jsonDecode(String jsonString) =>
      ConfigList.fromJson(json.decode(jsonString));
  factory ConfigList.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ConfigList obj = new ConfigList();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    configCode = json['configCode'] ?? configCode;
    name = json['name'] ?? name;
    defaultValue = json['defaultValue'] ?? defaultValue;
    description = json['description'] ?? description;
    dataType = json['dataType'] ?? dataType;
    configCategory = ConfigCategory.fromJson(json['configCategory']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['configCode'] = configCode;
    obj['name'] = name;
    obj['defaultValue'] = defaultValue;
    obj['description'] = description;
    obj['dataType'] = dataType;
    obj['configCategory'] = configCategory;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ConfigRefConfigList {
  String value;
  Config config;
  ConfigList configList;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ConfigRefConfigList();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ConfigRefConfigList.jsonDecode(String jsonString) =>
      ConfigRefConfigList.fromJson(json.decode(jsonString));
  factory ConfigRefConfigList.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ConfigRefConfigList obj = new ConfigRefConfigList();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    value = json['value'] ?? value;
    config = Config.fromJson(json['config']);
    configList = ConfigList.fromJson(json['configList']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['value'] = value;
    obj['config'] = config;
    obj['configList'] = configList;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ConfigType {
  String name;
  String description;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ConfigType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ConfigType.jsonDecode(String jsonString) =>
      ConfigType.fromJson(json.decode(jsonString));
  factory ConfigType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ConfigType obj = new ConfigType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    description = json['description'] ?? description;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['description'] = description;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Contract {
  String name;
  int type;
  int contractType;
  ContractModel contractModel;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Contract();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Contract.jsonDecode(String jsonString) =>
      Contract.fromJson(json.decode(jsonString));
  factory Contract.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Contract obj = new Contract();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    type = json['type'] ?? type;
    contractType = json['contractType'] ?? contractType;
    contractModel = ContractModel.fromJson(json['contractModel']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['type'] = type;
    obj['contractType'] = contractType;
    obj['contractModel'] = contractModel;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ContractModel {
  String name;
  String headerTemplate;
  String clausesTemplate;
  String paymentTemplate;
  String courseTemplate;
  String classTemplate;
  String template;
  ContractType contractType;
  CompanyBranch companyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ContractModel();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ContractModel.jsonDecode(String jsonString) =>
      ContractModel.fromJson(json.decode(jsonString));
  factory ContractModel.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ContractModel obj = new ContractModel();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    headerTemplate = json['headerTemplate'] ?? headerTemplate;
    clausesTemplate = json['clausesTemplate'] ?? clausesTemplate;
    paymentTemplate = json['paymentTemplate'] ?? paymentTemplate;
    courseTemplate = json['courseTemplate'] ?? courseTemplate;
    classTemplate = json['classTemplate'] ?? classTemplate;
    template = json['template'] ?? template;
    contractType = ContractType.fromJson(json['contractType']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['headerTemplate'] = headerTemplate;
    obj['clausesTemplate'] = clausesTemplate;
    obj['paymentTemplate'] = paymentTemplate;
    obj['courseTemplate'] = courseTemplate;
    obj['classTemplate'] = classTemplate;
    obj['template'] = template;
    obj['contractType'] = contractType;
    obj['companyBranch'] = companyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ContractType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ContractType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ContractType.jsonDecode(String jsonString) =>
      ContractType.fromJson(json.decode(jsonString));
  factory ContractType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ContractType obj = new ContractType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ContractTypeRefCostCenter {
  int type;
  CompanyBranch companyBranch;
  FinanceCostCenter financeCostCenter;
  FinanceAccountPlan financeAccountPlan;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ContractTypeRefCostCenter();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ContractTypeRefCostCenter.jsonDecode(String jsonString) =>
      ContractTypeRefCostCenter.fromJson(json.decode(jsonString));
  factory ContractTypeRefCostCenter.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ContractTypeRefCostCenter obj = new ContractTypeRefCostCenter();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    type = json['type'] ?? type;
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    financeCostCenter = FinanceCostCenter.fromJson(json['financeCostCenter']);
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['type'] = type;
    obj['companyBranch'] = companyBranch;
    obj['financeCostCenter'] = financeCostCenter;
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Country {
  String name;
  String countryCode;
  String abbreviation;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Country();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Country.jsonDecode(String jsonString) =>
      Country.fromJson(json.decode(jsonString));
  factory Country.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Country obj = new Country();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    countryCode = json['countryCode'] ?? countryCode;
    abbreviation = json['abbreviation'] ?? abbreviation;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['countryCode'] = countryCode;
    obj['abbreviation'] = abbreviation;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class CountryState {
  String name;
  String postalName;
  int ibgeCode;
  String areaCode;
  Country country;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  CountryState();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory CountryState.jsonDecode(String jsonString) =>
      CountryState.fromJson(json.decode(jsonString));
  factory CountryState.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    CountryState obj = new CountryState();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    postalName = json['postalName'] ?? postalName;
    ibgeCode = json['ibgeCode'] ?? ibgeCode;
    areaCode = json['areaCode'] ?? areaCode;
    country = Country.fromJson(json['country']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['postalName'] = postalName;
    obj['ibgeCode'] = ibgeCode;
    obj['areaCode'] = areaCode;
    obj['country'] = country;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Employee {
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Employee();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Employee.jsonDecode(String jsonString) =>
      Employee.fromJson(json.decode(jsonString));
  factory Employee.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Employee obj = new Employee();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EmployeeSalary {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EmployeeSalary();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EmployeeSalary.jsonDecode(String jsonString) =>
      EmployeeSalary.fromJson(json.decode(jsonString));
  factory EmployeeSalary.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EmployeeSalary obj = new EmployeeSalary();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EmployeeTimetable {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EmployeeTimetable();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EmployeeTimetable.jsonDecode(String jsonString) =>
      EmployeeTimetable.fromJson(json.decode(jsonString));
  factory EmployeeTimetable.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EmployeeTimetable obj = new EmployeeTimetable();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EnrollmentType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EnrollmentType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EnrollmentType.jsonDecode(String jsonString) =>
      EnrollmentType.fromJson(json.decode(jsonString));
  factory EnrollmentType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EnrollmentType obj = new EnrollmentType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Equipment {
  String name;
  CompanyBranch companyBranch;
  EquipmentModel equipmentModel;
  EquipmentType equipmentType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Equipment();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Equipment.jsonDecode(String jsonString) =>
      Equipment.fromJson(json.decode(jsonString));
  factory Equipment.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Equipment obj = new Equipment();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    equipmentModel = EquipmentModel.fromJson(json['equipmentModel']);
    equipmentType = EquipmentType.fromJson(json['equipmentType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['companyBranch'] = companyBranch;
    obj['equipmentModel'] = equipmentModel;
    obj['equipmentType'] = equipmentType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentBrand {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentBrand();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentBrand.jsonDecode(String jsonString) =>
      EquipmentBrand.fromJson(json.decode(jsonString));
  factory EquipmentBrand.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentBrand obj = new EquipmentBrand();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentModel {
  EquipmentBrand equipmentBrand;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentModel();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentModel.jsonDecode(String jsonString) =>
      EquipmentModel.fromJson(json.decode(jsonString));
  factory EquipmentModel.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentModel obj = new EquipmentModel();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    equipmentBrand = EquipmentBrand.fromJson(json['equipmentBrand']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['equipmentBrand'] = equipmentBrand;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentSimplifiedAccess {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentSimplifiedAccess();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentSimplifiedAccess.jsonDecode(String jsonString) =>
      EquipmentSimplifiedAccess.fromJson(json.decode(jsonString));
  factory EquipmentSimplifiedAccess.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentSimplifiedAccess obj = new EquipmentSimplifiedAccess();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentTurnstileRwtech {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentTurnstileRwtech();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentTurnstileRwtech.jsonDecode(String jsonString) =>
      EquipmentTurnstileRwtech.fromJson(json.decode(jsonString));
  factory EquipmentTurnstileRwtech.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentTurnstileRwtech obj = new EquipmentTurnstileRwtech();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentTurnstileTecnibra {
  String nameInterno;
  int typeComunicacao;
  int typeEquipamento;
  int typeFechadura;
  String servidorIp;
  int servidorPorta;
  String terminalIp;
  int terminalPorta;
  String terminalPortaSerial;
  String terminalSenha;
  int terminalNumero;
  String mensagemViradaLinha1;
  String mensagemViradaLinha2;
  String mensagemEntradaLinha1;
  String mensagemEntradaLinha2;
  String mensagemSaidaLinha1;
  String mensagemSaidaLinha2;
  String mensagemNegadoLinha1;
  String mensagemNegadoLinha2;
  String mensagemBloqueadoLinha1;
  String mensagemBloqueadoLinha2;
  int sentidoEntrada;
  bool leitorBioHabilitado = false;
  int leitorBioModoIdentificacao;
  int leitorBioPosicao;
  bool leitorBio2Habilitado = false;
  int leitorBio2Posicao;
  int leitorBio2PictogramaEsquerdo;
  int leitorBio2PictogramaDireito;
  int leitorBio2ModoOperacao;
  bool leitorBio2ConsultaListaCadastral = false;
  bool leitorBio2ConsultaTabelaHorarios = false;
  bool leitorBio2ConsultaSinaleiros = false;
  bool tecladoHabilitado = false;
  int tecladoPosicao;
  bool barcodeHabilitado = false;
  int barcodePosicao;
  int barcodeFormato;
  int barcodeNumeroDigitos;
  bool barcode2Habilitado = false;
  int barcode2Posicao;
  bool rfidHabilitado = false;
  int rfidPosicao;
  bool rfid2Habilitado = false;
  int rfid2Posicao;
  bool cofreColetorHabilitado = false;
  bool cofreColetorSensorColetaHabilitado = false;
  bool cofreBurroHabilitado = false;
  bool cofreTotem = false;
  int bracoGiroLiberado;
  int bracoGiroLiberadoPosicao;
  int bracoOfflineStatus;
  int bracoGiroTimeout;
  int memoriaCheiaStatus;
  int revistaGrau;
  int revistaType;
  int revistaTimeout;
  bool contadorDiplayHabilitado = false;
  int contadorDisplayPosicao;
  bool controleFechaduraSensorPortaPrincipalHabilitado = false;
  bool controleFechaduraSensorPortaSecundariaHabilitado = false;
  int controleFechaduraTypeFechadura;
  int controleFechaduraAvisoPortaAbertaTimeout;
  int timeoutServidor;
  Equipment equipment;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentTurnstileTecnibra();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentTurnstileTecnibra.jsonDecode(String jsonString) =>
      EquipmentTurnstileTecnibra.fromJson(json.decode(jsonString));
  factory EquipmentTurnstileTecnibra.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentTurnstileTecnibra obj = new EquipmentTurnstileTecnibra();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    nameInterno = json['nameInterno'] ?? nameInterno;
    typeComunicacao = json['typeComunicacao'] ?? typeComunicacao;
    typeEquipamento = json['typeEquipamento'] ?? typeEquipamento;
    typeFechadura = json['typeFechadura'] ?? typeFechadura;
    servidorIp = json['servidorIp'] ?? servidorIp;
    servidorPorta = json['servidorPorta'] ?? servidorPorta;
    terminalIp = json['terminalIp'] ?? terminalIp;
    terminalPorta = json['terminalPorta'] ?? terminalPorta;
    terminalPortaSerial = json['terminalPortaSerial'] ?? terminalPortaSerial;
    terminalSenha = json['terminalSenha'] ?? terminalSenha;
    terminalNumero = json['terminalNumero'] ?? terminalNumero;
    mensagemViradaLinha1 = json['mensagemViradaLinha1'] ?? mensagemViradaLinha1;
    mensagemViradaLinha2 = json['mensagemViradaLinha2'] ?? mensagemViradaLinha2;
    mensagemEntradaLinha1 = json['mensagemEntradaLinha1'] ?? mensagemEntradaLinha1;
    mensagemEntradaLinha2 = json['mensagemEntradaLinha2'] ?? mensagemEntradaLinha2;
    mensagemSaidaLinha1 = json['mensagemSaidaLinha1'] ?? mensagemSaidaLinha1;
    mensagemSaidaLinha2 = json['mensagemSaidaLinha2'] ?? mensagemSaidaLinha2;
    mensagemNegadoLinha1 = json['mensagemNegadoLinha1'] ?? mensagemNegadoLinha1;
    mensagemNegadoLinha2 = json['mensagemNegadoLinha2'] ?? mensagemNegadoLinha2;
    mensagemBloqueadoLinha1 = json['mensagemBloqueadoLinha1'] ?? mensagemBloqueadoLinha1;
    mensagemBloqueadoLinha2 = json['mensagemBloqueadoLinha2'] ?? mensagemBloqueadoLinha2;
    sentidoEntrada = json['sentidoEntrada'] ?? sentidoEntrada;
    leitorBioHabilitado = json['leitorBioHabilitado'] ?? leitorBioHabilitado;
    leitorBioModoIdentificacao = json['leitorBioModoIdentificacao'] ?? leitorBioModoIdentificacao;
    leitorBioPosicao = json['leitorBioPosicao'] ?? leitorBioPosicao;
    leitorBio2Habilitado = json['leitorBio2Habilitado'] ?? leitorBio2Habilitado;
    leitorBio2Posicao = json['leitorBio2Posicao'] ?? leitorBio2Posicao;
    leitorBio2PictogramaEsquerdo = json['leitorBio2PictogramaEsquerdo'] ?? leitorBio2PictogramaEsquerdo;
    leitorBio2PictogramaDireito = json['leitorBio2PictogramaDireito'] ?? leitorBio2PictogramaDireito;
    leitorBio2ModoOperacao = json['leitorBio2ModoOperacao'] ?? leitorBio2ModoOperacao;
    leitorBio2ConsultaListaCadastral = json['leitorBio2ConsultaListaCadastral'] ?? leitorBio2ConsultaListaCadastral;
    leitorBio2ConsultaTabelaHorarios = json['leitorBio2ConsultaTabelaHorarios'] ?? leitorBio2ConsultaTabelaHorarios;
    leitorBio2ConsultaSinaleiros = json['leitorBio2ConsultaSinaleiros'] ?? leitorBio2ConsultaSinaleiros;
    tecladoHabilitado = json['tecladoHabilitado'] ?? tecladoHabilitado;
    tecladoPosicao = json['tecladoPosicao'] ?? tecladoPosicao;
    barcodeHabilitado = json['barcodeHabilitado'] ?? barcodeHabilitado;
    barcodePosicao = json['barcodePosicao'] ?? barcodePosicao;
    barcodeFormato = json['barcodeFormato'] ?? barcodeFormato;
    barcodeNumeroDigitos = json['barcodeNumeroDigitos'] ?? barcodeNumeroDigitos;
    barcode2Habilitado = json['barcode2Habilitado'] ?? barcode2Habilitado;
    barcode2Posicao = json['barcode2Posicao'] ?? barcode2Posicao;
    rfidHabilitado = json['rfidHabilitado'] ?? rfidHabilitado;
    rfidPosicao = json['rfidPosicao'] ?? rfidPosicao;
    rfid2Habilitado = json['rfid2Habilitado'] ?? rfid2Habilitado;
    rfid2Posicao = json['rfid2Posicao'] ?? rfid2Posicao;
    cofreColetorHabilitado = json['cofreColetorHabilitado'] ?? cofreColetorHabilitado;
    cofreColetorSensorColetaHabilitado = json['cofreColetorSensorColetaHabilitado'] ?? cofreColetorSensorColetaHabilitado;
    cofreBurroHabilitado = json['cofreBurroHabilitado'] ?? cofreBurroHabilitado;
    cofreTotem = json['cofreTotem'] ?? cofreTotem;
    bracoGiroLiberado = json['bracoGiroLiberado'] ?? bracoGiroLiberado;
    bracoGiroLiberadoPosicao = json['bracoGiroLiberadoPosicao'] ?? bracoGiroLiberadoPosicao;
    bracoOfflineStatus = json['bracoOfflineStatus'] ?? bracoOfflineStatus;
    bracoGiroTimeout = json['bracoGiroTimeout'] ?? bracoGiroTimeout;
    memoriaCheiaStatus = json['memoriaCheiaStatus'] ?? memoriaCheiaStatus;
    revistaGrau = json['revistaGrau'] ?? revistaGrau;
    revistaType = json['revistaType'] ?? revistaType;
    revistaTimeout = json['revistaTimeout'] ?? revistaTimeout;
    contadorDiplayHabilitado = json['contadorDiplayHabilitado'] ?? contadorDiplayHabilitado;
    contadorDisplayPosicao = json['contadorDisplayPosicao'] ?? contadorDisplayPosicao;
    controleFechaduraSensorPortaPrincipalHabilitado = json['controleFechaduraSensorPortaPrincipalHabilitado'] ?? controleFechaduraSensorPortaPrincipalHabilitado;
    controleFechaduraSensorPortaSecundariaHabilitado = json['controleFechaduraSensorPortaSecundariaHabilitado'] ?? controleFechaduraSensorPortaSecundariaHabilitado;
    controleFechaduraTypeFechadura = json['controleFechaduraTypeFechadura'] ?? controleFechaduraTypeFechadura;
    controleFechaduraAvisoPortaAbertaTimeout = json['controleFechaduraAvisoPortaAbertaTimeout'] ?? controleFechaduraAvisoPortaAbertaTimeout;
    timeoutServidor = json['timeoutServidor'] ?? timeoutServidor;
    equipment = Equipment.fromJson(json['equipment']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['nameInterno'] = nameInterno;
    obj['typeComunicacao'] = typeComunicacao;
    obj['typeEquipamento'] = typeEquipamento;
    obj['typeFechadura'] = typeFechadura;
    obj['servidorIp'] = servidorIp;
    obj['servidorPorta'] = servidorPorta;
    obj['terminalIp'] = terminalIp;
    obj['terminalPorta'] = terminalPorta;
    obj['terminalPortaSerial'] = terminalPortaSerial;
    obj['terminalSenha'] = terminalSenha;
    obj['terminalNumero'] = terminalNumero;
    obj['mensagemViradaLinha1'] = mensagemViradaLinha1;
    obj['mensagemViradaLinha2'] = mensagemViradaLinha2;
    obj['mensagemEntradaLinha1'] = mensagemEntradaLinha1;
    obj['mensagemEntradaLinha2'] = mensagemEntradaLinha2;
    obj['mensagemSaidaLinha1'] = mensagemSaidaLinha1;
    obj['mensagemSaidaLinha2'] = mensagemSaidaLinha2;
    obj['mensagemNegadoLinha1'] = mensagemNegadoLinha1;
    obj['mensagemNegadoLinha2'] = mensagemNegadoLinha2;
    obj['mensagemBloqueadoLinha1'] = mensagemBloqueadoLinha1;
    obj['mensagemBloqueadoLinha2'] = mensagemBloqueadoLinha2;
    obj['sentidoEntrada'] = sentidoEntrada;
    obj['leitorBioHabilitado'] = leitorBioHabilitado;
    obj['leitorBioModoIdentificacao'] = leitorBioModoIdentificacao;
    obj['leitorBioPosicao'] = leitorBioPosicao;
    obj['leitorBio2Habilitado'] = leitorBio2Habilitado;
    obj['leitorBio2Posicao'] = leitorBio2Posicao;
    obj['leitorBio2PictogramaEsquerdo'] = leitorBio2PictogramaEsquerdo;
    obj['leitorBio2PictogramaDireito'] = leitorBio2PictogramaDireito;
    obj['leitorBio2ModoOperacao'] = leitorBio2ModoOperacao;
    obj['leitorBio2ConsultaListaCadastral'] = leitorBio2ConsultaListaCadastral;
    obj['leitorBio2ConsultaTabelaHorarios'] = leitorBio2ConsultaTabelaHorarios;
    obj['leitorBio2ConsultaSinaleiros'] = leitorBio2ConsultaSinaleiros;
    obj['tecladoHabilitado'] = tecladoHabilitado;
    obj['tecladoPosicao'] = tecladoPosicao;
    obj['barcodeHabilitado'] = barcodeHabilitado;
    obj['barcodePosicao'] = barcodePosicao;
    obj['barcodeFormato'] = barcodeFormato;
    obj['barcodeNumeroDigitos'] = barcodeNumeroDigitos;
    obj['barcode2Habilitado'] = barcode2Habilitado;
    obj['barcode2Posicao'] = barcode2Posicao;
    obj['rfidHabilitado'] = rfidHabilitado;
    obj['rfidPosicao'] = rfidPosicao;
    obj['rfid2Habilitado'] = rfid2Habilitado;
    obj['rfid2Posicao'] = rfid2Posicao;
    obj['cofreColetorHabilitado'] = cofreColetorHabilitado;
    obj['cofreColetorSensorColetaHabilitado'] = cofreColetorSensorColetaHabilitado;
    obj['cofreBurroHabilitado'] = cofreBurroHabilitado;
    obj['cofreTotem'] = cofreTotem;
    obj['bracoGiroLiberado'] = bracoGiroLiberado;
    obj['bracoGiroLiberadoPosicao'] = bracoGiroLiberadoPosicao;
    obj['bracoOfflineStatus'] = bracoOfflineStatus;
    obj['bracoGiroTimeout'] = bracoGiroTimeout;
    obj['memoriaCheiaStatus'] = memoriaCheiaStatus;
    obj['revistaGrau'] = revistaGrau;
    obj['revistaType'] = revistaType;
    obj['revistaTimeout'] = revistaTimeout;
    obj['contadorDiplayHabilitado'] = contadorDiplayHabilitado;
    obj['contadorDisplayPosicao'] = contadorDisplayPosicao;
    obj['controleFechaduraSensorPortaPrincipalHabilitado'] = controleFechaduraSensorPortaPrincipalHabilitado;
    obj['controleFechaduraSensorPortaSecundariaHabilitado'] = controleFechaduraSensorPortaSecundariaHabilitado;
    obj['controleFechaduraTypeFechadura'] = controleFechaduraTypeFechadura;
    obj['controleFechaduraAvisoPortaAbertaTimeout'] = controleFechaduraAvisoPortaAbertaTimeout;
    obj['timeoutServidor'] = timeoutServidor;
    obj['equipment'] = equipment;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentTurnstileTecnibraOfflineList {
  String codigo;
  String name;
  int horario;
  bool liberado = false;
  bool leitores = false;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentTurnstileTecnibraOfflineList();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentTurnstileTecnibraOfflineList.jsonDecode(String jsonString) =>
      EquipmentTurnstileTecnibraOfflineList.fromJson(json.decode(jsonString));
  factory EquipmentTurnstileTecnibraOfflineList.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentTurnstileTecnibraOfflineList obj = new EquipmentTurnstileTecnibraOfflineList();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    codigo = json['codigo'] ?? codigo;
    name = json['name'] ?? name;
    horario = json['horario'] ?? horario;
    liberado = json['liberado'] ?? liberado;
    leitores = json['leitores'] ?? leitores;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['codigo'] = codigo;
    obj['name'] = name;
    obj['horario'] = horario;
    obj['liberado'] = liberado;
    obj['leitores'] = leitores;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentTurnstileTecnibraSignaller {
  int diaSemana;
  DateTime horarioToque;
  int timeout;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentTurnstileTecnibraSignaller();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentTurnstileTecnibraSignaller.jsonDecode(String jsonString) =>
      EquipmentTurnstileTecnibraSignaller.fromJson(json.decode(jsonString));
  factory EquipmentTurnstileTecnibraSignaller.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentTurnstileTecnibraSignaller obj = new EquipmentTurnstileTecnibraSignaller();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    diaSemana = json['diaSemana'] ?? diaSemana;
    horarioToque = DateTime.tryParse(json['horarioToque'] ?? '') ?? horarioToque;
    timeout = json['timeout'] ?? timeout;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['diaSemana'] = diaSemana;
    obj['horarioToque'] = horarioToque.toString();
    obj['timeout'] = timeout;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentTurnstileTecnibraTimetable {
  int numeroTabela;
  int diaTabela;
  DateTime periodo1EntradaInicio;
  DateTime periodo1SaidaInicio;
  DateTime periodo1EntradaFim;
  DateTime periodo1SaidaFim;
  DateTime periodo2EntradaInicio;
  DateTime periodo2EntradaFim;
  DateTime periodo2SaidaInicio;
  DateTime periodo2SaidaFim;
  DateTime periodo3EntradaInicio;
  DateTime periodo3EntradaFim;
  DateTime periodo3SaidaInicio;
  DateTime periodo3SaidaFim;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentTurnstileTecnibraTimetable();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentTurnstileTecnibraTimetable.jsonDecode(String jsonString) =>
      EquipmentTurnstileTecnibraTimetable.fromJson(json.decode(jsonString));
  factory EquipmentTurnstileTecnibraTimetable.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentTurnstileTecnibraTimetable obj = new EquipmentTurnstileTecnibraTimetable();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    numeroTabela = json['numeroTabela'] ?? numeroTabela;
    diaTabela = json['diaTabela'] ?? diaTabela;
    periodo1EntradaInicio = DateTime.tryParse(json['periodo1EntradaInicio'] ?? '') ?? periodo1EntradaInicio;
    periodo1SaidaInicio = DateTime.tryParse(json['periodo1SaidaInicio'] ?? '') ?? periodo1SaidaInicio;
    periodo1EntradaFim = DateTime.tryParse(json['periodo1EntradaFim'] ?? '') ?? periodo1EntradaFim;
    periodo1SaidaFim = DateTime.tryParse(json['periodo1SaidaFim'] ?? '') ?? periodo1SaidaFim;
    periodo2EntradaInicio = DateTime.tryParse(json['periodo2EntradaInicio'] ?? '') ?? periodo2EntradaInicio;
    periodo2EntradaFim = DateTime.tryParse(json['periodo2EntradaFim'] ?? '') ?? periodo2EntradaFim;
    periodo2SaidaInicio = DateTime.tryParse(json['periodo2SaidaInicio'] ?? '') ?? periodo2SaidaInicio;
    periodo2SaidaFim = DateTime.tryParse(json['periodo2SaidaFim'] ?? '') ?? periodo2SaidaFim;
    periodo3EntradaInicio = DateTime.tryParse(json['periodo3EntradaInicio'] ?? '') ?? periodo3EntradaInicio;
    periodo3EntradaFim = DateTime.tryParse(json['periodo3EntradaFim'] ?? '') ?? periodo3EntradaFim;
    periodo3SaidaInicio = DateTime.tryParse(json['periodo3SaidaInicio'] ?? '') ?? periodo3SaidaInicio;
    periodo3SaidaFim = DateTime.tryParse(json['periodo3SaidaFim'] ?? '') ?? periodo3SaidaFim;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['numeroTabela'] = numeroTabela;
    obj['diaTabela'] = diaTabela;
    obj['periodo1EntradaInicio'] = periodo1EntradaInicio.toString();
    obj['periodo1SaidaInicio'] = periodo1SaidaInicio.toString();
    obj['periodo1EntradaFim'] = periodo1EntradaFim.toString();
    obj['periodo1SaidaFim'] = periodo1SaidaFim.toString();
    obj['periodo2EntradaInicio'] = periodo2EntradaInicio.toString();
    obj['periodo2EntradaFim'] = periodo2EntradaFim.toString();
    obj['periodo2SaidaInicio'] = periodo2SaidaInicio.toString();
    obj['periodo2SaidaFim'] = periodo2SaidaFim.toString();
    obj['periodo3EntradaInicio'] = periodo3EntradaInicio.toString();
    obj['periodo3EntradaFim'] = periodo3EntradaFim.toString();
    obj['periodo3SaidaInicio'] = periodo3SaidaInicio.toString();
    obj['periodo3SaidaFim'] = periodo3SaidaFim.toString();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentTurnstileTopdata {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentTurnstileTopdata();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentTurnstileTopdata.jsonDecode(String jsonString) =>
      EquipmentTurnstileTopdata.fromJson(json.decode(jsonString));
  factory EquipmentTurnstileTopdata.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentTurnstileTopdata obj = new EquipmentTurnstileTopdata();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class EquipmentType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  EquipmentType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory EquipmentType.jsonDecode(String jsonString) =>
      EquipmentType.fromJson(json.decode(jsonString));
  factory EquipmentType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    EquipmentType obj = new EquipmentType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceAccountPlan {
  String accountCode;
  String name;
  String description;
  bool analytic = false;
  int type;
  FinanceAccountPlan financeAccountPlan;
  CompanyBranch companyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceAccountPlan();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceAccountPlan.jsonDecode(String jsonString) =>
      FinanceAccountPlan.fromJson(json.decode(jsonString));
  factory FinanceAccountPlan.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceAccountPlan obj = new FinanceAccountPlan();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    accountCode = json['accountCode'] ?? accountCode;
    name = json['name'] ?? name;
    description = json['description'] ?? description;
    analytic = json['analytic'] ?? analytic;
    type = json['type'] ?? type;
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['accountCode'] = accountCode;
    obj['name'] = name;
    obj['description'] = description;
    obj['analytic'] = analytic;
    obj['type'] = type;
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['companyBranch'] = companyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceAccountPlanBalance {
  DateTime date = DateTime.now();
  String amount = "0";
  FinanceAccountPlan financeAccountPlan;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceAccountPlanBalance();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceAccountPlanBalance.jsonDecode(String jsonString) =>
      FinanceAccountPlanBalance.fromJson(json.decode(jsonString));
  factory FinanceAccountPlanBalance.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceAccountPlanBalance obj = new FinanceAccountPlanBalance();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    date = DateTime.tryParse(json['date'] ?? '') ?? date;
    amount = json['amount'] ?? amount;
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['date'] = date.toString();
    obj['amount'] = amount;
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceAccountPlanEntry {
  String amount = "0";
  FinanceAccountPlan financeAccountPlan;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceAccountPlanEntry();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceAccountPlanEntry.jsonDecode(String jsonString) =>
      FinanceAccountPlanEntry.fromJson(json.decode(jsonString));
  factory FinanceAccountPlanEntry.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceAccountPlanEntry obj = new FinanceAccountPlanEntry();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    amount = json['amount'] ?? amount;
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['amount'] = amount;
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceAccountPlanRefFinanceCostCenter {
  FinanceAccountPlan financeAccountPlan;
  FinanceCostCenter financeCostCenter;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceAccountPlanRefFinanceCostCenter();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceAccountPlanRefFinanceCostCenter.jsonDecode(String jsonString) =>
      FinanceAccountPlanRefFinanceCostCenter.fromJson(json.decode(jsonString));
  factory FinanceAccountPlanRefFinanceCostCenter.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceAccountPlanRefFinanceCostCenter obj = new FinanceAccountPlanRefFinanceCostCenter();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    financeCostCenter = FinanceCostCenter.fromJson(json['financeCostCenter']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['financeCostCenter'] = financeCostCenter;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceAccountType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceAccountType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceAccountType.jsonDecode(String jsonString) =>
      FinanceAccountType.fromJson(json.decode(jsonString));
  factory FinanceAccountType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceAccountType obj = new FinanceAccountType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceBankAccount {
  bool isDefault = false;
  int status;
  String accountName;
  String customName;
  String beneficiaryName;
  String beneficiaryCpfCnpj;
  String beneficiaryAddress;
  String agencyNumber;
  String agencyDigit;
  String accountNumber;
  String accountDigit;
  String extra1;
  String extra1Digit;
  String extra2;
  String extra2Digit;
  String extra3;
  String walletCode;
  int nextRemittanceNumber;
  int nextOurNumber;
  String cnabType;
  bool enableBankingBillet = false;
  bool enableCheckCustody = false;
  DateTime certifiedAt;
  String certifiedBy;
  Bank bank;
  CompanyBranch companyBranch;
  FinanceAccountPlan financeAccountPlan;
  FinanceCostCenter financeCostCenter;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceBankAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceBankAccount.jsonDecode(String jsonString) =>
      FinanceBankAccount.fromJson(json.decode(jsonString));
  factory FinanceBankAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceBankAccount obj = new FinanceBankAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    isDefault = json['isDefault'] ?? isDefault;
    status = json['status'] ?? status;
    accountName = json['accountName'] ?? accountName;
    customName = json['customName'] ?? customName;
    beneficiaryName = json['beneficiaryName'] ?? beneficiaryName;
    beneficiaryCpfCnpj = json['beneficiaryCpfCnpj'] ?? beneficiaryCpfCnpj;
    beneficiaryAddress = json['beneficiaryAddress'] ?? beneficiaryAddress;
    agencyNumber = json['agencyNumber'] ?? agencyNumber;
    agencyDigit = json['agencyDigit'] ?? agencyDigit;
    accountNumber = json['accountNumber'] ?? accountNumber;
    accountDigit = json['accountDigit'] ?? accountDigit;
    extra1 = json['extra1'] ?? extra1;
    extra1Digit = json['extra1Digit'] ?? extra1Digit;
    extra2 = json['extra2'] ?? extra2;
    extra2Digit = json['extra2Digit'] ?? extra2Digit;
    extra3 = json['extra3'] ?? extra3;
    walletCode = json['walletCode'] ?? walletCode;
    nextRemittanceNumber = json['nextRemittanceNumber'] ?? nextRemittanceNumber;
    nextOurNumber = json['nextOurNumber'] ?? nextOurNumber;
    cnabType = json['cnabType'] ?? cnabType;
    enableBankingBillet = json['enableBankingBillet'] ?? enableBankingBillet;
    enableCheckCustody = json['enableCheckCustody'] ?? enableCheckCustody;
    certifiedAt = DateTime.tryParse(json['certifiedAt'] ?? '') ?? certifiedAt;
    certifiedBy = json['certifiedBy'] ?? certifiedBy;
    bank = Bank.fromJson(json['bank']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    financeCostCenter = FinanceCostCenter.fromJson(json['financeCostCenter']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['isDefault'] = isDefault;
    obj['status'] = status;
    obj['accountName'] = accountName;
    obj['customName'] = customName;
    obj['beneficiaryName'] = beneficiaryName;
    obj['beneficiaryCpfCnpj'] = beneficiaryCpfCnpj;
    obj['beneficiaryAddress'] = beneficiaryAddress;
    obj['agencyNumber'] = agencyNumber;
    obj['agencyDigit'] = agencyDigit;
    obj['accountNumber'] = accountNumber;
    obj['accountDigit'] = accountDigit;
    obj['extra1'] = extra1;
    obj['extra1Digit'] = extra1Digit;
    obj['extra2'] = extra2;
    obj['extra2Digit'] = extra2Digit;
    obj['extra3'] = extra3;
    obj['walletCode'] = walletCode;
    obj['nextRemittanceNumber'] = nextRemittanceNumber;
    obj['nextOurNumber'] = nextOurNumber;
    obj['cnabType'] = cnabType;
    obj['enableBankingBillet'] = enableBankingBillet;
    obj['enableCheckCustody'] = enableCheckCustody;
    obj['certifiedAt'] = certifiedAt.toString();
    obj['certifiedBy'] = certifiedBy;
    obj['bank'] = bank;
    obj['companyBranch'] = companyBranch;
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['financeCostCenter'] = financeCostCenter;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceBankBillet {
  String uuid;
  String sequence;
  String amount = "0";
  String paidAmount = "0";
  int discountType;
  String discountValue = "0";
  String discountPercentage = "0";
  int daysForDiscount;
  String description;
  String meta;
  String tags;
  String instructions;
  String documentType;
  DateTime documentDate;
  String documentNumber;
  String line;
  int ourNumber;
  String ourNumberWithDigit;
  String ourNumberFormatted;
  DateTime dueDate;
  DateTime initialDueDate;
  DateTime paidDate;
  String codBanco;
  String agencia;
  String agenciaDigito;
  String conta;
  String contaDigito;
  String valor;
  int descontoPontualidadeType;
  String decontoPontualidadeValor = "0";
  DateTime descontoPontualidadeData;
  String carteira;
  String codConvenio;
  String instrucaoLinha1;
  String instrucaoLinha2;
  String instrucaoLinha3;
  String instrucaoLinha4;
  String instrucaoLinha5;
  String observacoes;
  String emitenteDocumento;
  String emitenteName;
  String emitenteEndereco;
  String emitenteBairro;
  String emitenteCep;
  String emitenteCidade;
  String emitenteUf;
  String sacadoDocumento;
  String sacadoName;
  String sacadoEndereco;
  String sacadoCep;
  String sacadoCidade;
  String sacadoUf;
  Bank bank;
  FinanceBilling financeBilling;
  FinanceBankAccount financeBankAccount;
  CommonCancellationReason commonCancellationReason;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceBankBillet();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceBankBillet.jsonDecode(String jsonString) =>
      FinanceBankBillet.fromJson(json.decode(jsonString));
  factory FinanceBankBillet.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceBankBillet obj = new FinanceBankBillet();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    uuid = json['uuid'] ?? uuid;
    sequence = json['sequence'] ?? sequence;
    amount = json['amount'] ?? amount;
    paidAmount = json['paidAmount'] ?? paidAmount;
    discountType = json['discountType'] ?? discountType;
    discountValue = json['discountValue'] ?? discountValue;
    discountPercentage = json['discountPercentage'] ?? discountPercentage;
    daysForDiscount = json['daysForDiscount'] ?? daysForDiscount;
    description = json['description'] ?? description;
    meta = json['meta'] ?? meta;
    tags = json['tags'] ?? tags;
    instructions = json['instructions'] ?? instructions;
    documentType = json['documentType'] ?? documentType;
    documentDate = DateTime.tryParse(json['documentDate'] ?? '') ?? documentDate;
    documentNumber = json['documentNumber'] ?? documentNumber;
    line = json['line'] ?? line;
    ourNumber = json['ourNumber'] ?? ourNumber;
    ourNumberWithDigit = json['ourNumberWithDigit'] ?? ourNumberWithDigit;
    ourNumberFormatted = json['ourNumberFormatted'] ?? ourNumberFormatted;
    dueDate = DateTime.tryParse(json['dueDate'] ?? '') ?? dueDate;
    initialDueDate = DateTime.tryParse(json['initialDueDate'] ?? '') ?? initialDueDate;
    paidDate = DateTime.tryParse(json['paidDate'] ?? '') ?? paidDate;
    codBanco = json['codBanco'] ?? codBanco;
    agencia = json['agencia'] ?? agencia;
    agenciaDigito = json['agenciaDigito'] ?? agenciaDigito;
    conta = json['conta'] ?? conta;
    contaDigito = json['contaDigito'] ?? contaDigito;
    valor = json['valor'] ?? valor;
    descontoPontualidadeType = json['descontoPontualidadeType'] ?? descontoPontualidadeType;
    decontoPontualidadeValor = json['decontoPontualidadeValor'] ?? decontoPontualidadeValor;
    descontoPontualidadeData = DateTime.tryParse(json['descontoPontualidadeData'] ?? '') ?? descontoPontualidadeData;
    carteira = json['carteira'] ?? carteira;
    codConvenio = json['codConvenio'] ?? codConvenio;
    instrucaoLinha1 = json['instrucaoLinha1'] ?? instrucaoLinha1;
    instrucaoLinha2 = json['instrucaoLinha2'] ?? instrucaoLinha2;
    instrucaoLinha3 = json['instrucaoLinha3'] ?? instrucaoLinha3;
    instrucaoLinha4 = json['instrucaoLinha4'] ?? instrucaoLinha4;
    instrucaoLinha5 = json['instrucaoLinha5'] ?? instrucaoLinha5;
    observacoes = json['observacoes'] ?? observacoes;
    emitenteDocumento = json['emitenteDocumento'] ?? emitenteDocumento;
    emitenteName = json['emitenteName'] ?? emitenteName;
    emitenteEndereco = json['emitenteEndereco'] ?? emitenteEndereco;
    emitenteBairro = json['emitenteBairro'] ?? emitenteBairro;
    emitenteCep = json['emitenteCep'] ?? emitenteCep;
    emitenteCidade = json['emitenteCidade'] ?? emitenteCidade;
    emitenteUf = json['emitenteUf'] ?? emitenteUf;
    sacadoDocumento = json['sacadoDocumento'] ?? sacadoDocumento;
    sacadoName = json['sacadoName'] ?? sacadoName;
    sacadoEndereco = json['sacadoEndereco'] ?? sacadoEndereco;
    sacadoCep = json['sacadoCep'] ?? sacadoCep;
    sacadoCidade = json['sacadoCidade'] ?? sacadoCidade;
    sacadoUf = json['sacadoUf'] ?? sacadoUf;
    bank = Bank.fromJson(json['bank']);
    financeBilling = FinanceBilling.fromJson(json['financeBilling']);
    financeBankAccount = FinanceBankAccount.fromJson(json['financeBankAccount']);
    commonCancellationReason = CommonCancellationReason.fromJson(json['commonCancellationReason']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['uuid'] = uuid;
    obj['sequence'] = sequence;
    obj['amount'] = amount;
    obj['paidAmount'] = paidAmount;
    obj['discountType'] = discountType;
    obj['discountValue'] = discountValue;
    obj['discountPercentage'] = discountPercentage;
    obj['daysForDiscount'] = daysForDiscount;
    obj['description'] = description;
    obj['meta'] = meta;
    obj['tags'] = tags;
    obj['instructions'] = instructions;
    obj['documentType'] = documentType;
    obj['documentDate'] = documentDate.toString();
    obj['documentNumber'] = documentNumber;
    obj['line'] = line;
    obj['ourNumber'] = ourNumber;
    obj['ourNumberWithDigit'] = ourNumberWithDigit;
    obj['ourNumberFormatted'] = ourNumberFormatted;
    obj['dueDate'] = dueDate.toString();
    obj['initialDueDate'] = initialDueDate.toString();
    obj['paidDate'] = paidDate.toString();
    obj['codBanco'] = codBanco;
    obj['agencia'] = agencia;
    obj['agenciaDigito'] = agenciaDigito;
    obj['conta'] = conta;
    obj['contaDigito'] = contaDigito;
    obj['valor'] = valor;
    obj['descontoPontualidadeType'] = descontoPontualidadeType;
    obj['decontoPontualidadeValor'] = decontoPontualidadeValor;
    obj['descontoPontualidadeData'] = descontoPontualidadeData.toString();
    obj['carteira'] = carteira;
    obj['codConvenio'] = codConvenio;
    obj['instrucaoLinha1'] = instrucaoLinha1;
    obj['instrucaoLinha2'] = instrucaoLinha2;
    obj['instrucaoLinha3'] = instrucaoLinha3;
    obj['instrucaoLinha4'] = instrucaoLinha4;
    obj['instrucaoLinha5'] = instrucaoLinha5;
    obj['observacoes'] = observacoes;
    obj['emitenteDocumento'] = emitenteDocumento;
    obj['emitenteName'] = emitenteName;
    obj['emitenteEndereco'] = emitenteEndereco;
    obj['emitenteBairro'] = emitenteBairro;
    obj['emitenteCep'] = emitenteCep;
    obj['emitenteCidade'] = emitenteCidade;
    obj['emitenteUf'] = emitenteUf;
    obj['sacadoDocumento'] = sacadoDocumento;
    obj['sacadoName'] = sacadoName;
    obj['sacadoEndereco'] = sacadoEndereco;
    obj['sacadoCep'] = sacadoCep;
    obj['sacadoCidade'] = sacadoCidade;
    obj['sacadoUf'] = sacadoUf;
    obj['bank'] = bank;
    obj['financeBilling'] = financeBilling;
    obj['financeBankAccount'] = financeBankAccount;
    obj['commonCancellationReason'] = commonCancellationReason;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceBankReconciliation {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceBankReconciliation();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceBankReconciliation.jsonDecode(String jsonString) =>
      FinanceBankReconciliation.fromJson(json.decode(jsonString));
  factory FinanceBankReconciliation.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceBankReconciliation obj = new FinanceBankReconciliation();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceBilling {
  String amount = "0";
  String amountWithDiscount = "0";
  String discount = "0";
  String valorDesconto = "0";
  String valorPago = "0";
  DateTime dataPontualidade;
  DateTime dataEmisao;
  DateTime processDate;
  DateTime dueDate;
  DateTime paymentDate;
  DateTime terminationDate;
  int situacao;
  int typeDocumento;
  int typeConta;
  bool conciliado = false;
  DateTime dataConciliacao;
  int typeNota;
  String numeroNota;
  String observacao;
  String observacoesCancelamento;
  String recibo;
  String codTransacao;
  String nossoNumero;
  FinanceCostCenter financeCostCenter;
  FinanceAccountPlan financeAccountPlan;
  FinanceBankAccount financeBankAccount;
  Person person;
  Person idPersonOwner;
  CompanyBranch companyBranch;
  FinanceAccountType financeAccountType;
  FinancePaymentType financePaymentType;
  CommonCancellationReason commonCancellationReason;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceBilling();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceBilling.jsonDecode(String jsonString) =>
      FinanceBilling.fromJson(json.decode(jsonString));
  factory FinanceBilling.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceBilling obj = new FinanceBilling();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    amount = json['amount'] ?? amount;
    amountWithDiscount = json['amountWithDiscount'] ?? amountWithDiscount;
    discount = json['discount'] ?? discount;
    valorDesconto = json['valorDesconto'] ?? valorDesconto;
    valorPago = json['valorPago'] ?? valorPago;
    dataPontualidade = DateTime.tryParse(json['dataPontualidade'] ?? '') ?? dataPontualidade;
    dataEmisao = DateTime.tryParse(json['dataEmisao'] ?? '') ?? dataEmisao;
    processDate = DateTime.tryParse(json['processDate'] ?? '') ?? processDate;
    dueDate = DateTime.tryParse(json['dueDate'] ?? '') ?? dueDate;
    paymentDate = DateTime.tryParse(json['paymentDate'] ?? '') ?? paymentDate;
    terminationDate = DateTime.tryParse(json['terminationDate'] ?? '') ?? terminationDate;
    situacao = json['situacao'] ?? situacao;
    typeDocumento = json['typeDocumento'] ?? typeDocumento;
    typeConta = json['typeConta'] ?? typeConta;
    conciliado = json['conciliado'] ?? conciliado;
    dataConciliacao = DateTime.tryParse(json['dataConciliacao'] ?? '') ?? dataConciliacao;
    typeNota = json['typeNota'] ?? typeNota;
    numeroNota = json['numeroNota'] ?? numeroNota;
    observacao = json['observacao'] ?? observacao;
    observacoesCancelamento = json['observacoesCancelamento'] ?? observacoesCancelamento;
    recibo = json['recibo'] ?? recibo;
    codTransacao = json['codTransacao'] ?? codTransacao;
    nossoNumero = json['nossoNumero'] ?? nossoNumero;
    financeCostCenter = FinanceCostCenter.fromJson(json['financeCostCenter']);
    financeAccountPlan = FinanceAccountPlan.fromJson(json['financeAccountPlan']);
    financeBankAccount = FinanceBankAccount.fromJson(json['financeBankAccount']);
    person = Person.fromJson(json['person']);
    idPersonOwner = Person.fromJson(json['idPersonOwner']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    financeAccountType = FinanceAccountType.fromJson(json['financeAccountType']);
    financePaymentType = FinancePaymentType.fromJson(json['financePaymentType']);
    commonCancellationReason = CommonCancellationReason.fromJson(json['commonCancellationReason']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['amount'] = amount;
    obj['amountWithDiscount'] = amountWithDiscount;
    obj['discount'] = discount;
    obj['valorDesconto'] = valorDesconto;
    obj['valorPago'] = valorPago;
    obj['dataPontualidade'] = dataPontualidade.toString();
    obj['dataEmisao'] = dataEmisao.toString();
    obj['processDate'] = processDate.toString();
    obj['dueDate'] = dueDate.toString();
    obj['paymentDate'] = paymentDate.toString();
    obj['terminationDate'] = terminationDate.toString();
    obj['situacao'] = situacao;
    obj['typeDocumento'] = typeDocumento;
    obj['typeConta'] = typeConta;
    obj['conciliado'] = conciliado;
    obj['dataConciliacao'] = dataConciliacao.toString();
    obj['typeNota'] = typeNota;
    obj['numeroNota'] = numeroNota;
    obj['observacao'] = observacao;
    obj['observacoesCancelamento'] = observacoesCancelamento;
    obj['recibo'] = recibo;
    obj['codTransacao'] = codTransacao;
    obj['nossoNumero'] = nossoNumero;
    obj['financeCostCenter'] = financeCostCenter;
    obj['financeAccountPlan'] = financeAccountPlan;
    obj['financeBankAccount'] = financeBankAccount;
    obj['person'] = person;
    obj['idPersonOwner'] = idPersonOwner;
    obj['companyBranch'] = companyBranch;
    obj['financeAccountType'] = financeAccountType;
    obj['financePaymentType'] = financePaymentType;
    obj['commonCancellationReason'] = commonCancellationReason;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceCardPayment {
  FinanceBilling financeBilling;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceCardPayment();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceCardPayment.jsonDecode(String jsonString) =>
      FinanceCardPayment.fromJson(json.decode(jsonString));
  factory FinanceCardPayment.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceCardPayment obj = new FinanceCardPayment();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    financeBilling = FinanceBilling.fromJson(json['financeBilling']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['financeBilling'] = financeBilling;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceCashFlow {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceCashFlow();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceCashFlow.jsonDecode(String jsonString) =>
      FinanceCashFlow.fromJson(json.decode(jsonString));
  factory FinanceCashFlow.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceCashFlow obj = new FinanceCashFlow();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceCfop {
  String remarks;
  int cfopCode;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceCfop();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceCfop.jsonDecode(String jsonString) =>
      FinanceCfop.fromJson(json.decode(jsonString));
  factory FinanceCfop.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceCfop obj = new FinanceCfop();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    remarks = json['remarks'] ?? remarks;
    cfopCode = json['cfopCode'] ?? cfopCode;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['remarks'] = remarks;
    obj['cfopCode'] = cfopCode;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceCheck {
  String cmc7;
  String dataEmissao;
  String dueDate;
  String processDate;
  String type;
  String amount;
  String nominal;
  String cmc7Agencia;
  String cmc7Conta;
  String cmc7Comp;
  String cmc7NumCheque;
  String imagem;
  Bank bank;
  FinanceBilling financeBilling;
  Bank bankCmc7;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceCheck();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceCheck.jsonDecode(String jsonString) =>
      FinanceCheck.fromJson(json.decode(jsonString));
  factory FinanceCheck.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceCheck obj = new FinanceCheck();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    cmc7 = json['cmc7'] ?? cmc7;
    dataEmissao = json['dataEmissao'] ?? dataEmissao;
    dueDate = json['dueDate'] ?? dueDate;
    processDate = json['processDate'] ?? processDate;
    type = json['type'] ?? type;
    amount = json['amount'] ?? amount;
    nominal = json['nominal'] ?? nominal;
    cmc7Agencia = json['cmc7Agencia'] ?? cmc7Agencia;
    cmc7Conta = json['cmc7Conta'] ?? cmc7Conta;
    cmc7Comp = json['cmc7Comp'] ?? cmc7Comp;
    cmc7NumCheque = json['cmc7NumCheque'] ?? cmc7NumCheque;
    imagem = json['imagem'] ?? imagem;
    bank = Bank.fromJson(json['bank']);
    financeBilling = FinanceBilling.fromJson(json['financeBilling']);
    bankCmc7 = Bank.fromJson(json['bankCmc7']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['cmc7'] = cmc7;
    obj['dataEmissao'] = dataEmissao;
    obj['dueDate'] = dueDate;
    obj['processDate'] = processDate;
    obj['type'] = type;
    obj['amount'] = amount;
    obj['nominal'] = nominal;
    obj['cmc7Agencia'] = cmc7Agencia;
    obj['cmc7Conta'] = cmc7Conta;
    obj['cmc7Comp'] = cmc7Comp;
    obj['cmc7NumCheque'] = cmc7NumCheque;
    obj['imagem'] = imagem;
    obj['bank'] = bank;
    obj['financeBilling'] = financeBilling;
    obj['bankCmc7'] = bankCmc7;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceCostCenter {
  String financeAccount;
  String name;
  String remarks;
  bool analytic = false;
  int type;
  FinanceCostCenter financeCostCenter;
  CompanyBranch companyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceCostCenter();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceCostCenter.jsonDecode(String jsonString) =>
      FinanceCostCenter.fromJson(json.decode(jsonString));
  factory FinanceCostCenter.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceCostCenter obj = new FinanceCostCenter();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    financeAccount = json['financeAccount'] ?? financeAccount;
    name = json['name'] ?? name;
    remarks = json['remarks'] ?? remarks;
    analytic = json['analytic'] ?? analytic;
    type = json['type'] ?? type;
    financeCostCenter = FinanceCostCenter.fromJson(json['financeCostCenter']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['financeAccount'] = financeAccount;
    obj['name'] = name;
    obj['remarks'] = remarks;
    obj['analytic'] = analytic;
    obj['type'] = type;
    obj['financeCostCenter'] = financeCostCenter;
    obj['companyBranch'] = companyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceDeposit {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceDeposit();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceDeposit.jsonDecode(String jsonString) =>
      FinanceDeposit.fromJson(json.decode(jsonString));
  factory FinanceDeposit.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceDeposit obj = new FinanceDeposit();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceFebrabanForwarding {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceFebrabanForwarding();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceFebrabanForwarding.jsonDecode(String jsonString) =>
      FinanceFebrabanForwarding.fromJson(json.decode(jsonString));
  factory FinanceFebrabanForwarding.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceFebrabanForwarding obj = new FinanceFebrabanForwarding();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceFebrabanResponse {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceFebrabanResponse();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceFebrabanResponse.jsonDecode(String jsonString) =>
      FinanceFebrabanResponse.fromJson(json.decode(jsonString));
  factory FinanceFebrabanResponse.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceFebrabanResponse obj = new FinanceFebrabanResponse();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinanceNfe {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinanceNfe();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinanceNfe.jsonDecode(String jsonString) =>
      FinanceNfe.fromJson(json.decode(jsonString));
  factory FinanceNfe.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinanceNfe obj = new FinanceNfe();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class FinancePaymentType {
  String name;
  int type;
  int paymentType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  FinancePaymentType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory FinancePaymentType.jsonDecode(String jsonString) =>
      FinancePaymentType.fromJson(json.decode(jsonString));
  factory FinancePaymentType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    FinancePaymentType obj = new FinancePaymentType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    type = json['type'] ?? type;
    paymentType = json['paymentType'] ?? paymentType;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['type'] = type;
    obj['paymentType'] = paymentType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class IndicationConfig {
  String maxLevel = "1";
  String maxInternalLevel = "10";
  String percentageAllocForIndication = "30";
  String lockPointsIfNotPurchase = "1";
  String lockLimitPastPurchaseInDays = "30";
  String lockMinPastPurchaseCount = "1";
  String lockIndicationIfRegistrationIsNotComplete = "1";
  String depthLimit = "1";
  String indicationLimit = "20";
  String absenceTriggersPointsBlock = "1";
  String lockLimitPastPurchase = "30";
  String showAccountInfoToUpperLevels = "";
  String showPurchaseDetailsToUpperLevels = "";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  IndicationConfig();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory IndicationConfig.jsonDecode(String jsonString) =>
      IndicationConfig.fromJson(json.decode(jsonString));
  factory IndicationConfig.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    IndicationConfig obj = new IndicationConfig();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    maxLevel = json['maxLevel'] ?? maxLevel;
    maxInternalLevel = json['maxInternalLevel'] ?? maxInternalLevel;
    percentageAllocForIndication = json['percentageAllocForIndication'] ?? percentageAllocForIndication;
    lockPointsIfNotPurchase = json['lockPointsIfNotPurchase'] ?? lockPointsIfNotPurchase;
    lockLimitPastPurchaseInDays = json['lockLimitPastPurchaseInDays'] ?? lockLimitPastPurchaseInDays;
    lockMinPastPurchaseCount = json['lockMinPastPurchaseCount'] ?? lockMinPastPurchaseCount;
    lockIndicationIfRegistrationIsNotComplete = json['lockIndicationIfRegistrationIsNotComplete'] ?? lockIndicationIfRegistrationIsNotComplete;
    depthLimit = json['depthLimit'] ?? depthLimit;
    indicationLimit = json['indicationLimit'] ?? indicationLimit;
    absenceTriggersPointsBlock = json['absenceTriggersPointsBlock'] ?? absenceTriggersPointsBlock;
    lockLimitPastPurchase = json['lockLimitPastPurchase'] ?? lockLimitPastPurchase;
    showAccountInfoToUpperLevels = json['showAccountInfoToUpperLevels'] ?? showAccountInfoToUpperLevels;
    showPurchaseDetailsToUpperLevels = json['showPurchaseDetailsToUpperLevels'] ?? showPurchaseDetailsToUpperLevels;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['maxLevel'] = maxLevel;
    obj['maxInternalLevel'] = maxInternalLevel;
    obj['percentageAllocForIndication'] = percentageAllocForIndication;
    obj['lockPointsIfNotPurchase'] = lockPointsIfNotPurchase;
    obj['lockLimitPastPurchaseInDays'] = lockLimitPastPurchaseInDays;
    obj['lockMinPastPurchaseCount'] = lockMinPastPurchaseCount;
    obj['lockIndicationIfRegistrationIsNotComplete'] = lockIndicationIfRegistrationIsNotComplete;
    obj['depthLimit'] = depthLimit;
    obj['indicationLimit'] = indicationLimit;
    obj['absenceTriggersPointsBlock'] = absenceTriggersPointsBlock;
    obj['lockLimitPastPurchase'] = lockLimitPastPurchase;
    obj['showAccountInfoToUpperLevels'] = showAccountInfoToUpperLevels;
    obj['showPurchaseDetailsToUpperLevels'] = showPurchaseDetailsToUpperLevels;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class IoAccessRecord {
  DateTime recordDatetime;
  String terminal;
  int type;
  bool sent = false;
  Person person;
  CompanyBranch companyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  IoAccessRecord();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory IoAccessRecord.jsonDecode(String jsonString) =>
      IoAccessRecord.fromJson(json.decode(jsonString));
  factory IoAccessRecord.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    IoAccessRecord obj = new IoAccessRecord();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    recordDatetime = DateTime.tryParse(json['recordDatetime'] ?? '') ?? recordDatetime;
    terminal = json['terminal'] ?? terminal;
    type = json['type'] ?? type;
    sent = json['sent'] ?? sent;
    person = Person.fromJson(json['person']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['recordDatetime'] = recordDatetime.toString();
    obj['terminal'] = terminal;
    obj['type'] = type;
    obj['sent'] = sent;
    obj['person'] = person;
    obj['companyBranch'] = companyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Log {
  int userId;
  String table;
  String action;
  String jsonDoc;
  CompanyBranch companyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Log();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Log.jsonDecode(String jsonString) =>
      Log.fromJson(json.decode(jsonString));
  factory Log.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Log obj = new Log();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? userId;
    table = json['table'] ?? table;
    action = json['action'] ?? action;
    jsonDoc = json['jsonDoc'] ?? jsonDoc;
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['userId'] = userId;
    obj['table'] = table;
    obj['action'] = action;
    obj['jsonDoc'] = jsonDoc;
    obj['companyBranch'] = companyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Mailing {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Mailing();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Mailing.jsonDecode(String jsonString) =>
      Mailing.fromJson(json.decode(jsonString));
  factory Mailing.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Mailing obj = new Mailing();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingCampaign {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingCampaign();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingCampaign.jsonDecode(String jsonString) =>
      MailingCampaign.fromJson(json.decode(jsonString));
  factory MailingCampaign.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingCampaign obj = new MailingCampaign();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingConfig {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingConfig();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingConfig.jsonDecode(String jsonString) =>
      MailingConfig.fromJson(json.decode(jsonString));
  factory MailingConfig.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingConfig obj = new MailingConfig();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingMailAccount {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingMailAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingMailAccount.jsonDecode(String jsonString) =>
      MailingMailAccount.fromJson(json.decode(jsonString));
  factory MailingMailAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingMailAccount obj = new MailingMailAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingSentLog {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingSentLog();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingSentLog.jsonDecode(String jsonString) =>
      MailingSentLog.fromJson(json.decode(jsonString));
  factory MailingSentLog.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingSentLog obj = new MailingSentLog();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingTemplate {
  String name;
  String template;
  String textTemplate;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingTemplate();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingTemplate.jsonDecode(String jsonString) =>
      MailingTemplate.fromJson(json.decode(jsonString));
  factory MailingTemplate.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingTemplate obj = new MailingTemplate();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    template = json['template'] ?? template;
    textTemplate = json['textTemplate'] ?? textTemplate;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['template'] = template;
    obj['textTemplate'] = textTemplate;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingTransactional {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingTransactional();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingTransactional.jsonDecode(String jsonString) =>
      MailingTransactional.fromJson(json.decode(jsonString));
  factory MailingTransactional.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingTransactional obj = new MailingTransactional();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MailingUnsubscribeGroup {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MailingUnsubscribeGroup();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MailingUnsubscribeGroup.jsonDecode(String jsonString) =>
      MailingUnsubscribeGroup.fromJson(json.decode(jsonString));
  factory MailingUnsubscribeGroup.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MailingUnsubscribeGroup obj = new MailingUnsubscribeGroup();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Menu {
  String text;
  String tooltip;
  String iconClass;
  String url;
  String route;
  String attrs;
  String badgeText;
  String badgeClass;
  int order = 0;
  int systemId = 1;
  bool master = false;
  Menu menu;
  AuthPermission authPermission;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Menu();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Menu.jsonDecode(String jsonString) =>
      Menu.fromJson(json.decode(jsonString));
  factory Menu.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Menu obj = new Menu();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    text = json['text'] ?? text;
    tooltip = json['tooltip'] ?? tooltip;
    iconClass = json['iconClass'] ?? iconClass;
    url = json['url'] ?? url;
    route = json['route'] ?? route;
    attrs = json['attrs'] ?? attrs;
    badgeText = json['badgeText'] ?? badgeText;
    badgeClass = json['badgeClass'] ?? badgeClass;
    order = json['order'] ?? order;
    systemId = json['systemId'] ?? systemId;
    master = json['master'] ?? master;
    menu = Menu.fromJson(json['menu']);
    authPermission = AuthPermission.fromJson(json['authPermission']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['text'] = text;
    obj['tooltip'] = tooltip;
    obj['iconClass'] = iconClass;
    obj['url'] = url;
    obj['route'] = route;
    obj['attrs'] = attrs;
    obj['badgeText'] = badgeText;
    obj['badgeClass'] = badgeClass;
    obj['order'] = order;
    obj['systemId'] = systemId;
    obj['master'] = master;
    obj['menu'] = menu;
    obj['authPermission'] = authPermission;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Mobile {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Mobile();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Mobile.jsonDecode(String jsonString) =>
      Mobile.fromJson(json.decode(jsonString));
  factory Mobile.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Mobile obj = new Mobile();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MobileDevice {
  String pushNotificationId = "";
  String pushNotificationService = "";
  String deviceId;
  String brand;
  String model;
  String os;
  String osVersion;
  bool enableTest = false;
  bool isPhysicalDevice = true;
  List<MobileDeviceRefUsers> mobileDeviceUsers;
  List<MobileDeviceRefAccount> mobileDeviceAccount;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MobileDevice();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MobileDevice.jsonDecode(String jsonString) =>
      MobileDevice.fromJson(json.decode(jsonString));
  factory MobileDevice.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MobileDevice obj = new MobileDevice();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    pushNotificationId = json['pushNotificationId'] ?? pushNotificationId;
    pushNotificationService = json['pushNotificationService'] ?? pushNotificationService;
    deviceId = json['deviceId'] ?? deviceId;
    brand = json['brand'] ?? brand;
    model = json['model'] ?? model;
    os = json['os'] ?? os;
    osVersion = json['osVersion'] ?? osVersion;
    enableTest = json['enableTest'] ?? enableTest;
    isPhysicalDevice = json['isPhysicalDevice'] ?? isPhysicalDevice;
    mobileDeviceUsers = (json['mobileDeviceUsers'] as List)?.map((i) => MobileDeviceRefUsers.fromJson(i))?.toList();
    mobileDeviceAccount = (json['mobileDeviceAccount'] as List)?.map((i) => MobileDeviceRefAccount.fromJson(i))?.toList();
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['pushNotificationId'] = pushNotificationId;
    obj['pushNotificationService'] = pushNotificationService;
    obj['deviceId'] = deviceId;
    obj['brand'] = brand;
    obj['model'] = model;
    obj['os'] = os;
    obj['osVersion'] = osVersion;
    obj['enableTest'] = enableTest;
    obj['isPhysicalDevice'] = isPhysicalDevice;
    obj['mobileDeviceUsers'] = mobileDeviceUsers;
    obj['mobileDeviceAccount'] = mobileDeviceAccount;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MobileDeviceRefAccount {
  MobileDevice mobileDevice;
  Account account;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MobileDeviceRefAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MobileDeviceRefAccount.jsonDecode(String jsonString) =>
      MobileDeviceRefAccount.fromJson(json.decode(jsonString));
  factory MobileDeviceRefAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MobileDeviceRefAccount obj = new MobileDeviceRefAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    mobileDevice = MobileDevice.fromJson(json['mobileDevice']);
    account = Account.fromJson(json['account']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['mobileDevice'] = mobileDevice;
    obj['account'] = account;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class MobileDeviceRefUsers {
  Users users;
  MobileDevice mobileDevice;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  MobileDeviceRefUsers();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory MobileDeviceRefUsers.jsonDecode(String jsonString) =>
      MobileDeviceRefUsers.fromJson(json.decode(jsonString));
  factory MobileDeviceRefUsers.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    MobileDeviceRefUsers obj = new MobileDeviceRefUsers();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    users = Users.fromJson(json['users']);
    mobileDevice = MobileDevice.fromJson(json['mobileDevice']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['users'] = users;
    obj['mobileDevice'] = mobileDevice;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class News {
  String title;
  String body = "";
  DateTime date;
  DateTime dateToBecomeOld;
  bool pinned = false;
  bool userNews = false;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  News();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory News.jsonDecode(String jsonString) =>
      News.fromJson(json.decode(jsonString));
  factory News.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    News obj = new News();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    title = json['title'] ?? title;
    body = json['body'] ?? body;
    date = DateTime.tryParse(json['date'] ?? '') ?? date;
    dateToBecomeOld = DateTime.tryParse(json['dateToBecomeOld'] ?? '') ?? dateToBecomeOld;
    pinned = json['pinned'] ?? pinned;
    userNews = json['userNews'] ?? userNews;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['title'] = title;
    obj['body'] = body;
    obj['date'] = date.toString();
    obj['dateToBecomeOld'] = dateToBecomeOld.toString();
    obj['pinned'] = pinned;
    obj['userNews'] = userNews;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ParentUser {
  String email = "";
  String mobilePhone = "";
  String username;
  String password = "";
  int accessType = 0;
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ParentUser();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ParentUser.jsonDecode(String jsonString) =>
      ParentUser.fromJson(json.decode(jsonString));
  factory ParentUser.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ParentUser obj = new ParentUser();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    email = json['email'] ?? email;
    mobilePhone = json['mobilePhone'] ?? mobilePhone;
    username = json['username'] ?? username;
    password = json['password'] ?? password;
    accessType = json['accessType'] ?? accessType;
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['email'] = email;
    obj['mobilePhone'] = mobilePhone;
    obj['username'] = username;
    obj['password'] = password;
    obj['accessType'] = accessType;
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Partner {
  Person person;
  String name;
  String legalName = "";
  String cpfCnpj = "";
  String address;
  int number;
  String district;
  String complement;
  int zipCode;
  String postBox;
  String latitude = "0";
  String longitude = "0";
  City city;
  bool active = false;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Partner();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Partner.jsonDecode(String jsonString) =>
      Partner.fromJson(json.decode(jsonString));
  factory Partner.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Partner obj = new Partner();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    person = Person.fromJson(json['person']);
    name = json['name'] ?? name;
    legalName = json['legalName'] ?? legalName;
    cpfCnpj = json['cpfCnpj'] ?? cpfCnpj;
    address = json['address'] ?? address;
    number = json['number'] ?? number;
    district = json['district'] ?? district;
    complement = json['complement'] ?? complement;
    zipCode = json['zipCode'] ?? zipCode;
    postBox = json['postBox'] ?? postBox;
    latitude = json['latitude'] ?? latitude;
    longitude = json['longitude'] ?? longitude;
    city = City.fromJson(json['city']);
    active = json['active'] ?? active;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['person'] = person;
    obj['name'] = name;
    obj['legalName'] = legalName;
    obj['cpfCnpj'] = cpfCnpj;
    obj['address'] = address;
    obj['number'] = number;
    obj['district'] = district;
    obj['complement'] = complement;
    obj['zipCode'] = zipCode;
    obj['postBox'] = postBox;
    obj['latitude'] = latitude;
    obj['longitude'] = longitude;
    obj['city'] = city;
    obj['active'] = active;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PartnerCategory {
  String name;
  String reducedName;
  String active;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PartnerCategory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PartnerCategory.jsonDecode(String jsonString) =>
      PartnerCategory.fromJson(json.decode(jsonString));
  factory PartnerCategory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PartnerCategory obj = new PartnerCategory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    reducedName = json['reducedName'] ?? reducedName;
    active = json['active'] ?? active;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['reducedName'] = reducedName;
    obj['active'] = active;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PartnerRefCategory {
  Partner partner;
  PartnerCategory partnerCategory;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PartnerRefCategory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PartnerRefCategory.jsonDecode(String jsonString) =>
      PartnerRefCategory.fromJson(json.decode(jsonString));
  factory PartnerRefCategory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PartnerRefCategory obj = new PartnerRefCategory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    partner = Partner.fromJson(json['partner']);
    partnerCategory = PartnerCategory.fromJson(json['partnerCategory']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['partner'] = partner;
    obj['partnerCategory'] = partnerCategory;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PaymentType {
  String name = "";
  String internalPaymentType = "0";
  String active = "1";
  String order = "-1";
  String altNames = "";
  String defaultIfNotFound = "";
  List<PaymentTypeCompanyBranch> paymentTypeCompanyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PaymentType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PaymentType.jsonDecode(String jsonString) =>
      PaymentType.fromJson(json.decode(jsonString));
  factory PaymentType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PaymentType obj = new PaymentType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    internalPaymentType = json['internalPaymentType'] ?? internalPaymentType;
    active = json['active'] ?? active;
    order = json['order'] ?? order;
    altNames = json['altNames'] ?? altNames;
    defaultIfNotFound = json['defaultIfNotFound'] ?? defaultIfNotFound;
    paymentTypeCompanyBranch = json['paymentTypeCompanyBranch'] ?? paymentTypeCompanyBranch;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['internalPaymentType'] = internalPaymentType;
    obj['active'] = active;
    obj['order'] = order;
    obj['altNames'] = altNames;
    obj['defaultIfNotFound'] = defaultIfNotFound;
    obj['paymentTypeCompanyBranch'] = paymentTypeCompanyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PaymentTypeCompanyBranch {
  String paymentType;
  CompanyBranch companyBranch;
  String tax = "0";
  String active = "1";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PaymentTypeCompanyBranch();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PaymentTypeCompanyBranch.jsonDecode(String jsonString) =>
      PaymentTypeCompanyBranch.fromJson(json.decode(jsonString));
  factory PaymentTypeCompanyBranch.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PaymentTypeCompanyBranch obj = new PaymentTypeCompanyBranch();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    paymentType = json['paymentType'] ?? paymentType;
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    tax = json['tax'] ?? tax;
    active = json['active'] ?? active;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['paymentType'] = paymentType;
    obj['companyBranch'] = companyBranch;
    obj['tax'] = tax;
    obj['active'] = active;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Person {
  String personType = "F";
  String personCode = "";
  String fullName;
  String legalName;
  String ricCode = "";
  String cpfCnpj;
  String rgIeCode = "";
  String rgOrgao = "";
  DateTime rgDate;
  bool isForeign = false;
  String foreignSocialId = "";
  String foreignPassportNumber = "";
  String details = "";
  String email;
  String mobilePhone;
  String phone = "";
  bool enableNotification = true;
  Person person;
  CompanyBranch companyBranch;
  CountryState stateRgIe;
  DateTime birthDate;
  String gender = "M";
  String occupation = "";
  int maritalStatus = 0;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Person();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Person.jsonDecode(String jsonString) =>
      Person.fromJson(json.decode(jsonString));
  factory Person.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Person obj = new Person();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    personType = json['personType'] ?? personType;
    personCode = json['personCode'] ?? personCode;
    fullName = json['fullName'] ?? fullName;
    legalName = json['legalName'] ?? legalName;
    ricCode = json['ricCode'] ?? ricCode;
    cpfCnpj = json['cpfCnpj'] ?? cpfCnpj;
    rgIeCode = json['rgIeCode'] ?? rgIeCode;
    rgOrgao = json['rgOrgao'] ?? rgOrgao;
    rgDate = DateTime.tryParse(json['rgDate'] ?? '') ?? rgDate;
    isForeign = json['isForeign'] ?? isForeign;
    foreignSocialId = json['foreignSocialId'] ?? foreignSocialId;
    foreignPassportNumber = json['foreignPassportNumber'] ?? foreignPassportNumber;
    details = json['details'] ?? details;
    email = json['email'] ?? email;
    mobilePhone = json['mobilePhone'] ?? mobilePhone;
    phone = json['phone'] ?? phone;
    enableNotification = json['enableNotification'] ?? enableNotification;
    person = Person.fromJson(json['person']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    stateRgIe = CountryState.fromJson(json['stateRgIe']);
    birthDate = json['birthDate'] ?? birthDate;
    gender = json['gender'] ?? gender;
    occupation = json['occupation'] ?? occupation;
    maritalStatus = json['maritalStatus'] ?? maritalStatus;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['personType'] = personType;
    obj['personCode'] = personCode;
    obj['fullName'] = fullName;
    obj['legalName'] = legalName;
    obj['ricCode'] = ricCode;
    obj['cpfCnpj'] = cpfCnpj;
    obj['rgIeCode'] = rgIeCode;
    obj['rgOrgao'] = rgOrgao;
    obj['rgDate'] = rgDate.toString();
    obj['isForeign'] = isForeign;
    obj['foreignSocialId'] = foreignSocialId;
    obj['foreignPassportNumber'] = foreignPassportNumber;
    obj['details'] = details;
    obj['email'] = email;
    obj['mobilePhone'] = mobilePhone;
    obj['phone'] = phone;
    obj['enableNotification'] = enableNotification;
    obj['person'] = person;
    obj['companyBranch'] = companyBranch;
    obj['stateRgIe'] = stateRgIe;
    obj['birthDate'] = birthDate;
    obj['gender'] = gender;
    obj['occupation'] = occupation;
    obj['maritalStatus'] = maritalStatus;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonAccessCode {
  String turnstileCode;
  String rfidAccessoryCode;
  String barCode;
  String qrCode;
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonAccessCode();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonAccessCode.jsonDecode(String jsonString) =>
      PersonAccessCode.fromJson(json.decode(jsonString));
  factory PersonAccessCode.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonAccessCode obj = new PersonAccessCode();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    turnstileCode = json['turnstileCode'] ?? turnstileCode;
    rfidAccessoryCode = json['rfidAccessoryCode'] ?? rfidAccessoryCode;
    barCode = json['barCode'] ?? barCode;
    qrCode = json['qrCode'] ?? qrCode;
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['turnstileCode'] = turnstileCode;
    obj['rfidAccessoryCode'] = rfidAccessoryCode;
    obj['barCode'] = barCode;
    obj['qrCode'] = qrCode;
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonAddress {
  String address;
  int number;
  String district;
  String complement;
  int zipCode;
  String referenceInfo;
  String postBox;
  String latitude = "0";
  String longitude = "0";
  int proofAddressDocument = 0;
  String proofAddressDocumentCode;
  String residentialZone;
  bool isMainAddress = false;
  Person person;
  City city;
  PersonAddressType personAddressType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonAddress();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonAddress.jsonDecode(String jsonString) =>
      PersonAddress.fromJson(json.decode(jsonString));
  factory PersonAddress.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonAddress obj = new PersonAddress();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    address = json['address'] ?? address;
    number = json['number'] ?? number;
    district = json['district'] ?? district;
    complement = json['complement'] ?? complement;
    zipCode = json['zipCode'] ?? zipCode;
    referenceInfo = json['referenceInfo'] ?? referenceInfo;
    postBox = json['postBox'] ?? postBox;
    latitude = json['latitude'] ?? latitude;
    longitude = json['longitude'] ?? longitude;
    proofAddressDocument = json['proofAddressDocument'] ?? proofAddressDocument;
    proofAddressDocumentCode = json['proofAddressDocumentCode'] ?? proofAddressDocumentCode;
    residentialZone = json['residentialZone'] ?? residentialZone;
    isMainAddress = json['isMainAddress'] ?? isMainAddress;
    person = Person.fromJson(json['person']);
    city = City.fromJson(json['city']);
    personAddressType = PersonAddressType.fromJson(json['personAddressType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['address'] = address;
    obj['number'] = number;
    obj['district'] = district;
    obj['complement'] = complement;
    obj['zipCode'] = zipCode;
    obj['referenceInfo'] = referenceInfo;
    obj['postBox'] = postBox;
    obj['latitude'] = latitude;
    obj['longitude'] = longitude;
    obj['proofAddressDocument'] = proofAddressDocument;
    obj['proofAddressDocumentCode'] = proofAddressDocumentCode;
    obj['residentialZone'] = residentialZone;
    obj['isMainAddress'] = isMainAddress;
    obj['person'] = person;
    obj['city'] = city;
    obj['personAddressType'] = personAddressType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonAddressType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonAddressType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonAddressType.jsonDecode(String jsonString) =>
      PersonAddressType.fromJson(json.decode(jsonString));
  factory PersonAddressType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonAddressType obj = new PersonAddressType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonDocument {
  String file;
  String fileType;
  String mimeType;
  Person person;
  PersonDocumentType personDocumentType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonDocument();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonDocument.jsonDecode(String jsonString) =>
      PersonDocument.fromJson(json.decode(jsonString));
  factory PersonDocument.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonDocument obj = new PersonDocument();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    file = json['file'] ?? file;
    fileType = json['fileType'] ?? fileType;
    mimeType = json['mimeType'] ?? mimeType;
    person = Person.fromJson(json['person']);
    personDocumentType = PersonDocumentType.fromJson(json['personDocumentType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['file'] = file;
    obj['fileType'] = fileType;
    obj['mimeType'] = mimeType;
    obj['person'] = person;
    obj['personDocumentType'] = personDocumentType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonDocumentType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonDocumentType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonDocumentType.jsonDecode(String jsonString) =>
      PersonDocumentType.fromJson(json.decode(jsonString));
  factory PersonDocumentType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonDocumentType obj = new PersonDocumentType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonFingerprint {
  int fingerIndex;
  String template;
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonFingerprint();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonFingerprint.jsonDecode(String jsonString) =>
      PersonFingerprint.fromJson(json.decode(jsonString));
  factory PersonFingerprint.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonFingerprint obj = new PersonFingerprint();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    fingerIndex = json['fingerIndex'] ?? fingerIndex;
    template = json['template'] ?? template;
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['fingerIndex'] = fingerIndex;
    obj['template'] = template;
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonIndividual {
  DateTime birthDate;
  String gender = "M";
  String fatherName = "";
  String motherName = "";
  String birthCertificateCode = "";
  String birthCertificateBook = "";
  String birthCertificateSheetCode = "";
  String birthCertificateRegistryOffice = "";
  DateTime birthCertificateDate;
  String electionCardCode = "";
  String electionCardZone = "";
  String electionCardSection = "";
  DateTime electionCardDate;
  String occupation = "";
  int maritalStatus = 0;
  String spouseName;
  String nationality = "";
  String nationalityCountry = "";
  int raceType = 0;
  String declaredColor = "";
  bool isIndigenous = false;
  bool isFromQuilombolaCommunity = false;
  bool isWelfareReliant = false;
  String scholarshipLevel = "";
  String previousSchool = "";
  Person person;
  CountryState birthCertificateState;
  City birthCity;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonIndividual();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonIndividual.jsonDecode(String jsonString) =>
      PersonIndividual.fromJson(json.decode(jsonString));
  factory PersonIndividual.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonIndividual obj = new PersonIndividual();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    birthDate = json['birthDate'] ?? birthDate;
    gender = json['gender'] ?? gender;
    fatherName = json['fatherName'] ?? fatherName;
    motherName = json['motherName'] ?? motherName;
    birthCertificateCode = json['birthCertificateCode'] ?? birthCertificateCode;
    birthCertificateBook = json['birthCertificateBook'] ?? birthCertificateBook;
    birthCertificateSheetCode = json['birthCertificateSheetCode'] ?? birthCertificateSheetCode;
    birthCertificateRegistryOffice = json['birthCertificateRegistryOffice'] ?? birthCertificateRegistryOffice;
    birthCertificateDate = json['birthCertificateDate'] ?? birthCertificateDate;
    electionCardCode = json['electionCardCode'] ?? electionCardCode;
    electionCardZone = json['electionCardZone'] ?? electionCardZone;
    electionCardSection = json['electionCardSection'] ?? electionCardSection;
    electionCardDate = json['electionCardDate'] ?? electionCardDate;
    occupation = json['occupation'] ?? occupation;
    maritalStatus = json['maritalStatus'] ?? maritalStatus;
    spouseName = json['spouseName'] ?? spouseName;
    nationality = json['nationality'] ?? nationality;
    nationalityCountry = json['nationalityCountry'] ?? nationalityCountry;
    raceType = json['raceType'] ?? raceType;
    declaredColor = json['declaredColor'] ?? declaredColor;
    isIndigenous = json['isIndigenous'] ?? isIndigenous;
    isFromQuilombolaCommunity = json['isFromQuilombolaCommunity'] ?? isFromQuilombolaCommunity;
    isWelfareReliant = json['isWelfareReliant'] ?? isWelfareReliant;
    scholarshipLevel = json['scholarshipLevel'] ?? scholarshipLevel;
    previousSchool = json['previousSchool'] ?? previousSchool;
    person = Person.fromJson(json['person']);
    birthCertificateState = CountryState.fromJson(json['birthCertificateState']);
    birthCity = City.fromJson(json['birthCity']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['birthDate'] = birthDate;
    obj['gender'] = gender;
    obj['fatherName'] = fatherName;
    obj['motherName'] = motherName;
    obj['birthCertificateCode'] = birthCertificateCode;
    obj['birthCertificateBook'] = birthCertificateBook;
    obj['birthCertificateSheetCode'] = birthCertificateSheetCode;
    obj['birthCertificateRegistryOffice'] = birthCertificateRegistryOffice;
    obj['birthCertificateDate'] = birthCertificateDate;
    obj['electionCardCode'] = electionCardCode;
    obj['electionCardZone'] = electionCardZone;
    obj['electionCardSection'] = electionCardSection;
    obj['electionCardDate'] = electionCardDate;
    obj['occupation'] = occupation;
    obj['maritalStatus'] = maritalStatus;
    obj['spouseName'] = spouseName;
    obj['nationality'] = nationality;
    obj['nationalityCountry'] = nationalityCountry;
    obj['raceType'] = raceType;
    obj['declaredColor'] = declaredColor;
    obj['isIndigenous'] = isIndigenous;
    obj['isFromQuilombolaCommunity'] = isFromQuilombolaCommunity;
    obj['isWelfareReliant'] = isWelfareReliant;
    obj['scholarshipLevel'] = scholarshipLevel;
    obj['previousSchool'] = previousSchool;
    obj['person'] = person;
    obj['birthCertificateState'] = birthCertificateState;
    obj['birthCity'] = birthCity;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonLegal {
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonLegal();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonLegal.jsonDecode(String jsonString) =>
      PersonLegal.fromJson(json.decode(jsonString));
  factory PersonLegal.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonLegal obj = new PersonLegal();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonMail {
  String mailAccount;
  bool enableNotification = false;
  String description;
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonMail();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonMail.jsonDecode(String jsonString) =>
      PersonMail.fromJson(json.decode(jsonString));
  factory PersonMail.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonMail obj = new PersonMail();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    mailAccount = json['mailAccount'] ?? mailAccount;
    enableNotification = json['enableNotification'] ?? enableNotification;
    description = json['description'] ?? description;
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['mailAccount'] = mailAccount;
    obj['enableNotification'] = enableNotification;
    obj['description'] = description;
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonMedicalData {
  String allergy;
  String disease;
  String prescriptionDrugs;
  String disability;
  String healthPlan;
  String referenceHospital;
  int bloodType = 0;
  String remarks;
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonMedicalData();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonMedicalData.jsonDecode(String jsonString) =>
      PersonMedicalData.fromJson(json.decode(jsonString));
  factory PersonMedicalData.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonMedicalData obj = new PersonMedicalData();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    allergy = json['allergy'] ?? allergy;
    disease = json['disease'] ?? disease;
    prescriptionDrugs = json['prescriptionDrugs'] ?? prescriptionDrugs;
    disability = json['disability'] ?? disability;
    healthPlan = json['healthPlan'] ?? healthPlan;
    referenceHospital = json['referenceHospital'] ?? referenceHospital;
    bloodType = json['bloodType'] ?? bloodType;
    remarks = json['remarks'] ?? remarks;
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['allergy'] = allergy;
    obj['disease'] = disease;
    obj['prescriptionDrugs'] = prescriptionDrugs;
    obj['disability'] = disability;
    obj['healthPlan'] = healthPlan;
    obj['referenceHospital'] = referenceHospital;
    obj['bloodType'] = bloodType;
    obj['remarks'] = remarks;
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonPhone {
  String number;
  String extension;
  bool enableNotification = false;
  int type;
  String description;
  Person person;
  PersonPhoneType personPhoneType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonPhone();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonPhone.jsonDecode(String jsonString) =>
      PersonPhone.fromJson(json.decode(jsonString));
  factory PersonPhone.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonPhone obj = new PersonPhone();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    number = json['number'] ?? number;
    extension = json['extension'] ?? extension;
    enableNotification = json['enableNotification'] ?? enableNotification;
    type = json['type'] ?? type;
    description = json['description'] ?? description;
    person = Person.fromJson(json['person']);
    personPhoneType = PersonPhoneType.fromJson(json['personPhoneType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['number'] = number;
    obj['extension'] = extension;
    obj['enableNotification'] = enableNotification;
    obj['type'] = type;
    obj['description'] = description;
    obj['person'] = person;
    obj['personPhoneType'] = personPhoneType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonPhoneType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonPhoneType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonPhoneType.jsonDecode(String jsonString) =>
      PersonPhoneType.fromJson(json.decode(jsonString));
  factory PersonPhoneType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonPhoneType obj = new PersonPhoneType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonPicture {
  String picture;
  String thumbnail;
  bool hasAccessCard = false;
  Person person;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonPicture();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonPicture.jsonDecode(String jsonString) =>
      PersonPicture.fromJson(json.decode(jsonString));
  factory PersonPicture.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonPicture obj = new PersonPicture();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    picture = json['picture'] ?? picture;
    thumbnail = json['thumbnail'] ?? thumbnail;
    hasAccessCard = json['hasAccessCard'] ?? hasAccessCard;
    person = Person.fromJson(json['person']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['picture'] = picture;
    obj['thumbnail'] = thumbnail;
    obj['hasAccessCard'] = hasAccessCard;
    obj['person'] = person;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonRefPersonType {
  Person person;
  PersonType personType;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonRefPersonType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonRefPersonType.jsonDecode(String jsonString) =>
      PersonRefPersonType.fromJson(json.decode(jsonString));
  factory PersonRefPersonType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonRefPersonType obj = new PersonRefPersonType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    person = Person.fromJson(json['person']);
    personType = PersonType.fromJson(json['personType']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['person'] = person;
    obj['personType'] = personType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PersonType {
  String name;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PersonType();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PersonType.jsonDecode(String jsonString) =>
      PersonType.fromJson(json.decode(jsonString));
  factory PersonType.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PersonType obj = new PersonType();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Poll {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Poll();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Poll.jsonDecode(String jsonString) =>
      Poll.fromJson(json.decode(jsonString));
  factory Poll.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Poll obj = new Poll();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Product {
  String name = "";
  String active = "1";
  String order = "-1";
  String numericType = "0";
  String unitType = "0";
  String altNames = "";
  String defaultIfNotFound = "";
  List<ProductCompanyBranch> productCompanyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Product();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Product.jsonDecode(String jsonString) =>
      Product.fromJson(json.decode(jsonString));
  factory Product.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Product obj = new Product();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    active = json['active'] ?? active;
    order = json['order'] ?? order;
    numericType = json['numericType'] ?? numericType;
    unitType = json['unitType'] ?? unitType;
    altNames = json['altNames'] ?? altNames;
    defaultIfNotFound = json['defaultIfNotFound'] ?? defaultIfNotFound;
    productCompanyBranch = json['productCompanyBranch'] ?? productCompanyBranch;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['active'] = active;
    obj['order'] = order;
    obj['numericType'] = numericType;
    obj['unitType'] = unitType;
    obj['altNames'] = altNames;
    obj['defaultIfNotFound'] = defaultIfNotFound;
    obj['productCompanyBranch'] = productCompanyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ProductCompanyBranch {
  Product product;
  CompanyBranch companyBranch;
  String quantity = "0";
  String point = "0";
  String indicationPoint = "0";
  String indicationPercentage = "";
  String price = "0";
  String active = "1";
  String minAmount = "-1";
  String maxAmount = "-1";
  String visiblePOS = "1";
  String pointsByManual = "0";
  String pointsByIntegration = "0";
  String percentageForIndication = "0";
  String paymentTypeFee = "";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ProductCompanyBranch();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ProductCompanyBranch.jsonDecode(String jsonString) =>
      ProductCompanyBranch.fromJson(json.decode(jsonString));
  factory ProductCompanyBranch.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ProductCompanyBranch obj = new ProductCompanyBranch();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    product = Product.fromJson(json['product']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    quantity = json['quantity'] ?? quantity;
    point = json['point'] ?? point;
    indicationPoint = json['indicationPoint'] ?? indicationPoint;
    indicationPercentage = json['indicationPercentage'] ?? indicationPercentage;
    price = json['price'] ?? price;
    active = json['active'] ?? active;
    minAmount = json['minAmount'] ?? minAmount;
    maxAmount = json['maxAmount'] ?? maxAmount;
    visiblePOS = json['visiblePOS'] ?? visiblePOS;
    pointsByManual = json['pointsByManual'] ?? pointsByManual;
    pointsByIntegration = json['pointsByIntegration'] ?? pointsByIntegration;
    percentageForIndication = json['percentageForIndication'] ?? percentageForIndication;
    paymentTypeFee = json['paymentTypeFee'] ?? paymentTypeFee;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['product'] = product;
    obj['companyBranch'] = companyBranch;
    obj['quantity'] = quantity;
    obj['point'] = point;
    obj['indicationPoint'] = indicationPoint;
    obj['indicationPercentage'] = indicationPercentage;
    obj['price'] = price;
    obj['active'] = active;
    obj['minAmount'] = minAmount;
    obj['maxAmount'] = maxAmount;
    obj['visiblePOS'] = visiblePOS;
    obj['pointsByManual'] = pointsByManual;
    obj['pointsByIntegration'] = pointsByIntegration;
    obj['percentageForIndication'] = percentageForIndication;
    obj['paymentTypeFee'] = paymentTypeFee;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ProductSchedule {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ProductSchedule();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ProductSchedule.jsonDecode(String jsonString) =>
      ProductSchedule.fromJson(json.decode(jsonString));
  factory ProductSchedule.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ProductSchedule obj = new ProductSchedule();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ProductTimetable {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ProductTimetable();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ProductTimetable.jsonDecode(String jsonString) =>
      ProductTimetable.fromJson(json.decode(jsonString));
  factory ProductTimetable.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ProductTimetable obj = new ProductTimetable();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PurchaseQuote {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PurchaseQuote();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PurchaseQuote.jsonDecode(String jsonString) =>
      PurchaseQuote.fromJson(json.decode(jsonString));
  factory PurchaseQuote.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PurchaseQuote obj = new PurchaseQuote();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PushNotificationQueue {
  int status = 0;
  int tries = 0;
  String message;
  MobileDevice mobileDevice;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PushNotificationQueue();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PushNotificationQueue.jsonDecode(String jsonString) =>
      PushNotificationQueue.fromJson(json.decode(jsonString));
  factory PushNotificationQueue.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PushNotificationQueue obj = new PushNotificationQueue();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    status = json['status'] ?? status;
    tries = json['tries'] ?? tries;
    message = json['message'] ?? message;
    mobileDevice = MobileDevice.fromJson(json['mobileDevice']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['status'] = status;
    obj['tries'] = tries;
    obj['message'] = message;
    obj['mobileDevice'] = mobileDevice;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class PushNotificationSentLog {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  PushNotificationSentLog();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory PushNotificationSentLog.jsonDecode(String jsonString) =>
      PushNotificationSentLog.fromJson(json.decode(jsonString));
  factory PushNotificationSentLog.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    PushNotificationSentLog obj = new PushNotificationSentLog();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Reward {
  String name = "";
  String description = "";
  String technicalInfo = "";
  String points = "0";
  String price = "0";
  int numericType = 0;
  int unitType = 0;
  bool active = true;
  bool showApp = true;
  bool showPOS = true;
  bool showWebSite = true;
  int rewardType = 0;
  RewardCompanyBranch rewardCompanyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Reward();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Reward.jsonDecode(String jsonString) =>
      Reward.fromJson(json.decode(jsonString));
  factory Reward.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Reward obj = new Reward();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    description = json['description'] ?? description;
    technicalInfo = json['technicalInfo'] ?? technicalInfo;
    points = json['points'] ?? points;
    price = json['price'] ?? price;
    numericType = json['numericType'] ?? numericType;
    unitType = json['unitType'] ?? unitType;
    active = json['active'] ?? active;
    showApp = json['showApp'] ?? showApp;
    showPOS = json['showPOS'] ?? showPOS;
    showWebSite = json['showWebSite'] ?? showWebSite;
    rewardType = json['rewardType'] ?? rewardType;
    rewardCompanyBranch = RewardCompanyBranch.fromJson(json['rewardCompanyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['name'] = name;
    obj['description'] = description;
    obj['technicalInfo'] = technicalInfo;
    obj['points'] = points;
    obj['price'] = price;
    obj['numericType'] = numericType;
    obj['unitType'] = unitType;
    obj['active'] = active;
    obj['showApp'] = showApp;
    obj['showPOS'] = showPOS;
    obj['showWebSite'] = showWebSite;
    obj['rewardType'] = rewardType;
    obj['rewardCompanyBranch'] = rewardCompanyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class RewardCompanyBranch {
  Reward reward;
  CompanyBranch companyBranch;
  String active = "1";
  String showApp = "1";
  String showPOS = "1";
  String showWebSite = "1";
  RewardCompanyBranchInventory rewardCompanyBranchInventory;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  RewardCompanyBranch();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory RewardCompanyBranch.jsonDecode(String jsonString) =>
      RewardCompanyBranch.fromJson(json.decode(jsonString));
  factory RewardCompanyBranch.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    RewardCompanyBranch obj = new RewardCompanyBranch();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    reward = Reward.fromJson(json['reward']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    active = json['active'] ?? active;
    showApp = json['showApp'] ?? showApp;
    showPOS = json['showPOS'] ?? showPOS;
    showWebSite = json['showWebSite'] ?? showWebSite;
    rewardCompanyBranchInventory = RewardCompanyBranchInventory.fromJson(json['rewardCompanyBranchInventory']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['reward'] = reward;
    obj['companyBranch'] = companyBranch;
    obj['active'] = active;
    obj['showApp'] = showApp;
    obj['showPOS'] = showPOS;
    obj['showWebSite'] = showWebSite;
    obj['rewardCompanyBranchInventory'] = rewardCompanyBranchInventory;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class RewardCompanyBranchInventory {
  Reward reward;
  CompanyBranch companyBranch;
  TransactionRecord transactionRecord;
  String itemType = "0";
  String entryType = "0";
  String quantityBefore = "0";
  String quantityAfter = "0";
  String quantity = "0";
  String notaFiscal = "";
  String supplier = "";
  String unitPrice = "0";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  RewardCompanyBranchInventory();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory RewardCompanyBranchInventory.jsonDecode(String jsonString) =>
      RewardCompanyBranchInventory.fromJson(json.decode(jsonString));
  factory RewardCompanyBranchInventory.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    RewardCompanyBranchInventory obj = new RewardCompanyBranchInventory();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    reward = Reward.fromJson(json['reward']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    transactionRecord = TransactionRecord.fromJson(json['transactionRecord']);
    itemType = json['itemType'] ?? itemType;
    entryType = json['entryType'] ?? entryType;
    quantityBefore = json['quantityBefore'] ?? quantityBefore;
    quantityAfter = json['quantityAfter'] ?? quantityAfter;
    quantity = json['quantity'] ?? quantity;
    notaFiscal = json['notaFiscal'] ?? notaFiscal;
    supplier = json['supplier'] ?? supplier;
    unitPrice = json['unitPrice'] ?? unitPrice;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['reward'] = reward;
    obj['companyBranch'] = companyBranch;
    obj['transactionRecord'] = transactionRecord;
    obj['itemType'] = itemType;
    obj['entryType'] = entryType;
    obj['quantityBefore'] = quantityBefore;
    obj['quantityAfter'] = quantityAfter;
    obj['quantity'] = quantity;
    obj['notaFiscal'] = notaFiscal;
    obj['supplier'] = supplier;
    obj['unitPrice'] = unitPrice;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class RewardCompanyBranchInventoryPurchase {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  RewardCompanyBranchInventoryPurchase();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory RewardCompanyBranchInventoryPurchase.jsonDecode(String jsonString) =>
      RewardCompanyBranchInventoryPurchase.fromJson(json.decode(jsonString));
  factory RewardCompanyBranchInventoryPurchase.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    RewardCompanyBranchInventoryPurchase obj = new RewardCompanyBranchInventoryPurchase();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class RewardCompanyBranchInventoryTransfer {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  RewardCompanyBranchInventoryTransfer();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory RewardCompanyBranchInventoryTransfer.jsonDecode(String jsonString) =>
      RewardCompanyBranchInventoryTransfer.fromJson(json.decode(jsonString));
  factory RewardCompanyBranchInventoryTransfer.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    RewardCompanyBranchInventoryTransfer obj = new RewardCompanyBranchInventoryTransfer();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Session {
  int expire;
  String data;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Session();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Session.jsonDecode(String jsonString) =>
      Session.fromJson(json.decode(jsonString));
  factory Session.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Session obj = new Session();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    expire = json['expire'] ?? expire;
    data = json['data'] ?? data;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['expire'] = expire;
    obj['data'] = data;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ThirdPartyApiAccount {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ThirdPartyApiAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ThirdPartyApiAccount.jsonDecode(String jsonString) =>
      ThirdPartyApiAccount.fromJson(json.decode(jsonString));
  factory ThirdPartyApiAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ThirdPartyApiAccount obj = new ThirdPartyApiAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ThirdPartyApiAppstoreAccount {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ThirdPartyApiAppstoreAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ThirdPartyApiAppstoreAccount.jsonDecode(String jsonString) =>
      ThirdPartyApiAppstoreAccount.fromJson(json.decode(jsonString));
  factory ThirdPartyApiAppstoreAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ThirdPartyApiAppstoreAccount obj = new ThirdPartyApiAppstoreAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ThirdPartyApiAwsConfig {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ThirdPartyApiAwsConfig();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ThirdPartyApiAwsConfig.jsonDecode(String jsonString) =>
      ThirdPartyApiAwsConfig.fromJson(json.decode(jsonString));
  factory ThirdPartyApiAwsConfig.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ThirdPartyApiAwsConfig obj = new ThirdPartyApiAwsConfig();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ThirdPartyApiFirebaseConfig {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ThirdPartyApiFirebaseConfig();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ThirdPartyApiFirebaseConfig.jsonDecode(String jsonString) =>
      ThirdPartyApiFirebaseConfig.fromJson(json.decode(jsonString));
  factory ThirdPartyApiFirebaseConfig.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ThirdPartyApiFirebaseConfig obj = new ThirdPartyApiFirebaseConfig();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ThirdPartyApiPlaystoreAccount {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ThirdPartyApiPlaystoreAccount();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ThirdPartyApiPlaystoreAccount.jsonDecode(String jsonString) =>
      ThirdPartyApiPlaystoreAccount.fromJson(json.decode(jsonString));
  factory ThirdPartyApiPlaystoreAccount.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ThirdPartyApiPlaystoreAccount obj = new ThirdPartyApiPlaystoreAccount();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class ThirdPartyApiSendgridConfig {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  ThirdPartyApiSendgridConfig();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory ThirdPartyApiSendgridConfig.jsonDecode(String jsonString) =>
      ThirdPartyApiSendgridConfig.fromJson(json.decode(jsonString));
  factory ThirdPartyApiSendgridConfig.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    ThirdPartyApiSendgridConfig obj = new ThirdPartyApiSendgridConfig();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecord {
  String account;
  String subAccount;
  CompanyBranch companyBranch;
  String employee;
  String transaction;
  String points = "0";
  int transactionType = 0;
  String entryType = "0";
  String transactionStatus = "0";
  String notaFiscal = "";
  String purchaseUUID = "";
  DateTime localDateTime;
  String posVersion = "";
  String appVersion = "";
  String locked = "";
  String lockType = "0";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecord();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecord.jsonDecode(String jsonString) =>
      TransactionRecord.fromJson(json.decode(jsonString));
  factory TransactionRecord.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecord obj = new TransactionRecord();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    account = json['account'] ?? account;
    subAccount = json['subAccount'] ?? subAccount;
    companyBranch =  CompanyBranch.fromJson(json['companyBranch']);
    employee = json['employee'] ?? employee;
    transaction = json['transaction'] ?? transaction;
    points = json['points'] ?? points;
    transactionType = json['transactionType'] ?? transactionType;
    entryType = json['entryType'] ?? entryType;
    transactionStatus = json['transactionStatus'] ?? transactionStatus;
    notaFiscal = json['notaFiscal'] ?? notaFiscal;
    purchaseUUID = json['purchaseUUID'] ?? purchaseUUID;
    localDateTime = DateTime.tryParse(json['localDateTime'] ?? '') ?? localDateTime;
    posVersion = json['posVersion'] ?? posVersion;
    appVersion = json['appVersion'] ?? appVersion;
    locked = json['locked'] ?? locked;
    lockType = json['lockType'] ?? lockType;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['account'] = account;
    obj['subAccount'] = subAccount;
    obj['companyBranch'] = companyBranch;
    obj['employee'] = employee;
    obj['transaction'] = transaction;
    obj['points'] = points;
    obj['transactionType'] = transactionType;
    obj['entryType'] = entryType;
    obj['transactionStatus'] = transactionStatus;
    obj['notaFiscal'] = notaFiscal;
    obj['purchaseUUID'] = purchaseUUID;
    obj['localDateTime'] = localDateTime.toString();
    obj['posVersion'] = posVersion;
    obj['appVersion'] = appVersion;
    obj['locked'] = locked;
    obj['lockType'] = lockType;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordExchange {
  String transaction;
  String points = "0";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordExchange();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordExchange.jsonDecode(String jsonString) =>
      TransactionRecordExchange.fromJson(json.decode(jsonString));
  factory TransactionRecordExchange.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordExchange obj = new TransactionRecordExchange();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    points = json['points'] ?? points;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['points'] = points;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordExchangeLog {
  String transaction;
  String status = "0";
  DateTime changedAt;
  String remarks = "";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordExchangeLog();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordExchangeLog.jsonDecode(String jsonString) =>
      TransactionRecordExchangeLog.fromJson(json.decode(jsonString));
  factory TransactionRecordExchangeLog.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordExchangeLog obj = new TransactionRecordExchangeLog();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    status = json['status'] ?? status;
    changedAt = DateTime.tryParse(json['changedAt'] ?? '') ?? changedAt;
    remarks = json['remarks'] ?? remarks;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['status'] = status;
    obj['changedAt'] = changedAt.toString();
    obj['remarks'] = remarks;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordExchangeRefReward {
  String transaction;
  Reward reward;
  String unitPoints = "0";
  String quantity = "0";
  String points = "0";
  String unitPrice = "0";
  String amount = "0";
  bool refund = false;
  String tax = "0";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordExchangeRefReward();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordExchangeRefReward.jsonDecode(String jsonString) =>
      TransactionRecordExchangeRefReward.fromJson(json.decode(jsonString));
  factory TransactionRecordExchangeRefReward.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordExchangeRefReward obj = new TransactionRecordExchangeRefReward();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    reward = Reward.fromJson(json['reward']);
    unitPoints = json['unitPoints'] ?? unitPoints;
    quantity = json['quantity'] ?? quantity;
    points = json['points'] ?? points;
    unitPrice = json['unitPrice'] ?? unitPrice;
    amount = json['amount'] ?? amount;
    refund = json['refund'] ?? refund;
    tax = json['tax'] ?? tax;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['reward'] = reward;
    obj['unitPoints'] = unitPoints;
    obj['quantity'] = quantity;
    obj['points'] = points;
    obj['unitPrice'] = unitPrice;
    obj['amount'] = amount;
    obj['refund'] = refund;
    obj['tax'] = tax;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordExchangeRefRewardCostSharing {
  String transaction;
  String reward;
  String companyBranch;
  String unitPrice = "0";
  String unitPoints = "0";
  String quantity = "0";
  String points = "0";
  String amount = "0";
  String share = "0";
  String sharePoints = "0";
  String shareAmount = "0";
  String generatedAt;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordExchangeRefRewardCostSharing();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordExchangeRefRewardCostSharing.jsonDecode(String jsonString) =>
      TransactionRecordExchangeRefRewardCostSharing.fromJson(json.decode(jsonString));
  factory TransactionRecordExchangeRefRewardCostSharing.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordExchangeRefRewardCostSharing obj = new TransactionRecordExchangeRefRewardCostSharing();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    reward = json['reward'] ?? reward;
    companyBranch = json['companyBranch'] ?? companyBranch;
    unitPrice = json['unitPrice'] ?? unitPrice;
    unitPoints = json['unitPoints'] ?? unitPoints;
    quantity = json['quantity'] ?? quantity;
    points = json['points'] ?? points;
    amount = json['amount'] ?? amount;
    share = json['share'] ?? share;
    sharePoints = json['sharePoints'] ?? sharePoints;
    shareAmount = json['shareAmount'] ?? shareAmount;
    generatedAt = json['generatedAt'] ?? generatedAt;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['reward'] = reward;
    obj['companyBranch'] = companyBranch;
    obj['unitPrice'] = unitPrice;
    obj['unitPoints'] = unitPoints;
    obj['quantity'] = quantity;
    obj['points'] = points;
    obj['amount'] = amount;
    obj['share'] = share;
    obj['sharePoints'] = sharePoints;
    obj['shareAmount'] = shareAmount;
    obj['generatedAt'] = generatedAt;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordIndication {
  String transaction;
  String accountFrom;
  String transactionFrom;
  String level = "1";
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordIndication();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordIndication.jsonDecode(String jsonString) =>
      TransactionRecordIndication.fromJson(json.decode(jsonString));
  factory TransactionRecordIndication.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordIndication obj = new TransactionRecordIndication();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    accountFrom = json['accountFrom'] ?? accountFrom;
    transactionFrom = json['transactionFrom'] ?? transactionFrom;
    level = json['level'] ?? level;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['accountFrom'] = accountFrom;
    obj['transactionFrom'] = transactionFrom;
    obj['level'] = level;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordLottery {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordLottery();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordLottery.jsonDecode(String jsonString) =>
      TransactionRecordLottery.fromJson(json.decode(jsonString));
  factory TransactionRecordLottery.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordLottery obj = new TransactionRecordLottery();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordPurchase {
  String transaction;
  String accountVehicle;
  String integrationType = "0";
  String guid = "";
  String billNumber = "";
  String billUrl = "";
  String billUuid = "";
  String billXML = "";
  String billAmount = "0";
  String billPersonDocNumber = "";
  String billPersonDocName = "";
  String billCarPlate = "";
  String localDateTime;
  String internalDateTime;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordPurchase();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordPurchase.jsonDecode(String jsonString) =>
      TransactionRecordPurchase.fromJson(json.decode(jsonString));
  factory TransactionRecordPurchase.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordPurchase obj = new TransactionRecordPurchase();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    accountVehicle = json['accountVehicle'] ?? accountVehicle;
    integrationType = json['integrationType'] ?? integrationType;
    guid = json['guid'] ?? guid;
    billNumber = json['billNumber'] ?? billNumber;
    billUrl = json['billUrl'] ?? billUrl;
    billUuid = json['billUuid'] ?? billUuid;
    billXML = json['billXML'] ?? billXML;
    billAmount = json['billAmount'] ?? billAmount;
    billPersonDocNumber = json['billPersonDocNumber'] ?? billPersonDocNumber;
    billPersonDocName = json['billPersonDocName'] ?? billPersonDocName;
    billCarPlate = json['billCarPlate'] ?? billCarPlate;
    localDateTime = json['localDateTime'] ?? localDateTime;
    internalDateTime = json['internalDateTime'] ?? internalDateTime;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['accountVehicle'] = accountVehicle;
    obj['integrationType'] = integrationType;
    obj['guid'] = guid;
    obj['billNumber'] = billNumber;
    obj['billUrl'] = billUrl;
    obj['billUuid'] = billUuid;
    obj['billXML'] = billXML;
    obj['billAmount'] = billAmount;
    obj['billPersonDocNumber'] = billPersonDocNumber;
    obj['billPersonDocName'] = billPersonDocName;
    obj['billCarPlate'] = billCarPlate;
    obj['localDateTime'] = localDateTime;
    obj['internalDateTime'] = internalDateTime;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class TransactionRecordPurchaseRefPayment {
  String transaction;
  String paymentType;
  String amount = "0";
  String tax = "0";
  String id;
  TransactionRecordPurchaseRefPayment();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordPurchaseRefPayment.jsonDecode(String jsonString) =>
      TransactionRecordPurchaseRefPayment.fromJson(json.decode(jsonString));
  factory TransactionRecordPurchaseRefPayment.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordPurchaseRefPayment obj = new TransactionRecordPurchaseRefPayment();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    paymentType = json['paymentType'] ?? paymentType;
    amount = json['amount'] ?? amount;
    tax = json['tax'] ?? tax;
    id = json['id'] ?? id;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['paymentType'] = paymentType;
    obj['amount'] = amount;
    obj['tax'] = tax;
    obj['id'] = id;
    return obj;
  }
}

class TransactionRecordPurchaseRefProduct {
  String transaction;
  String product;
  String unitPrice = "0";
  String quantity = "0";
  String amount = "0";
  String unitPoints = "0";
  String quantityPoints = "0";
  String points = "0";
  String name = "";
  String id;
  TransactionRecordPurchaseRefProduct();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordPurchaseRefProduct.jsonDecode(String jsonString) =>
      TransactionRecordPurchaseRefProduct.fromJson(json.decode(jsonString));
  factory TransactionRecordPurchaseRefProduct.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordPurchaseRefProduct obj = new TransactionRecordPurchaseRefProduct();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    product = json['product'] ?? product;
    unitPrice = json['unitPrice'] ?? unitPrice;
    quantity = json['quantity'] ?? quantity;
    amount = json['amount'] ?? amount;
    unitPoints = json['unitPoints'] ?? unitPoints;
    quantityPoints = json['quantityPoints'] ?? quantityPoints;
    points = json['points'] ?? points;
    name = json['name'] ?? name;
    id = json['id'] ?? id;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['product'] = product;
    obj['unitPrice'] = unitPrice;
    obj['quantity'] = quantity;
    obj['amount'] = amount;
    obj['unitPoints'] = unitPoints;
    obj['quantityPoints'] = quantityPoints;
    obj['points'] = points;
    obj['name'] = name;
    obj['id'] = id;
    return obj;
  }
}

class TransactionRecordTransfer {
  String transaction;
  String accountFrom;
  String accountTo;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  TransactionRecordTransfer();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory TransactionRecordTransfer.jsonDecode(String jsonString) =>
      TransactionRecordTransfer.fromJson(json.decode(jsonString));
  factory TransactionRecordTransfer.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    TransactionRecordTransfer obj = new TransactionRecordTransfer();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    transaction = json['transaction'] ?? transaction;
    accountFrom = json['accountFrom'] ?? accountFrom;
    accountTo = json['accountTo'] ?? accountTo;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['transaction'] = transaction;
    obj['accountFrom'] = accountFrom;
    obj['accountTo'] = accountTo;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Users {
  String username;
  String password = "";
  List roles = [];
  String salt = "";
  String email;
  String mobilePhone = "";
  int accessType = 0;
  bool isActive = false;
  String companyBranch;
  String person;
  String name;
  String reducedName;
  List<MobileDeviceRefUsers> mobileDeviceUsers;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Users();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Users.jsonDecode(String jsonString) =>
      Users.fromJson(json.decode(jsonString));
  factory Users.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Users obj = new Users();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    username = json['username'] ?? username;
    password = json['password'] ?? password;
    roles = json['roles'] ?? roles;
    salt = json['salt'] ?? salt;
    email = json['email'] ?? email;
    mobilePhone = json['mobilePhone'] ?? mobilePhone;
    accessType = json['accessType'] ?? accessType;
    isActive = json['isActive'] ?? isActive;
    companyBranch = json['companyBranch'] ?? companyBranch;
    person = json['person'] ?? person;
    name = json['name'] ?? name;
    reducedName = json['reducedName'] ?? reducedName;
    mobileDeviceUsers = (json['mobileDeviceUsers'] as List)?.map((i) => MobileDeviceRefUsers.fromJson(i))?.toList();
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['username'] = username;
    obj['password'] = password;
    obj['roles'] = roles;
    obj['salt'] = salt;
    obj['email'] = email;
    obj['mobilePhone'] = mobilePhone;
    obj['accessType'] = accessType;
    obj['isActive'] = isActive;
    obj['companyBranch'] = companyBranch;
    obj['person'] = person;
    obj['name'] = name;
    obj['reducedName'] = reducedName;
    obj['mobileDeviceUsers'] = mobileDeviceUsers;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class UsersActivationToken {
  String token;
  DateTime expirationDatetime;
  Users users;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  UsersActivationToken();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory UsersActivationToken.jsonDecode(String jsonString) =>
      UsersActivationToken.fromJson(json.decode(jsonString));
  factory UsersActivationToken.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    UsersActivationToken obj = new UsersActivationToken();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    token = json['token'] ?? token;
    expirationDatetime = DateTime.tryParse(json['expirationDatetime'] ?? '') ?? expirationDatetime;
    users = Users.fromJson(json['users']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['token'] = token;
    obj['expirationDatetime'] = expirationDatetime.toString();
    obj['users'] = users;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class UsersAuthToken {
  String mainRole;
  DateTime expiresAt;
  String token;
  String rolesJson;
  String payload;
  String ipAddress;
  String userAgent;
  bool isValid = true;
  String users;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  UsersAuthToken();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory UsersAuthToken.jsonDecode(String jsonString) =>
      UsersAuthToken.fromJson(json.decode(jsonString));
  factory UsersAuthToken.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    UsersAuthToken obj = new UsersAuthToken();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    mainRole = json['mainRole'] ?? mainRole;
    expiresAt = DateTime.tryParse(json['expiresAt'] ?? '') ?? expiresAt;
    token = json['token'] ?? token;
    rolesJson = json['rolesJson'] ?? rolesJson;
    payload = json['payload'] ?? payload;
    ipAddress = json['ipAddress'] ?? ipAddress;
    userAgent = json['userAgent'] ?? userAgent;
    isValid = json['isValid'] ?? isValid;
    users = json['users'] ?? users;
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['mainRole'] = mainRole;
    obj['expiresAt'] = expiresAt.toString();
    obj['token'] = token;
    obj['rolesJson'] = rolesJson;
    obj['payload'] = payload;
    obj['ipAddress'] = ipAddress;
    obj['userAgent'] = userAgent;
    obj['isValid'] = isValid;
    obj['users'] = users;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class UsersRefAuthPermissionCache {
  bool byRole = false;
  Users users;
  AuthPermission authPermission;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  UsersRefAuthPermissionCache();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory UsersRefAuthPermissionCache.jsonDecode(String jsonString) =>
      UsersRefAuthPermissionCache.fromJson(json.decode(jsonString));
  factory UsersRefAuthPermissionCache.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    UsersRefAuthPermissionCache obj = new UsersRefAuthPermissionCache();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    byRole = json['byRole'] ?? byRole;
    users = Users.fromJson(json['users']);
    authPermission = AuthPermission.fromJson(json['authPermission']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['byRole'] = byRole;
    obj['users'] = users;
    obj['authPermission'] = authPermission;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class UsersRefAuthRole {
  Users users;
  AuthRole authRole;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  UsersRefAuthRole();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory UsersRefAuthRole.jsonDecode(String jsonString) =>
      UsersRefAuthRole.fromJson(json.decode(jsonString));
  factory UsersRefAuthRole.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    UsersRefAuthRole obj = new UsersRefAuthRole();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    users = Users.fromJson(json['users']);
    authRole = AuthRole.fromJson(json['authRole']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['users'] = users;
    obj['authRole'] = authRole;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class UsersRefCompanyBranch {
  Users users;
  CompanyBranch companyBranch;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  UsersRefCompanyBranch();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory UsersRefCompanyBranch.jsonDecode(String jsonString) =>
      UsersRefCompanyBranch.fromJson(json.decode(jsonString));
  factory UsersRefCompanyBranch.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    UsersRefCompanyBranch obj = new UsersRefCompanyBranch();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    users = Users.fromJson(json['users']);
    companyBranch = CompanyBranch.fromJson(json['companyBranch']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['users'] = users;
    obj['companyBranch'] = companyBranch;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class UsersRememberToken {
  String token;
  DateTime expirationDatetime;
  bool wasUsed = false;
  Users users;
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  UsersRememberToken();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory UsersRememberToken.jsonDecode(String jsonString) =>
      UsersRememberToken.fromJson(json.decode(jsonString));
  factory UsersRememberToken.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    UsersRememberToken obj = new UsersRememberToken();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    token = json['token'] ?? token;
    expirationDatetime = DateTime.tryParse(json['expirationDatetime'] ?? '') ?? expirationDatetime;
    wasUsed = json['wasUsed'] ?? wasUsed;
    users = Users.fromJson(json['users']);
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['token'] = token;
    obj['expirationDatetime'] = expirationDatetime.toString();
    obj['wasUsed'] = wasUsed;
    obj['users'] = users;
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}

class Warehouse {
  String id;
  Users createdBy;
  Users updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String statusCode = "1";
  Warehouse();
  String jsonEncode() => json.encode(this).replaceAll('''"null"''', "null");
  factory Warehouse.jsonDecode(String jsonString) =>
      Warehouse.fromJson(json.decode(jsonString));
  factory Warehouse.fromJson(Map<String, dynamic> jsonMap) {
    if(jsonMap == null) {
      return null;
    }
    Warehouse obj = new Warehouse();
    obj.fromMappedJson(jsonMap);
    return obj;
  }
  void fromMappedJson(Map<String, dynamic> json) {
    id = json['id'] ?? id;
    createdBy = Users.fromJson(json['createdBy']);
    updatedBy = Users.fromJson(json['updatedBy']);
    createdAt = DateTime.tryParse(json['createdAt'] ?? '') ?? createdAt;
    updatedAt = DateTime.tryParse(json['updatedAt'] ?? '') ?? updatedAt;
    deletedAt = DateTime.tryParse(json['deletedAt'] ?? '') ?? deletedAt;
    statusCode = json['statusCode'] ?? statusCode;
  }
  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['id'] = id;
    obj['createdBy'] = createdBy;
    obj['updatedBy'] = updatedBy;
    obj['createdAt'] = createdAt.toString();
    obj['updatedAt'] = updatedAt.toString();
    obj['deletedAt'] = deletedAt.toString();
    obj['statusCode'] = statusCode;
    return obj;
  }
}
