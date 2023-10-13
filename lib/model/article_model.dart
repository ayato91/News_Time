//! A Model for get the data of the articles from the API

//! Source Part of the Article Model

class Source {
  String? id = '';
  String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String?, dynamic> json) {
    return Source(
      id: json['id'] ?? '',
      name: json['name'],
    );
  }
}

//! Overall Article Model

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? '',
      title: json['title'] as String,
      description: json['description'] ?? "",
      url: json['url'] as String,
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] as String,
      content: json['content'] ?? "",
    );
  }
}
