import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/widgets/drawerWidget.dart';

class FavoritePostScreen extends StatefulWidget {
  @override
  _FavoritePostScreenState createState() => _FavoritePostScreenState();
}

class _FavoritePostScreenState extends State<FavoritePostScreen> {
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
      body: Container(),
    );
  }
}
