import 'dart:convert';

import 'package:laravel_news_app/src/api/api_util.dart';
import 'package:laravel_news_app/src/models/category.dart';
import 'package:laravel_news_app/src/models/post.dart';

class CategoryApi {
  // get all categories
  Future<List<Category>> fetchAllCategories() async {
    var response = await ApiUtil().getData('categories');
    List<Category> categories = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var data in body['data']) {
        Category category = Category.fromJson(data);
        categories.add(category);
      }
    }
    print(categories);
    return categories;
  }

  // get category with related posts
  Future<List<Post>> fetchSingleCategory(String categoryId) async {
    var response = await ApiUtil().getData('categories/$categoryId/posts');
    List<Post> posts = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var data in body['data']) {
        Post post = Post.fromJson(data);
        posts.add(post);
      }
    }
    return posts;
  }
}
