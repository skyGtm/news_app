class News {
  late String id;
  late String url;
  late String title;
  late String text;
  late String publisher;
  late String author;
  late String image;
  late String date;

  News({
    required this.id,
    required this.url,
    required this.title,
    required this.text,
    required this.author,
    required this.image,
    required this.date,
    required this.publisher,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      url: json['url'],
      title: json['title'],
      text: json['text'],
      publisher: json['publisher'],
      author: json['author'],
      image: json['image'],
      date: json['date'].split('T')[0],
    );
  }
}

class NewsData {
  static late List<News> newsList;
}
