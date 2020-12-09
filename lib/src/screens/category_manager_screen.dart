import 'package:flutter/material.dart';

class CaregoryManagerScreen extends StatefulWidget {
  @override
  _CaregoryManagerScreenState createState() => _CaregoryManagerScreenState();
}

class _CaregoryManagerScreenState extends State<CaregoryManagerScreen> {
  List items = [
    'Sports',
    'Fashion',
    'Politics',
    'Technologies',
    'Health',
    'World',
    'Entertainment',
    'Bollywood',
    'Traveling'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Categories'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Select categories below to see the latest news of your choice',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20.0),
                    Wrap(
                      children: <Widget>[
                        ...items.map((item) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 5.0),
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 4),
                    borderRadius: BorderRadius.circular(8)),
                child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'SAVE CATEGORIES',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
