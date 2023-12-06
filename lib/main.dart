import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/details_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xff2a2929)),
      home: AppBar(
        title: Text("sadasd"),
      ),
      initialRoute: HomeScreen.routeName,
      routes:{
       HomeScreen.routeName:(context)=>HomeScreen(),
        DetailsNews.routeName:(context)=>DetailsNews(),
      },

    );
  }
}
