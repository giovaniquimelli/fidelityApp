import 'dart:convert';

class AccountAuthenticationDTO {
  String accountId;
  String username;
  String fullName;
  String legalName;
  String password;
  String token;

  AccountAuthenticationDTO();

  String jsonEncode() => json.encode(this);
  factory AccountAuthenticationDTO.jsonDecode(String jsonString) =>
      AccountAuthenticationDTO.fromJson(json.decode(jsonString));

  factory AccountAuthenticationDTO.fromJson(Map<String, dynamic> jsonMap) {
    if (jsonMap == null) {
      return null;
    }

    AccountAuthenticationDTO obj = new AccountAuthenticationDTO();
    obj.fromMappedJson(jsonMap);
    return obj;
  }

  void fromMappedJson(Map<String, dynamic> json) {
    accountId = json['accountId'] ?? accountId;
    username = json['username'] ?? username;
    fullName = json['fullName'] ?? fullName;
    legalName = json['legalName'] ?? legalName;
    password = json['password'] ?? password;
    token = json['token'] ?? token;
  }

  Map<String, dynamic> toJson() {
    var obj = new Map<String, dynamic>();
    obj['accountId'] = accountId;
    obj['username'] = username;
    obj['fullName'] = fullName;
    obj['legalName'] = legalName;
    obj['password'] = password;
    obj['token'] = token;
    return obj;
  }
}
