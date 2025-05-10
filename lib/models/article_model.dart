class Article {
  final int userId;
  final int id;
  final String title;
  final String body;

  Article({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  Article copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Article(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}