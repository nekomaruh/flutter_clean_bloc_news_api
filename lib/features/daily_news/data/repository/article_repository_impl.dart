import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_bloc_news_api/features/core/constants/constants.dart';
import 'package:flutter_clean_bloc_news_api/features/core/resources/data_state.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/model/article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Success(httpResponse.data);
      } else {
        return Failed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            //type: DioExceptionType.connectionError,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return Failed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
