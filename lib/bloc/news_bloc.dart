import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/ModelImport.dart';
import 'package:news/service/api.dart';
import 'BlocImport.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  
  Api api = Api();
  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async*{
    if(event is LoadNewsSource){
      yield NewsLoading();
      yield* loadNewsSource();
    }else if(event is LoadNewsArticles){
      yield ArticlesLoading();
      if(event?.title?.isEmpty??true){
        yield* loadArticles(event.domain);
      }else{
        yield* loadArticlesSearch(event.domain,event.title);
      }
    }
  }
      
  Stream<NewsState>loadNewsSource() async*{
    List<NewsSource> newsSource = await api.getNewsSource();
    yield NewsLoaded(newsSource);
  }

  Stream<NewsState>loadArticles(String domain) async*{
    List<Articles> newsSource = await api.getArticles(domain);
    yield ArticlesLoaded(newsSource);
  }
  Stream<NewsState>loadArticlesSearch(String domain,String title) async*{
    List<Articles> newsSource = await api.getArticlesSearch(domain,title);
    yield ArticlesLoaded(newsSource);
  }
}
