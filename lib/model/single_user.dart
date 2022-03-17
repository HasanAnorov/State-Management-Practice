import 'package:statemanagement_practice/model/user.dart';

class SingleUser{
  String status;
  String message;
  User data;

  SingleUser.fromJson(Map<String,dynamic> json):
        status = json["status"],
        message = json['message'],
        data = User.fromJson(json['data']);

  Map<String,dynamic> toJson() => {
    'id' : status,
    'message' : message,
    'data' : data.toJson(),
  };
}