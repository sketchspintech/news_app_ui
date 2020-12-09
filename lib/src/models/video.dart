class Video {
  String id, description, url, postId;

  Video({this.id, this.description, this.url, this.postId});

  Video.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['image_id'].toString();
    this.description = jsonObject['image_description'].toString();
    this.url = jsonObject['image_url'].toString();
    this.postId = jsonObject['post-id'].toString();
  }
}
