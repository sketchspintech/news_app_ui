import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/post_api.dart';
import 'package:laravel_news_app/src/models/post.dart';
import 'package:laravel_news_app/src/widgets/postItemWigdet.dart';

class CategoriesPost extends StatefulWidget {
  final String categoryId;
  CategoriesPost({this.categoryId});
  @override
  _CategoriesPostState createState() => _CategoriesPostState();
}

class _CategoriesPostState extends State<CategoriesPost> {
  PostApi postApi = PostApi();
  Future<List<Post>> futurePosts;

  @override
  void initState() {
    futurePosts = postApi.fetchPostsByCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: futurePosts,
          builder: ((BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Container();
                break;
              case ConnectionState.none:
                return Container();
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Container();
                }
                if (snapshot.hasData) {
                  return _postsList(snapshot.data);
                }
                break;
            }
            return Container();
          }),
        ),
      ),
    );
  }

  Widget _postsList(List<Post> posts) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostItemWidget(post: posts[index]);
        },
      ),
    );
  }
}
