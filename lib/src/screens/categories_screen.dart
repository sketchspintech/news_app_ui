import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/widgets/drawerWidget.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Categories'),
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
        child: Column(
          children: <Widget>[
            // Offstage(
            //   offstage: false,
            //   child:
            GridView.builder(
              padding: EdgeInsets.all(20.0),
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1.0),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Entertainment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // ),
            // GridView.extent(
            //   shrinkWrap: true,
            //   maxCrossAxisExtent: 250,
            //   children: <Widget>[
            //     Container(
            //       child: Column(
            //         children: <Widget>[
            //           Container(
            //             margin: EdgeInsets.all(8.0),
            //             height: MediaQuery.of(context).size.height * 0.2,
            //             // width: 150,
            //             decoration: BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       child: Column(
            //         children: <Widget>[
            //           Container(
            //             margin: EdgeInsets.all(8.0),
            //             height: MediaQuery.of(context).size.height * 0.2,
            //             // width: 150,
            //             decoration: BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       child: Column(
            //         children: <Widget>[
            //           Container(
            //             margin: EdgeInsets.all(8.0),
            //             height: MediaQuery.of(context).size.height * 0.2,
            //             // width: 150,
            //             decoration: BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       child: Column(
            //         children: <Widget>[
            //           Container(
            //             margin: EdgeInsets.all(8.0),
            //             height: MediaQuery.of(context).size.height * 0.2,
            //             // width: 150,
            //             decoration: BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
