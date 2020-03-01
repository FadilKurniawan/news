import 'package:news/model/Articles.dart';
import 'package:news/model/ModelImport.dart';
import 'BlocImport.dart';

abstract class NewsState extends Equatable {
  NewsState([List props = const []]);
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => null;
}

class NewsLoaded extends NewsState {
  final List<NewsSource> news;

  NewsLoaded(this.news) : super([news]);

  @override
  List<Object> get props => null;
}

class ArticlesLoading extends NewsState {
  @override
  List<Object> get props => null;
}

class ArticlesLoaded extends NewsState {
  final List<Articles> articles;

  ArticlesLoaded(this.articles) : super([articles]);

  @override
  List<Object> get props => null;
}