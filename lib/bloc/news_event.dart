import 'package:meta/meta.dart';
import 'BlocImport.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent([List props = const []]):super();
}

class LoadNewsSource extends NewsEvent{
  @override
  List<Object> get props => null;
}

class LoadNewsArticles extends NewsEvent{
  final String domain;
  final String title;
  const LoadNewsArticles({
    @required this.domain,
    this.title
  });

  @override
  List<Object> get props => [domain,title];
}