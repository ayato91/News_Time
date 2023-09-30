import 'package:flutter/material.dart';
import 'package:news_app_with_api/model/article_model.dart';

//! Detailed View of the article

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key, required this.article});
  final Article article;

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    String time = widget.article.publishedAt.substring(
        widget.article.publishedAt.indexOf('T') + 1,
        widget.article.publishedAt.indexOf('Z'));
    String date = widget.article.publishedAt
        .substring(0, widget.article.publishedAt.indexOf('T'));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          forceMaterialTransparency: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Article Title

                  SizedBox(
                    child: Text(
                      widget.article.title,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //! Author of the Article

                  SizedBox(
                    child: Text(
                      '- by ${widget.article.author} ($date @$time)',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 10),
                  //! Article Image

                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.article.urlToImage),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  const SizedBox(height: 20),

                  //! Justified Article Description

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      widget.article.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),

                  //! Button for detailed view

                  (isClicked == false)
                      ? TextButton(
                          onPressed: () {
                            isClicked = true;
                            setState(() {});
                          },
                          child: const Text(
                            '...Read More',
                            style: TextStyle(fontSize: 25),
                          ))
                      :

                      //! Justified article details

                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 30),
                          child: Text(
                            widget.article.content,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 23),
                          ),
                        )
                ]),
          ),
        ),
      ),
    );
  }
}
