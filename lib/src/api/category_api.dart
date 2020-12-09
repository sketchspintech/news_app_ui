import 'dart:convert';

import 'package:laravel_news_app/src/api/api_util.dart';
import 'package:laravel_news_app/src/models/category.dart';

class CategoryApi {
  Future<List<Category>> fetchAllCategories() async {
    var response = await ApiUtil().getAllCategories('categories');
    List<Category> categories = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var data in body['data']) {
        Category category = Category.fromJson(data);
        categories.add(category);
      }
    }
    return categories;
  }
}
