import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/model/Article.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MoreNewsScreen extends StatelessWidget {
  static const routeName = '/more_news';
  final Article article;
  const MoreNewsScreen({Key? key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: WebView(
          initialUrl: article.url,
        ));
  }
}
