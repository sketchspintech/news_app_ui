import 'dart:convert';

import 'package:laravel_news_app/src/models/post.dart';

import 'api_util.dart';

class PostApi {
  // Get letest posts
  Future<List<Post>> fetchAllPosts() async {
    var response = await ApiUtil().getData('posts');
    List<Post> recentPosts = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        recentPosts.add(post);
      }
    }
    print(recentPosts);
    return recentPosts;
  }

  // Get trending
  Future<List<Post>> fetchAllTrendingPosts() async {
    var response = await ApiUtil().getData('posts/trending_posts');
    List<Post> posts = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        posts.add(post);
      }
    }
    print(posts);
    return posts;
  }

  // Get recent posts
  Future<List<Post>> fetchRecentPosts() async {
    var response = await ApiUtil().getData('posts/recent_posts');
    List<Post> posts = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        posts.add(post);
      }
    }
    print(posts);
    return posts;
  }

  // Get single post
  Future<Post> fetchSinglePost(String postId) async {
    var response = await ApiUtil().getData('posts/$postId');
    Post singlePost;
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Post post = Post.fromJson(body['data']);
      singlePost = post;
    }
    print(singlePost);
    return singlePost;
  }

  // Get Video/Text posts
  Future<List<Post>> fetchPostsByType(String postType) async {
    var response = await ApiUtil().getData('posts?post_type=$postType');
    List<Post> posts = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        posts.add(post);
      }
    }
    print(posts);
    return posts;
  }
}
