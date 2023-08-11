import 'package:flutter_clean_bloc_news_api/features/core/usecase/usecase.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/data/model/article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(ArticleModel.fromEntity(params!));
  }
}
