import 'package:flutter_clean_bloc_news_api/features/core/resources/data_state.dart';
import 'package:flutter_clean_bloc_news_api/features/core/usecase/usecase.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase extends UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
