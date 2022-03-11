import 'package:flutter/material.dart';

class AppConfig {
  String pushNotificationKey;
  String pushNotificationService;

  String company;
  String version;
  String apiAddress;
  String clientAddress;
  String authAddress;

  Color primarySwatch;
  Color primaryColor;

  int receiptsPaginationLength;
  int transactionsPaginationLength;

  AppConfig({
    @required this.pushNotificationKey,
    @required this.pushNotificationService,
    @required this.company,
    @required this.version,
    @required this.apiAddress,
    @required this.clientAddress,
    @required this.authAddress,
    @required this.primarySwatch,
    @required this.primaryColor,
    @required this.receiptsPaginationLength,
    @required this.transactionsPaginationLength,
  });
}
