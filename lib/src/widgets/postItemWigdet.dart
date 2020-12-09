import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/screens/pages/single_post.dart';
import '../models/post.dart';

class PostItemWidget extends StatelessWidget {
  final Post post;

  PostItemWidget({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SinglePostScreen(post: post),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: post.getPostImage(),
                fit: BoxFit.cover,
                width: 130.0,
                height: 95.0,
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      post.title,
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(post.getAuthorFullName(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          post.time,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
