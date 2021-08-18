import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../api/category_api.dart';
import '../api/post_api.dart';

import '../models/category.dart';
import '../models/post.dart';

import '../widgets/category_card_widget.dart';
import '../widgets/drawerWidget.dart';
import '../widgets/post_item_card_widget.dart';
import '../widgets/post_slider_card_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryApi categoryApi = CategoryApi();
  PostApi postApi = PostApi();

  Future<List<Category>> futureCategories;
  Future<List<Post>> futureLatestPosts;
  Future<List<Post>> futureTrendingPosts;
  Future<List<Post>> futureRecentPosts;

  @override
  void initState() {
    futureCategories = categoryApi.fetchAllCategories();
    futureLatestPosts = postApi.fetchAllPosts();
    futureTrendingPosts = postApi.fetchAllTrendingPosts();
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
                child: FutureBuilder(
                  future: futureCategories,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Category>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Container(
                          child: Text('loading'),
                        );
                        break;
                      case ConnectionState.none:
                        return Container(
                          child: Text('none'),
                        );
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('error'),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryCardWidget(
                                category: snapshot.data[index],
                              );
                            },
                          );
                        }
                    }
                    return Container();
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
                  'Latest News',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Container(
                height: 300.0,
                margin: EdgeInsets.only(bottom: 20),
                child: FutureBuilder(
                  future: futureLatestPosts,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Post>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Container(
                          child: Text('loading'),
                        );
                        break;
                      case ConnectionState.none:
                        return Container(
                          child: Text('none'),
                        );
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('error'),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PostItemCardWidget(
                                  post: snapshot.data[index]);
                            },
                          );
                        }
                    }
                    return Container();
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
                child: FutureBuilder(
                  future: futureTrendingPosts,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Post>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Container(
                          child: Text('loading'),
                        );
                        break;
                      case ConnectionState.none:
                        return Container(
                          child: Text('none'),
                        );
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('error'),
                          );
                        }
                        if (snapshot.hasData) {
                          return Swiper(
                            // padding: EdgeInsets.all(8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            pagination: SwiperPagination(),
                            autoplay: true,
                            autoplayDelay: 8000,
                            loop: true,
                            itemBuilder: (BuildContext context, int index) {
                              return PostSliderCardWidget(
                                  post: snapshot.data[index]);
                            },
                          );
                        }
                    }
                    return Container();
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
                child: FutureBuilder(
                  future: futureRecentPosts,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Post>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Container(
                          child: Text('loading'),
                        );
                        break;
                      case ConnectionState.none:
                        return Container(
                          child: Text('none'),
                        );
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('error'),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PostItemCardWidget(
                                  post: snapshot.data[index]);
                            },
                          );
                        }
                    }
                    return Container();
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
