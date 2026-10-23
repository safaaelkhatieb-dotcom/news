import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=60b9272cf04846239fa205392b9dd2a7
static Future<SourceResponse> getSources({required String categoryId})async{
   Uri url = Uri.https(EndPoints.baseUrl,
   EndPoints.sourceApi,{
         'apiKey':EndPoints.apiKey,
         'category':categoryId
       });
   try {
     var response = await http.get(url);
     String responseBody = response.body;
     var json = jsonDecode(responseBody);
     return SourceResponse.fromJson(json);
   }catch(e){
     rethrow;
   }
 }

 /*
 https://newsapi.org/v2/everything?q=bitcoin&apiKey
 =60b9272cf04846239fa205392b9dd2a7
  */
static Future<NewsResponse> getNewsBySourceID(String sourceId)async{
  Uri url = Uri.https(EndPoints.baseUrl,
      EndPoints.newsApi,{
        'apiKey':EndPoints.apiKey,
        'sources':sourceId
      });
  try {
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
  }catch(e){
    rethrow;
  }
}
}