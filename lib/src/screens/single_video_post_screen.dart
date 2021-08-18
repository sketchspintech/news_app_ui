import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/post_api.dart';
import 'package:laravel_news_app/src/models/post.dart';

class SingleVideoPostScreen extends StatefulWidget {
  final String postId;
  SingleVideoPostScreen({this.postId});
  @override
  _SingleVideoPostScreenState createState() => _SingleVideoPostScreenState();
}

class _SingleVideoPostScreenState extends State<SingleVideoPostScreen> {
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
      appBar: AppBar(
        title: Text('Video Post'),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(250),
        //   child: Container(
        //     padding: EdgeInsets.all(20.0),
        //     color: Colors.blue,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
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
        ),
      ),
    );
  }

  Widget _singlePostWidget(Post post) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 250.0,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: post.getPostImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
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
                            post.getAuthorFullName(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            post.time,
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
        ],
      ),
    );
  }
}
