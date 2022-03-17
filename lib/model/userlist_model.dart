
import 'package:statemanagement_practice/model/user.dart';

class UserList{
  String status;
  String message;
  List<User> data;

  UserList.fromJson(Map<String,dynamic> json):
  status = json["status"],
  message = json['message'],
  data = List<User>.from(json['data'].map((x) => User.fromJson(x)));


  Map<String,dynamic> toJson() => {
    'id' : status,
    'message' : message,
    'data' : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}