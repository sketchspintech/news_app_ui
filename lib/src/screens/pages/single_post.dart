import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/models/post.dart';

class SinglePostScreen extends StatefulWidget {
  final Post post;

  SinglePostScreen({this.post});

  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.post.getPostImage(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
