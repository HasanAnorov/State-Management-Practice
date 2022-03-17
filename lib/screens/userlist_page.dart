import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_practice/model/userlist_model.dart';
import 'package:statemanagement_practice/services/network_service.dart';

import '../model/single_user.dart';

class UserListPage extends StatefulWidget {
  static const id = "UserListPage";

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  var data = "Loading ...";

  void _apiGetUsers(){
    NetworkService.GET(NetworkService.api_list,NetworkService.paramsEmpty()).then((value) =>
    {
      //print(value),
      showUserList(value!)
    });
  }

  void _apiSingleUser(int id){
    NetworkService.GET(NetworkService.api_single_user + id.toString() ,NetworkService.paramsEmpty()).then((value) =>
    {
      //print(value),
      showUserList(value!)
    });
  }

  void showUserList(String response){

    //UserList userList = NetworkService.parseUserList(response);
    //data = userList.status;

    SingleUser singleUser = NetworkService.parseSingleUser(response);
     print(singleUser.data.employee_name);
  }

  @override
  void initState() {

    // _apiGetUsers();

    _apiSingleUser(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            data
          ),
        ),
      ),
    );
  }
}
