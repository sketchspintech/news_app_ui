import 'package:flutter/material.dart';

import 'src/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        // '/categories': (BuildContext context) => CategoriesScreen(),
        // '/singlePost': (BuildContext context) => CategoriesScreen(),
      },
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CategoryApi categoryApi = CategoryApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: categoryApi.fetchAllCategories(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Container();
                break;
              case ConnectionState.none:
                return Container();
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Container();
                }
                if (snapshot.hasData) {
                  return _categoriesList(snapshot.data, context);
                }
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _categoriesList(List<Category> categories, BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categories[index].title),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CategoriesPost(categoryId: categories[index].id),
              ),
            );
          },
        );
      },
    );
  }
}
*/
