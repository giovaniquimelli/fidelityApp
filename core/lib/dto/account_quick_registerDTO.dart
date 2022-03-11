import 'dart:convert';

class AccountQuickRegistrationDTO {
  String accountId;
  String personType;
  String account;
  String username;
  String fullName;
  String legalName;
  String password;
  String email;
  String mobilePhone;

  AccountQuickRegistrationDTO();

  String jsonEncode() => json.encode(this);
  factory AccountQuickRegistrationDTO.jsonDecode(String jsonString) =>
      AccountQuickRegistrationDTO.fromJson(json.decode(jsonString));

  factory AccountQuickRegistrationDTO.fromJson(Map<String, dynamic> jsonMap) {
    if (jsonMap == null) {
      return null;
    }

    AccountQuickRegistrationDTO obj = new AccountQuickRegistrationDTO();
    obj.fromMappedJson(jsonMap);
    return obj;
  }

  void fromMappedJson(Map<String, dynamic> json) {
    accountId = json['accountId'] ?? accountId;
    personType = json['personType'] ?? personType;
    account = json['account'] ?? account;
    username = json['username'] ?? username;
    fullName = json['fullName'] ?? fullName;
    legalName = json['legalName'] ?? legalName;
    password = json['password'] ?? password;
    email = json['email'] ?? email;
    mobilePhone = json['mobilePhone'] ?? mobilePhone;
  }

  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['accountId'] = accountId;
    obj['personType'] = personType;
    obj['account'] = account;
    obj['username'] = username;
    obj['fullName'] = fullName;
    obj['legalName'] = legalName;
    obj['password'] = password;
    obj['email'] = email;
    obj['mobilePhone'] = mobilePhone;
    return obj;
  }
}
