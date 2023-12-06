import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponce.dart';
import 'package:news/models/SourcesResponce.dart';
import 'package:news/shared/components/constants.dart';
class ApiManager{
static Future<SourcesResponce> getSources(String cat)async{
  Uri URL=Uri.https(BASE_URL,"/v2/top-headlines/sources",
      {"apiKey":ApiKey,"category":cat });
 http.Response response = await http.get(URL);
 var jsonResponse= jsonDecode(response.body);
 SourcesResponce sourcesResponce= SourcesResponce.fromJson(jsonResponse);
 return sourcesResponce;
}
static Future<NewsResponce>  getNewsData(
      {String? sourceId, String? searchKey})async{
  Uri URL=Uri.https(BASE_URL,"/v2/everything",
      {"apiKey":ApiKey,"sources":sourceId,"q":searchKey},);
  http.Response response = await http.get(URL);
  var json= jsonDecode(response.body);
  NewsResponce newsResponce=NewsResponce.fromJson(json);
  return newsResponce;
}

}