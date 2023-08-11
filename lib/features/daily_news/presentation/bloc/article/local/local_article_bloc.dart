import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/get_saved_articles.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/remove_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/usecase/save_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticlesUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  Future<void> onGetSavedArticles(
    GetSavedArticles event,
    Emitter<LocalArticlesState> state,
  ) async {
    final articles = await _getSavedArticlesUseCase();
    state(LocalArticlesDone(articles));
  }

  Future<void> onRemoveArticle(
    RemoveArticle event,
    Emitter<LocalArticlesState> state,
  ) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    state(LocalArticlesDone(articles));
  }

  Future<void> onSaveArticle(
    SaveArticle event,
    Emitter<LocalArticlesState> state,
  ) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    state(LocalArticlesDone(articles));
  }
}
