import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_bloc_news_api/di.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:flutter_clean_bloc_news_api/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_) => sl()..add(const GetArticles()),
      child: const Scaffold(
        appBar: _BuildAppbar(),
        body: _BuildNewsList(),
      ),
    );
  }
}

class _BuildAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _BuildAppbar();

  final style = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Daily News', style: style),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, SavedArticles.route);
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

class _BuildNewsList extends StatelessWidget {
  const _BuildNewsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is RemoteArticlesError) {
        return const Center(child: Text('Error'));
      } else if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemBuilder: (_, i) => ArticleWidget(
            article: state.articles?[i],
            onTap: () => _onArticlePressed(context, state.articles?[i]),
          ),
          itemCount: state.articles?.length,
        );
      } else {
        return const SizedBox();
      }
    });
  }

  void _onArticlePressed(BuildContext context, dynamic article) {
    Navigator.pushNamed(context, ArticleDetails.route, arguments: article);
  }
}
