import 'package:flutter/material.dart';
import 'package:news_app_with_api/model/article_model.dart';
import 'package:news_app_with_api/pages/detailed_article_page.dart';

Widget articleViewer(Article article, BuildContext context) {
  //! Clickable News Title Previewer Widget

  return InkWell(
    //! Click to display the news in details

    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArticleDetails(article: article))),
    child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //! Container for Images

            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString()),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 10),

            //! Container for Source Name

            Container(
              margin: const EdgeInsets.only(right: 3),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: const Color(0xFF07729C),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(article.source.name,
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),

            //! News Title

            SizedBox(
              child: Text(
                article.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          ]),
    ),
  );
}
