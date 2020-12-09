import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/post_api.dart';
import 'package:laravel_news_app/src/models/post.dart';
import 'package:laravel_news_app/src/screens/pages/single_post.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostApi postApi = PostApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postApi.fetchPostsByCategory('1'),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.none:
            return Container();
            break;
          case ConnectionState.waiting:
            return Container();
            break;
          case ConnectionState.active:
            return Container();
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {
              return Container();
            } else {
              List<Post> posts = snapShot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    child: _drawSingleRow(posts[position]),
                  );
                },
                itemCount: posts.length,
              );
            }
            break;
        }
      },
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SinglePostScreen(post: post);
          }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Image(
                image: post.getPostImage(),
                fit: BoxFit.cover,
              ),
              width: 124,
              height: 124,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    post.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Michael Adams'),
                      Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text('parseHumanDateTime( post.dateWritten )'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
