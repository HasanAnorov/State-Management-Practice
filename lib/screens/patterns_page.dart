import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../model/post_model.dart';
import '../services/network_service.dart';

class PatternPage extends StatefulWidget {
  static const id = "patterns_page";

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {

  bool isLoading = false;
  var items =  <Post>[];

  void  onDelete(){}
  void onEdit(){}

  void _apiPostList() async{
    setState(() {
      isLoading = true;
    });
    var response = await NetworkService.GET(NetworkService.api_list, NetworkService.paramsEmpty());
    if(response !=null){
      items = NetworkService.parsePostList(response);
    }else{
      items = List<Post>.empty();
    }
    isLoading = false;
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

  @override
  void initState() {
    _apiPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (ctx,index){
            return itemOfPost(items[index]);
            },
            itemCount: items.length,
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator(),
          ) :SizedBox.shrink()
        ],
      ),
    );
  }

  Widget itemOfPost(Post post){
    return Slidable(
      startActionPane: ActionPane(
        motion:  ScrollMotion(),

        // dismissible: DismissiblePane(onDismissed: (){
        //
        // },),

        children: [
          SlidableAction(
            onPressed: (context) => onDelete(),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),

        ],
      ),
      endActionPane:  ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed:(context) => onEdit(),
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toUpperCase(),
              style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5,),
            Text(post.body)
          ],
        ),
      ),
    );
  }
}
