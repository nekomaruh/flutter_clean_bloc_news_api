import 'package:flutter_clean_bloc_news_api/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/get_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/get_saved_articles.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/remove_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/save_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Room
  sl.registerSingleton<AppDatabase>(
      await $FloorAppDatabase.databaseBuilder('app_db.db').build());

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Api Service
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(), sl(), sl()),
  );
}
