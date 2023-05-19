// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? message;
    bool? success;

    LoginModel({
        this.message,
        this.success,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
    };
}
