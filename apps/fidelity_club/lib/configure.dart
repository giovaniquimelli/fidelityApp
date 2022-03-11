import 'package:core/core.dart';
import 'package:flutter/material.dart';

void configure() {
  Global.appConfig = AppConfig(
    pushNotificationKey: "key",
    pushNotificationService: "OneSignal",
    company: "Loyalty Card",
    version: "1.0.0",
    apiAddress: "https://localhost:8000",
    // apiAddress: "http://apicontorno.fidelitycard.com.br",
    clientAddress: "",
    authAddress: "https://localhost:8000/api/mobile/account/auth/",
    // authAddress: "http://apicontorno.fidelitycard.com.br/api/mobile/account/auth/",
    primarySwatch: Colors.red,
    primaryColor: Colors.redAccent[400],
    receiptsPaginationLength: 7,
    transactionsPaginationLength: 10
  );
  Global.service = Service();
}
