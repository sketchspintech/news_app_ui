import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/post_api.dart';
import 'package:laravel_news_app/src/models/post.dart';
import 'package:laravel_news_app/src/widgets/drawerWidget.dart';
import 'package:laravel_news_app/src/widgets/post_item_card_widget.dart';

class VideoPostScreen extends StatefulWidget {
  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
  PostApi postApi = PostApi();
  Future<List<Post>> futureVideoPosts;

  @override
  void initState() {
    futureVideoPosts = postApi.fetchPostsByType('video');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Video News'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tv),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: futureVideoPosts,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
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
                  return ListView.builder(
                    padding: EdgeInsets.all(12.0),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: PostItemCardWidget(
                          post: snapshot.data[index],
                        ),
                      );
                    },
                  );
                }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
