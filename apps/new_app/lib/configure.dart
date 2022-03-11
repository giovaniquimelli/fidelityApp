import 'package:core/core.dart';
import 'package:flutter/material.dart';

void configure() {
  Global.appConfig = AppConfig(
    pushNotificationKey: "key",
    pushNotificationService: "OneSignal",
    company: "New App",
    version: "1.0.0",
    apiAddress: "https://localhost:8000",
    // apiAddress: "http://example.example.com.br",
    clientAddress: "",
    authAddress: "https://localhost:8000/api/mobile/account/auth/",
    // authAddress: "http://example.example.com.br/api/mobile/account/auth/",
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey[400],
    receiptsPaginationLength: 7,
    transactionsPaginationLength: 10
  );
  Global.service = Service();
}
