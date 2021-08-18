import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/screens/edit_profile_screen.dart';
import 'package:laravel_news_app/src/screens/upload_news_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'test@test.com',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                          Text(
                            '1234567890',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          SizedBox(height: 20.0)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadPostScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'ADD NEWS',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  //   child: Center(
                  //     child: Container(
                  //       padding: EdgeInsets.all(8.0),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.blue, width: 4),
                  //           borderRadius: BorderRadius.circular(8)),
                  //       child: GestureDetector(
                  //           onTap: () {},
                  //           child: Text(
                  //             'APPLY FOR REPORTER',
                  //             style: TextStyle(
                  //                 fontSize: 20.0, fontWeight: FontWeight.w700),
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  ListView.builder(
                    padding: EdgeInsets.all(12.0),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
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
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
