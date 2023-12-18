class DataBerita {
  final String link;
  final String image;
  final String description;
  final String title;
  final List<DataPath> posts;

  DataBerita({
    required this.link,
    required this.image,
    required this.description,
    required this.title,
    required this.posts,
  });

  factory DataBerita.fromJson(Map<String, dynamic> json) {
    return DataBerita(
      link: json['link'],
      image: json['image'],
      description: json['description'],
      title: json['title'],
      posts: (json['posts'] as List)
          .map((dataJson) => DataPath.fromJson(dataJson))
          .toList(),
    );
  }
}

class DataPath {
  final String link;
  final String title;
  final String pubDate;
  final String description;
  final String thumbnail;

  DataPath({
    required this.link,
    required this.title,
    required this.pubDate,
    required this.description,
    required this.thumbnail,
  });

  factory DataPath.fromJson(Map<String, dynamic> json) {
    return DataPath(
      link: json['link'],
      title: json['title'],
      pubDate: json['pubDate'],
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }
}
