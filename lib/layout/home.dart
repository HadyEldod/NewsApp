import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponce.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/search_.dart';
import 'package:news/screens/categories.dart';
import 'package:news/screens/news_screen.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/screens/widgets/caregory_item.dart';
import 'package:news/screens/widgets/drawer_widget.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeScreen extends StatefulWidget {
static const String routeName="Home";
@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: DrawerWidget(onDrawerClicked,),
appBar: AppBar(

    actions: [IconButton(
      onPressed: ()=>
          showSearch(context: context, delegate: Search())

      ,
      icon: Icon(Icons.search),
    )],
  iconTheme: IconThemeData(color: Colors.white),
  backgroundColor: Color(0xFF1C1A1A),
  centerTitle: true,
  shape: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(35),bottomLeft: Radius.circular(35))
  ),
  title: Text(categoryModel==null?"News App":categoryModel!.name,
    style: TextStyle(color: Colors.white),),

),
      body: categoryModel==null?
      CategoriesScreen(onCategorySelected):NewsScreen(categoryModel!),
    );
  }
  CategoryModel? categoryModel=null;
  void onDrawerClicked(number){
    if(number==DrawerWidget.CATEGORY){
categoryModel=null;
    }
    setState(() {
      Navigator.pop(context);
    });
  }
  void onCategorySelected(category){
categoryModel=category;
setState(() {

});
}
}
