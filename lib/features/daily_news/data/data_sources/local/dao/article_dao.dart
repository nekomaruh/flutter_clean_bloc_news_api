import 'package:floor/floor.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/model/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * from article')
  Future<List<ArticleModel>> getArticles();
}
