import 'package:flutter/material.dart';
import 'package:news/models/NewsResponce.dart';
import 'package:news/models/SourcesResponce.dart';
import 'package:news/screens/widgets/news_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import 'widgets/source_item.dart';

class TabsScreen extends StatefulWidget {
  List<Sources> sources;

  TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (value) {
                selectedindex = value;
                setState(() {});
              },
              tabs: widget.sources.map((source) {
                return Tab(
                    child: SourceItem(
                        source,
                        widget.sources.indexOf(source) ==
                            selectedindex)
                    );
              }).toList()),
        ),
        FutureBuilder<NewsResponce>(
            future: ApiManager.getNewsData(
                sourceId: widget.sources[selectedindex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("wrong"),
                    TextButton(
                      onPressed: () {
                        print(snapshot.data?.message);
                      },
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
              var newsData = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(newsData[index]);
                  },
                  itemCount: newsData.length,
                ),
              );
            })
      ],
    );
  }
}
