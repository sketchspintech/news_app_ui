import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/api/category_api.dart';
import 'package:laravel_news_app/src/models/category.dart';
import 'package:laravel_news_app/src/models/post.dart';
import 'package:laravel_news_app/src/widgets/category_card_widget.dart';
import 'package:laravel_news_app/src/widgets/post_item_card_widget.dart';

class CategoryPostsScreen extends StatefulWidget {
  final String categoryId;
  CategoryPostsScreen({this.categoryId});
  @override
  _CategoryPostsScreenState createState() => _CategoryPostsScreenState();
}

class _CategoryPostsScreenState extends State<CategoryPostsScreen> {
  CategoryApi categoryApi = CategoryApi();
  // PostApi postApi = PostApi();
  Future<List<Category>> futureCategories;
  Future<List<Post>> futurePosts;

  @override
  void initState() {
    futureCategories = categoryApi.fetchAllCategories();
    futurePosts = categoryApi.fetchSingleCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150.0,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -3),
                    color: Colors.grey,
                    blurRadius: 12.0,
                  ),
                ]),
                child: FutureBuilder(
                  future: futureCategories,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Category>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Container(
                          child: Text('loading'),
                        );
                        break;
                      case ConnectionState.none:
                        return Container(
                          child: Text('none'),
                        );
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('error'),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryCardWidget(
                                category: snapshot.data[index],
                              );
                            },
                          );
                        }
                    }
                    return Container();
                  },
                ),
              ),
              FutureBuilder(
                future: futurePosts,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
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
                        return ListView.builder(
                          padding: EdgeInsets.all(12.0),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: PostItemCardWidget(
                                post: snapshot.data[index],
                              ),
                            );
                          },
                        );
                      }
                  }
                  return Container();
                },
              ),
              // Container(
              //   child: ListView.builder(
              //     padding: EdgeInsets.all(12.0),
              //     shrinkWrap: true,
              //     primary: false,
              //     itemCount: 6,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(bottom: 8.0),
              //         child: Card(
              //           clipBehavior: Clip.hardEdge,
              //           child: Container(
              //             width: 300,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: <Widget>[
              //                 Stack(
              //                   children: <Widget>[
              //                     Container(
              //                       height: 190,
              //                       decoration: BoxDecoration(
              //                         color: Colors.red,
              //                       ),
              //                     ),
              //                     Positioned(
              //                       right: 10,
              //                       top: 10,
              //                       child: IconButton(
              //                         icon: Icon(
              //                           Icons.bookmark,
              //                           size: 35.0,
              //                           color: Colors.white,
              //                         ),
              //                         onPressed: () {},
              //                       ),
              //                     ),
              //                     Positioned(
              //                       right: 10,
              //                       bottom: 8,
              //                       child: Container(
              //                         height: 40,
              //                         width: 40,
              //                         decoration: BoxDecoration(
              //                           color: Colors.white,
              //                           borderRadius: BorderRadius.circular(50),
              //                         ),
              //                         child: IconButton(
              //                           padding: EdgeInsets.only(right: 4),
              //                           icon: Icon(
              //                             Icons.share,
              //                             size: 25.0,
              //                             color: Colors.blue,
              //                           ),
              //                           onPressed: () {},
              //                         ),
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //                 Container(
              //                   padding: EdgeInsets.all(8.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: <Widget>[
              //                       Text(
              //                         'Sports',
              //                         style: TextStyle(
              //                           color: Colors.blue,
              //                           fontSize: 16.0,
              //                           fontWeight: FontWeight.w600,
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         height: 4,
              //                       ),
              //                       Text(
              //                         'Virat Kohli fastest to 11,000 ODI runs',
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                           fontSize: 22.0,
              //                           fontWeight: FontWeight.w600,
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         height: 4,
              //                       ),
              //                       Text(
              //                         '17-06-2019',
              //                         style: TextStyle(color: Colors.grey),
              //                       )
              //                     ],
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
