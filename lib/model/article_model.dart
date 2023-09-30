//! A Model for get the data of the articles from the API

//! Source Part of the Article Model

class Source {
  String? id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String?, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}

//! Overall Article Model

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String?, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
