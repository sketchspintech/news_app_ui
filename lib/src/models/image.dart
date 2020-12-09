class ImageModel {
  String id, description, url, postId;
  bool isFeatured;

  ImageModel(
      {this.id, this.description, this.url, this.postId, this.isFeatured});

  ImageModel.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['image_id'].toString();
    this.description = jsonObject['image_description'].toString();
    this.url = jsonObject['image_url'].toString();
    this.postId = jsonObject['post-id'].toString();
    this.isFeatured = jsonObject['is_featurrd'] == 1 ? true : false;
  }
}
