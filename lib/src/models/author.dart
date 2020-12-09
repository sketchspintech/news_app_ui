class Author {
  String id, firstName, lastName, email, avatar;

  Author({this.id, this.firstName, this.lastName, this.email, this.avatar});

  Author.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['author_id'].toString();
    this.firstName = jsonObject['first_name'].toString();
    this.lastName = jsonObject['last_name'].toString();
    this.email = jsonObject['author_email'].toString();
    this.avatar = jsonObject['avatar'].toString();
  }
}
