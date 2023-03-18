import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/model/Article.dart';
import 'package:news_app/more_news.dart';

class DetailNewsScreen extends StatelessWidget {
  static const routeName = '/detail_news_list';
  final Article article;
  const DetailNewsScreen({Key? key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.description),
                    Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const Divider(color: Colors.grey),
                    Text('Date: ${article.publishedAt}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MoreNewsScreen.routeName,
                              arguments: article);
                        },
                        child: const Text('More...'))
                  ],
                )),
          ],
        )));
  }
}
