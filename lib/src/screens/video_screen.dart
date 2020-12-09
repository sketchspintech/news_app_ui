import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/widgets/drawerWidget.dart';

class VideoPostScreen extends StatefulWidget {
  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
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
        child: ListView.builder(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
