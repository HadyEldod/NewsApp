import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponce.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;

  NewsScreen(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponce>(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text("wrong"),
              TextButton(
                onPressed: () {},
                child: Text("try again"),
              )
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text("Error!!!"),
              TextButton(
                onPressed: () {
                  print(snapshot.data?.message);
                },
                child: Text("try again"),
              )
            ],
          );
        }
        var sources = snapshot.data?.sources ?? [];
        return TabsScreen(sources); //TabsScreen(sources)
      },
    );
  }
}
