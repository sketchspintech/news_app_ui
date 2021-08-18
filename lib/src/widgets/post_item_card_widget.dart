import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/models/post.dart';
import 'package:laravel_news_app/src/screens/single_post_screen.dart';
import 'package:laravel_news_app/src/screens/single_video_post_screen.dart';

class PostItemCardWidget extends StatefulWidget {
  final Post post;
  PostItemCardWidget({this.post});

  @override
  _PostItemCardWidgetState createState() => _PostItemCardWidgetState();
}

class _PostItemCardWidgetState extends State<PostItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.post.type == 'text'
                ? SinglePostScreen(postId: widget.post.id)
                : SingleVideoPostScreen(postId: widget.post.id),
          ),
        );
      },
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
                        image: DecorationImage(
                            image: widget.post.getPostImage(),
                            fit: BoxFit.cover)),
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
                      widget.post.category.title != null
                          ? widget.post.category.title
                          : '',
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
                      widget.post.title != null ? widget.post.title : '',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '17-06-2019',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '${widget.post.author.firstName} ${widget.post.author.lastName}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
