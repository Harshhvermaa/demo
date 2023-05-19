import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:demo_video/model/login_model.dart';
import 'package:demo_video/webservices/response_model.dart';

import 'api_exception.dart';

class LoginServices {

  
  Future<LoginModel> loginUser(String mobile) async {
    EasyLoading.show(status: 'loading...');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var uri = Uri.parse("http://15.207.91.30:3000/generate/otp");
    print(uri.toString());
    var body = {"mobile": mobile};

    try {
      var response = await http
          .post(uri, headers: headers, body: json.encode(body))
          .timeout(Duration(seconds: 20));
      print(response.statusCode);
      print(response.body);
      var dataModel = LoginModel.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return dataModel;
      } else {
        EasyLoading.dismiss();

        return dataModel;
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not respond in time', uri.toString());
    }
  }

  Future<LoginModel> verifyOtp(int mobile, int otp) async {
    EasyLoading.show(status: 'loading...');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var uri = Uri.parse("http://15.207.91.30:3000 /verify/otp");
    print(uri.toString());
    var body = {"mobile": mobile, "otp": otp};

    try {
      var response = await http
          .post(uri, headers: headers, body: json.encode(body))
          .timeout(Duration(seconds: 20));
      print(response.statusCode);
      print(response.body);
      var dataModel = LoginModel.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return dataModel;
      } else {
        EasyLoading.dismiss();

        return dataModel;
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not respond in time', uri.toString());
    }
  }
}
