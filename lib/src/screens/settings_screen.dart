import 'package:flutter/material.dart';

import 'category_manager_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle _titltText = TextStyle(fontSize: 22.0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SwitchListTile(
                title: Text('Theme', style: _titltText),
                subtitle: Text('Light'),
                value: false,
                onChanged: (bool newValue) {},
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              SwitchListTile(
                title: Text('Enable Push Notification', style: _titltText),
                value: true,
                onChanged: (bool newValue) {},
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              ListTile(
                title: Text('Manage Categories', style: _titltText),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CaregoryManagerScreen(),
                    ),
                  );
                },
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              ListTile(
                title: Text('Clear Cache', style: _titltText),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('6.7 MB'),
                    SizedBox(width: 6),
                    Icon(Icons.cached),
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              ListTile(
                title: Text('Rate App', style: _titltText),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              ListTile(
                title: Text('More App', style: _titltText),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              ListTile(
                title: Text('Privacy Policy', style: _titltText),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              ListTile(
                title: Text('About', style: _titltText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
