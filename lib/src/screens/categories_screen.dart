import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/category_api.dart';
import 'package:laravel_news_app/src/models/category.dart';
import 'package:laravel_news_app/src/screens/category_post_screen.dart';
import 'package:laravel_news_app/src/widgets/drawerWidget.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryApi categoryApi = CategoryApi();
  Future<List<Category>> futureCategories;

  @override
  void initState() {
    futureCategories = categoryApi.fetchAllCategories();
    super.initState();
  }

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
        child: FutureBuilder(
          future: futureCategories,
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
                  return _categoriesWidget(snapshot.data);
                }
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _categoriesWidget(List<Category> categories) {
    return Column(
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
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryPostsScreen(categoryId: categories[index].id),
                  ),
                );
              },
              child: Column(
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
                          categories[index].title,
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
              ),
            );
          },
        ),
      ],
    );
  }
}
