import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import '../entities/entities.dart';
import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';

// import '../global.dart';
import 'package:device_info/device_info.dart';

class Gateway {
  Map<String, dynamic> jsonRequest = {};

  void add(String propertyName, String gatewayRoute, dynamic jsonData) {
    jsonRequest[propertyName] = {};
    jsonRequest[propertyName]['route'] = gatewayRoute;
    jsonRequest[propertyName]['data'] = jsonData;
  }

  Future<GatewayPayload> request(Function logout, bool continueOnError) async {
    http.Response response;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    String clientAddress;
    clientAddress = Global.appConfig.clientAddress;
    
  // print('/////////////////////////');
  // print(json.encode(jsonRequest));
  // print('/////////////////////////');
    try {
      response = await http.post(
        Global.appConfig.apiAddress + clientAddress + "/api/mobile/account/gateway",
        body: json.encode(jsonRequest),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token
        },
      );
    } catch (e) {
      print(e);
    }
    return generateGatewayPayLoad(
        json.decode(response.body), logout, continueOnError);
  }

  Future<GatewayPayload> requestOne(String propertyName, String gatewayRoute,
      Map<String, dynamic> jsonData, Function logout, bool continueOnError) {
    add(propertyName, gatewayRoute, jsonData);

    return request(logout, continueOnError);
  }

  Future<MobileDevice> getAndroidMobileInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    MobileDevice mobileInfo = MobileDevice();
    mobileInfo.deviceId = androidInfo.androidId;
    mobileInfo.brand = androidInfo.brand;
    mobileInfo.model = androidInfo.model;
    mobileInfo.os = 'Android';
    mobileInfo.osVersion = androidInfo.version.release;
    mobileInfo.enableTest = false;
    mobileInfo.isPhysicalDevice = androidInfo.isPhysicalDevice;

    return mobileInfo;
  }

  Future<MobileDevice> getIOSMobileInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    MobileDevice mobileInfo = MobileDevice();
    mobileInfo.deviceId = iosInfo.identifierForVendor;
    mobileInfo.brand = 'Apple';
    mobileInfo.model = iosInfo.model;
    mobileInfo.os = 'iOS';
    mobileInfo.osVersion = iosInfo.systemVersion;
    mobileInfo.enableTest = false;
    mobileInfo.isPhysicalDevice = iosInfo.isPhysicalDevice;

    return mobileInfo;
  }

  Future<http.Response> authenticate(authData) async {
    MobileDevice mobileInfo = MobileDevice();
    if (Platform.isAndroid) {
      mobileInfo = await getAndroidMobileInfo();
      // save mobileDeviceId to device
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('mobileDeviceId', mobileInfo.deviceId);
    } else if (Platform.isIOS) {
      mobileInfo = await getIOSMobileInfo();
      // save mobileDeviceId to device
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('mobileDeviceId', mobileInfo.deviceId);
    }

    String loginRoute;
    
    loginRoute = Global.appConfig.authAddress + "login";
    
    http.Response response;
    response = await http.post(
      loginRoute,
      body: authData.jsonEncode(),
      headers: {
        'Content-Type': 'application/json',
        'Mobile-Info': mobileInfo.jsonEncode(),
      },
    );

    return response;
  }

  Future<http.Response> register(registerData) async {
    String loginRoute;

    loginRoute = Global.appConfig.authAddress + "create";
    print(registerData.jsonEncode());
    http.Response response;
    response = await http.post(
      loginRoute,
      body: registerData.jsonEncode(),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return response;
  }

  GatewayPayload generateGatewayPayLoad(
      Map<String, dynamic> response, Function logout, bool continueOnError) {
    GatewayPayload payload = GatewayPayload();
    // Map<String, dynamic> data = {};

    try {
      payload.success = response['success'];
      payload.statusCode = response['statusCode'];
      payload.message = response['Message'];
      payload.title = response['title'];
      payload.details = response['details'];

      if (response['statusCode'] != 200 && response['statusCode'] != 201) {
        payload.success = false;
        payload.error['payloadError'] = response['statusCode'];
        // if (response['statusCode'] == 401) {
        //   logout();
        // }
        return payload;
      }

      for (var entry in response['data'].entries) {
        if (entry.value['statusCode'] != 200 &&
            entry.value['statusCode'] != 201) {
          // if (entry.value['statusCode'] == 401) {
          //   logout();
          // }
          payload.success = false;
          payload.statusCode = entry.value['statusCode'];
          payload.message = entry.value['message'];
          payload.title = entry.value['title'];
          payload.details = entry.value['details'];
          payload.error[entry.key] = entry.value['statusCode'];

          if (!continueOnError) {
            return payload;
          }
        }

        payload.data[entry.key] = entry.value;
      }
    } catch (e) {
      print(e);
      payload.success = false;
      payload.statusCode = 0;
      payload.message = "Gateway Payload caught an error";
      payload.title = "Gateway Error";
      payload.details = "Call Support";
      payload.error["Gateway"] = "0";
    }
    return payload;
  }
}

class GatewayPayload {
  bool success;
  int statusCode;
  String message;
  String title;
  String details;
  Map<String, dynamic> data = {};
  Map<String, dynamic> error = {};

  // GatewayPayload() {
  //   data = new Map<String, dynamic>();
  // }

  // List<String> errorProperty;
  // bool hasErrors() {
  //   return errorProperty.length > 0;
  // }
}
