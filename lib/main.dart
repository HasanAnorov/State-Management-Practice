import 'package:flutter/material.dart';
import 'package:statemanagement_practice/screens/detail_page.dart';
import 'package:statemanagement_practice/screens/home_page.dart';
import 'package:statemanagement_practice/screens/patterns_page.dart';
import 'package:statemanagement_practice/screens/userlist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PatternPage(),
      routes: {
        HomePage.id:(context) => HomePage(),
        DetailPage.id:(context) => DetailPage(input: 'Hasan',),
        UserListPage.id:(context) => UserListPage(),
        PatternPage.id:(context) => PatternPage()
      },
    );
  }
}