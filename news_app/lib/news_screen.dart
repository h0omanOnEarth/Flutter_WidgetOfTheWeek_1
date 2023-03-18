import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/detail_news_screen.dart';
import 'package:news_app/model/Article.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = '/news_list';
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString('assets/news.json'),
          builder: (context, snapshot) {
            final List<Article> articles = parseArticles(snapshot.data);
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return buildItem(context, articles[index]);
              },
            );
          }),
    );
  }
}

Widget buildItem(BuildContext context, Article article) {
  return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(article.urlToImage, width: 100),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, DetailNewsScreen.routeName,
            arguments: article);
      });
}
