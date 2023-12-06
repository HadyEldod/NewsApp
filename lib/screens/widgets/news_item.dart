import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/details_news.dart';

import '../../models/NewsResponce.dart';
class NewsItem extends StatelessWidget {

  Articles article;
NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.all(8),
        elevation: 16,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent)
        ),
        child: Container(
          padding: EdgeInsets.all(8),
            color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                  child:
                  InkWell(
                    onTap: ()=>
                      Navigator.pushNamed(context,
                          DetailsNews.routeName,arguments: article),

                    child: CachedNetworkImage(
                      imageUrl:article.urlToImage??"",
                      height: 180,
                      placeholder: (context, url)
                      => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error)
                      => Icon(Icons.error),
                    ),
                  ),
              ),
              Text(article.title ??"",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 6,),
              Text(article.description ??"",
                style: TextStyle(fontSize: 16,color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 3,),
              Text(article.author ??"",
                style: TextStyle(fontSize: 12,color: Color(0xFF56D068)),
                textAlign: TextAlign.end,
              ),
              Text(article.publishedAt?.substring(0,10) ??"",
                style: TextStyle(fontSize:12,color:Color(0xFF56D068)),
                textAlign: TextAlign.end,
              ),
            ],

          ),
        ),

    );
  }
}
