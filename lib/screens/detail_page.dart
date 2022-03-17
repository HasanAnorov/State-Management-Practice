import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const id = "detail_page";

  final String input ;
  const DetailPage({required this.input});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: (){

            Navigator.of(context).pop({'data':"The best"});

          },
          color: Colors.red,
          child: Text("Detail Page"),
        ),
      ),
    );
  }
}
