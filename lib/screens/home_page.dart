import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_practice/services/network_service.dart';

import '../model/post_model.dart';


class HomePage extends StatefulWidget {
  static const id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String text_data = "Hello Flutter";

  void _apiPostList(){
    NetworkService.GET(NetworkService.api_list, NetworkService.paramsEmpty()).then((response) => {
      print("response ***** $response"),
      postResult(response!)
    });
  }

  void _apiCreatePost(Post post){
    NetworkService.POST(NetworkService.api_create, NetworkService.paramsCreate(post)).then((response) => {
      print("response ***** $response"),
      postResult(response!)
    });
  }

  void _apiUpdatePost(Post post){
    NetworkService.PUT(NetworkService.api_put+post.id.toString(), NetworkService.paramsUpdate(post)).then((response) => {
      print("response ***** $response"),
      postResult(response!)
    });
  }

  void _apiDeletePost(Post post){
    NetworkService.PUT(NetworkService.api_delete+post.id.toString(), NetworkService.paramsEmpty()).then((response) => {
      print("response ***** $response"),
      postResult(response!)
    });
  }

  // Future _openDetails() async{
  //   Map results = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (BuildContext context){
  //         return const DetailPage(input:"Hello Flutter");
  //       }
  //   ));
  //
  //   if(results==null){
  //     print('Nothing');
  //   }else{
  //     setState(() {
  //       text_data = results['data'];
  //     });
  //   }
  // }

  void postResult(String response){
    setState(() {
      text_data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello Flutter"),
      //   centerTitle: true,
      //   actions: [
      //     Icon(Icons.notifications),
      //     SizedBox(width: 16,)
      //   ],
      // ),
      body: SafeArea(
        child: Center(
          child: Text(text_data),
        ),
      ),
      // body: Center(
      //   // child: FlatButton(
      //   //     onPressed: (){
      //   //       // Navigator.pushNamed(context, DetailPage.id);
      //   //       //Navigator.pushReplacementNamed(context, DetailPage.id);
      //   //       _openDetails();
      //   //     },
      //   //     child: Text(text_data,),
      //   //     color: Colors.blueAccent,
      //   // ),
      //   // child: Image.network('image_url',width: 200,),
      //
      //   //there are 3 types of button in flutter 1.FlatButton 2.OutlinedButton 3.RaisedButton
      //
      //   child: RaisedButton(
      //     onPressed: (){
      //
      //     },
      //     textColor: Colors.red,
      //     child: Text("Press Me"),
      //     color: Colors.blueAccent,
      //   ),
      // ),
    );
  }

  @override
  void initState() {

    //GET METHOD
    // _apiPostList();


    //POST METHOD
    // var post = Post(id: 1, title: "pdp", body: 'online', userId: 1);
    // _apiCreatePost(post);


    //PUT METHOD
    // var post = Post(id: 1, title: "Hasan", body: 'Anorov', userId: 1);
    // _apiUpdatePost(post);

    //DELETE METHOD
    var post = Post(id: 1, title: "Hasan", body: 'Anorov', userId: 1);
    _apiDeletePost(post);


    super.initState();
  }

}