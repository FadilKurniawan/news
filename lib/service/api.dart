import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:news/model/ModelImport.dart';
import 'package:news/style/string.dart';

class Api{
  
  Future<List<NewsSource>> getNewsSource()async{
    var response = await http.get(Constant.BASE_URL+"sources?apiKey="+Constant.API_KEY);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<NewsSource> newssource = NewsSourceApi.fromJson(data).sources;
      return newssource;
    } else {
      throw Exception();
    }
  }
    Future<List<Articles>> getArticles(String domain)async{
    var response = await http.get(Constant.BASE_URL+"everything?sources="+domain+"&apiKey="+Constant.API_KEY);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> newssource = ArticlesApi.fromJson(data).articles;
      return newssource;
    } else {
      throw Exception();
    }
  }
      Future<List<Articles>> getArticlesSearch(String domain, String title)async{
    var response = await http.get(Constant.BASE_URL+"everything?sources="+domain+"&qInTitle= "+ title +"&apiKey="+Constant.API_KEY);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> newssource = ArticlesApi.fromJson(data).articles;
      return newssource;
    } else {
      throw Exception();
    }
  }


}