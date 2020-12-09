import 'dart:convert';

import 'package:laravel_news_app/src/models/post.dart';

import 'api_util.dart';

class PostApi {
  // Get recent posts
  Future<List<Post>> fetchRecentPosts() async {
    var response = await ApiUtil().getData('posts');
    List<Post> recentPosts = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        recentPosts.add(post);
      }
      print(response.body);
    }
    return recentPosts;
  }

  // Get posts by category
  Future<List<Post>> fetchPostsByCategory(String categoryId) async {
    var response =
        await ApiUtil().getPostsByCategory('categories/$categoryId/posts');
    List<Post> posts = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        posts.add(post);
      }
    }
    // print(posts);
    return posts;
  }
}
