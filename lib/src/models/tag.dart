class Tag {
  String id, title;

  Tag({this.id, this.title});

  Tag.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['tag_id'].toString();
    this.title = jsonObject['tag_title'].toString();
  }
}
