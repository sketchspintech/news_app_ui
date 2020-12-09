import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            title: Text('Profile'),
            actions: <Widget>[
              Container(
                height: 40,
                width: 48,
                margin: EdgeInsets.only(top: 8.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
            flexibleSpace: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'test@test.com',
                            style:
                                TextStyle(color: Colors.white, fontSize: 28.0),
                          ),
                          Text(
                            '1234567890',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Hello, ',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 1.0),
                        Text(
                          'John',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 4),
                              borderRadius: BorderRadius.circular(8)),
                          child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'APPLY FOR REPORTER',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
