import 'package:equatable/equatable.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticlesState({this.articles});

  @override
  List<Object?> get props => [articles];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<ArticleEntity>? articles)
      : super(articles: articles);
}
