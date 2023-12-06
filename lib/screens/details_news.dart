import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/models/NewsResponce.dart';
import 'package:news/models/category_model.dart';
class DetailsNews extends StatelessWidget {
static const String routeName="DetailsScreen";
  @override
  Widget build(BuildContext context) {
    var article =ModalRoute.of(context)!.settings.arguments as Articles;
    return  Scaffold(
 appBar: AppBar(
   backgroundColor: Colors.black87,
   title: Text("Back..",style: TextStyle(color: Colors.white),),
   leading: GestureDetector(
     child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
     onTap: () {
       Navigator.pop(context);
     } ,
   ) ,
 ),
      body: Container(

        child: SingleChildScrollView(
          child: Card(
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
                    child: CachedNetworkImage(
                        imageUrl:article.urlToImage??"",
                        height: 250,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),

                  Text(article.title ??"",
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color:Color(
                        0xFFFFFFFF)),
                  ),
                  SizedBox(height: 10,),
                  Text(article.description ??"",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(
                        0xFFFFFFFF)),
                  ),
                  SizedBox(height: 6,),
                  Text(article.author ??"",
                    style: TextStyle(fontSize: 18,color: Color(0xFF56D068)),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: 6,),
                  Text(article.publishedAt?.substring(0,10) ??"",
                    style: TextStyle(fontSize:16,color: Color(0xFF56D068)),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
