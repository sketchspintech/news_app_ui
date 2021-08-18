import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/models/category.dart';
import 'package:laravel_news_app/src/screens/category_post_screen.dart';

class CategoryCardWidget extends StatelessWidget {
  final Category category;
  CategoryCardWidget({this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPostsScreen(categoryId: category.id),
          ),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              height: 95,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Text(category.title != null ? category.title : '',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
