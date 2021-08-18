import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/post_api.dart';
import 'package:laravel_news_app/src/models/post.dart';

class SinglePostScreen extends StatefulWidget {
  final String postId;
  SinglePostScreen({this.postId});
  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  PostApi postApi = PostApi();
  Future<Post> futurePost;

  @override
  void initState() {
    futurePost = postApi.fetchSinglePost(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futurePost,
        builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
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
                return _singlePostWidget(snapshot.data);
              }
          }
          return Container();
        },
      ),
    );
  }

  Widget _singlePostWidget(Post post) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300.0,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: post.getPostImage(),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.only(right: 4.0),
                        icon: Icon(
                          Icons.share,
                          size: 35.0,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 85,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.only(top: 4.0),
                        icon: Icon(
                          Icons.comment,
                          size: 30.0,
                          color: Colors.pink,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.category.title != null ? post.category.title : '',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        post.title != null ? post.title : '',
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${post.getAuthorFullName()}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            post.time != null ? post.time : '',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  post.content != null ? post.content : '',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
