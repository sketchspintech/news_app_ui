import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/widgets/drawerWidget.dart';
import '../screens/pages/login.dart';
import '../api/post_api.dart';
import '../models/post.dart';
import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/help.dart';
import 'pages/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostApi postApi = PostApi();
  Future<List<Post>> futureRecentPosts;

  @override
  void initState() {
    futureRecentPosts = postApi.fetchRecentPosts();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Home'),
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
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150.0,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -3),
                    color: Colors.grey,
                    blurRadius: 12.0,
                  ),
                ]),
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                          Text('Bollywood',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700))
                        ],
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                leading: Container(
                  width: 5.0,
                  padding: EdgeInsets.all(0),
                  color: Colors.blue,
                ),
                title: Text(
                  'Trending News',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Container(
                height: 280.0,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(8.0),
                            height: 280,
                            width: MediaQuery.of(context).size.width - 35.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Align(
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              width: MediaQuery.of(context).size.width - 35.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Virat Kohli fastest to 11,000 ODI runs',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Virat kohli became the fastest batsmen to accumulate 11,00 runs in ODIs after scoring half century against Pakistan on Sunday at jjkhjh',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade200),
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                leading: Container(
                  width: 5.0,
                  padding: EdgeInsets.all(0),
                  color: Colors.blue,
                ),
                title: Text(
                  'Recently Viewed',
                  style: TextStyle(fontSize: 30.0),
                ),
                trailing: GestureDetector(
                    child: Text('View All',
                        style: TextStyle(color: Colors.blue, fontSize: 20.0))),
              ),
              Container(
                height: 300.0,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.bookmark,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 8,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.only(right: 4),
                                      icon: Icon(
                                        Icons.share,
                                        size: 25.0,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Sports',
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
                                    'Virat Kohli fastest to 11,000 ODI runs',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '17-06-2019',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
