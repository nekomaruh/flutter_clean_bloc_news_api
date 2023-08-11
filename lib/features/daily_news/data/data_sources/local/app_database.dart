import 'package:floor/floor.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/data_sources/local/dao/article_dao.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/model/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
