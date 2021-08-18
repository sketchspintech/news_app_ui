import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/screens/categories_screen.dart';
import 'package:laravel_news_app/src/screens/favourite_screen.dart';
import 'package:laravel_news_app/src/screens/forgot_password_screen.dart';
import 'package:laravel_news_app/src/screens/home_screen.dart';
import 'package:laravel_news_app/src/screens/latest_screen.dart';
import 'package:laravel_news_app/src/screens/login_screen.dart';
import 'package:laravel_news_app/src/screens/profile_screen.dart';
import 'package:laravel_news_app/src/screens/settings_screen.dart';
import 'package:laravel_news_app/src/screens/single_post_screen.dart';
import 'package:laravel_news_app/src/screens/single_video_post_screen.dart';
import 'package:laravel_news_app/src/screens/video_screen.dart';
import 'package:laravel_news_app/src/screens/category_post_screen.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle _drawerText = TextStyle(
      color: Colors.grey,
      fontSize: 22.0,
    );
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.white,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Laravel News App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.home,
              size: 30.0,
            ),
            title: Text('Home', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LatestPostScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.video_label,
              size: 30.0,
            ),
            title: Text('Latest', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => VideoPostScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.video_library,
              size: 30.0,
            ),
            title: Text('Video News', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CategoriesScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.category,
              size: 30.0,
            ),
            title: Text('Categories', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => FavoritePostScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.favorite,
              size: 30.0,
            ),
            title: Text('Favourite', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CategoryPostsScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.favorite,
              size: 30.0,
            ),
            title: Text('Category Posts', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SingleVideoPostScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.favorite,
              size: 30.0,
            ),
            title: Text('Single Video', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.person,
              size: 30.0,
            ),
            title: Text('Profile', style: _drawerText),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.share,
              size: 30.0,
            ),
            title: Text('Share App', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SinglePostScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.settings,
              size: 30.0,
            ),
            title: Text('Single Post', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.settings,
              size: 30.0,
            ),
            title: Text('Settings', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 30.0,
            ),
            title: Text('login', style: _drawerText),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPasswordScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 30.0,
            ),
            title: Text('Forgot Password', style: _drawerText),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.exit_to_app,
              size: 30.0,
            ),
            title: Text('logout', style: _drawerText),
          ),
        ],
      ),
    );
  }
}
