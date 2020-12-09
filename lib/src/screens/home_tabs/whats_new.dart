import 'dart:math';

import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/models/post.dart';
import 'package:laravel_news_app/src/screens/pages/single_post.dart';
import '../../api/post_api.dart';

class WhatsNewTab extends StatefulWidget {
  @override
  _WhatsNewTabState createState() => _WhatsNewTabState();
}

class _WhatsNewTabState extends State<WhatsNewTab> {
  PostApi postApi = PostApi();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600);
    TextStyle _headerDescription = TextStyle(color: Colors.white, fontSize: 18);

    return FutureBuilder(
      future: postApi.fetchRecentPosts(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container();
            break;
          case ConnectionState.active:
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
              List<Post> posts = snapshot.data;
              Random random = Random();
              int randomIndex = random.nextInt(posts.length);
              Post post = posts[randomIndex];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SinglePostScreen(post: post);
                  }));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: post.getPostImage(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 48, right: 48),
                          child: Text(
                            post.title,
                            style: _headerTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34, right: 34),
                          child: Text(
                            post.content.substring(0, 75),
                            style: _headerDescription,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            break;
        }
        return Container();
      },
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: postApi.fetchPostsByCategory('1'),
                builder: (context, AsyncSnapshot snapShot) {
                  switch (snapShot.connectionState) {
                    case ConnectionState.waiting:
                      return Container();
                      break;
                    case ConnectionState.active:
                      return Container();
                      break;
                    case ConnectionState.none:
                      return Container();
                      break;
                    case ConnectionState.done:
                      if (snapShot.hasError) {
                        return Container();
                      } else {
                        if (snapShot.hasData) {
                          List<Post> posts = snapShot.data;
                          if (posts.length >= 3) {
                            Post post1 = snapShot.data[0];
                            Post post2 = snapShot.data[1];
                            Post post3 = snapShot.data[2];
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        } else {
                          return Container();
                        }
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
        future: postApi.fetchPostsByCategory('1'),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.active:
              return Container();
              break;
            case ConnectionState.waiting:
              return Container();
              break;
            case ConnectionState.done:
              if (snapShot.hasError) {
                return Container();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 8, top: 8),
                      child: _drawSectionTitle('Recent Updates'),
                    ),
                    _drawRecentUpdatesCard(Colors.deepOrange, snapShot.data[0]),
                    _drawRecentUpdatesCard(Colors.teal, snapShot.data[1]),
                    SizedBox(
                      height: 48,
                    ),
                  ],
                );
              }
              break;
          }
        },
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }

  Widget _drawSingleRow(Post post) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SinglePostScreen(post: post);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
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
                          Text('parseHumanDateTime(post.dateWritten)'),
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

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          fontSize: 16),
    );
  }

  Widget _drawRecentUpdatesCard(Color color, Post post) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SinglePostScreen(post: post);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: post.getPostImage(),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Container(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'SPORT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'parseHumanDateTime( post.dateWritten )',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
