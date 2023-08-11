import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_bloc_news_api/features/core/resources/data_state.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/get_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
    GetArticles event,
    Emitter<RemoteArticleState> state,
  ) async {
    final dataState = await _getArticleUseCase();
    if (dataState is Success && dataState.data!.isNotEmpty) {
      state(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is Failed) {
      state(RemoteArticlesError(dataState.error!));
    }
  }
}
