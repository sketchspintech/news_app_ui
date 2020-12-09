import '../models/author.dart';

class Comment {
  String id, content;
  Author author;

  Comment({this.id, this.content, this.author});

  Comment.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['comment_id'].toString();
    this.content = jsonObject['comment'].toString();
    this.author = Author.fromJson(jsonObject['author']);
  }
}
