import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/pages/saved_article/saved_article.dart';

/// Contains the routes of the app navigation
class NavRoutes {
  /// Main route of the app
  static String get main => DailyNews.route;

  /// Get arguments
  static dynamic _args(BuildContext c) {
    return ModalRoute.of(c)!.settings.arguments;
  }

  /// App routes
  static Map<String, Widget Function(BuildContext)> get all {
    return {
      main: (_) => const DailyNews(),
      ArticleDetails.route: (c) =>  ArticleDetails(article: _args(c)),
      SavedArticles.route: (_) => const SavedArticles()
    };
  }
}
