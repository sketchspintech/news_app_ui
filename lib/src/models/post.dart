import 'package:flutter/material.dart';

import '../models/author.dart';
import '../models/category.dart';
import '../models/comment.dart';
import '../models/image.dart';
import '../models/tag.dart';
import '../models/video.dart';

class Post {
  String id, title, content, type, time;
  List<ImageModel> images;
  List<Video> videos;
  Category category;
  Author author;
  List<Tag> tags;
  List<Comment> comments;

  Post(
      {this.id,
      this.title,
      this.content,
      this.type,
      this.time,
      this.images,
      this.videos,
      this.category,
      this.author,
      this.tags,
      this.comments});

  Post.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['post_id'].toString();
    this.title = jsonObject['post_title'].toString();
    this.content = jsonObject['post_content'].toString();
    this.type = jsonObject['post_type'].toString();
    this.time = jsonObject['updated_at'].toString();
    this.images = [];
    jsonObject['images'].forEach((element) {
      images.add(ImageModel.fromJson(element));
    });

    this.videos = [];
    jsonObject['videos'].forEach((element) {
      videos.add(Video.fromJson(element));
    });

    this.category = Category.fromJson(jsonObject['category']);
    this.author = Author.fromJson(jsonObject['author']);

    this.tags = [];
    jsonObject['tags'].forEach((element) {
      tags.add(Tag.fromJson(element));
    });

    this.comments = [];
    jsonObject['comments'].forEach((element) {
      comments.add(Comment.fromJson(element));
    });
  }

  String getFeaturedImage() {
    if (this.images.length > 0) {
      for (var image in images) {
        if (image.isFeatured) {
          return image.url;
        }
        if (!image.isFeatured) {
          return this.images[0].url;
        }
      }
    }
    return null;
  }

  ImageProvider getPostImage() {
    if (this.getFeaturedImage() == null) {
      return ExactAssetImage('asset/img/placeholder_bg.png');
    }
    return NetworkImage(this.getFeaturedImage());
  }

  String getAuthorFullName() {
    return '${this.author.firstName} ${this.author.lastName}';
  }
}
