import 'package:flutter/material.dart';
import 'package:news/models/NewsResponce.dart';
import 'package:news/models/SourcesResponce.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/screens/widgets/news_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: ()=>showResults(context),
        icon: Icon(Icons.search)
    )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: ()=> Navigator.of(context).pop()
        , icon: Icon(Icons.clear_outlined));

  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponce>(
        future: ApiManager.getNewsData(searchKey: query),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text("wrong"),
                TextButton(onPressed: (){
                  print(snapshot.data?.message);
                },child: Text("try again"),)
              ],
            );
          }
          if(snapshot.data?.status !="ok") {
            return Column(
              children: [
                Text("Error!!!"),
                TextButton(onPressed: (){
                  print(snapshot.data?.message);
                },child: Text("try again"),)
              ],
            );
          }
          var newsData=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return NewsItem( newsData[index]);
            },itemCount: newsData.length,),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) {
      return Center(child: Text("Write your Search",
        style: TextStyle(color: Colors.white,fontSize: 16),));
    }else{
    return FutureBuilder<NewsResponce>(
        future: ApiManager.getNewsData(searchKey: query),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text("wrong"),
                TextButton(onPressed: (){
                  print(snapshot.data?.message);
                },child: Text("try again"),)
              ],
            );
          }
          if(snapshot.data?.status !="ok") {
            return Column(
              children: [
                Text("Error!!!"),
                TextButton(onPressed: (){
                  print(snapshot.data?.message);
                },child: Text("try again"),)
              ],
            );
          }
          var newsData=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return NewsItem( newsData[index]);
            },itemCount: newsData.length,),
          );
        }
    );
    }
    }

}