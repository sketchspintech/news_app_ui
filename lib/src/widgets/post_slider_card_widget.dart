import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:laravel_news_app/src/models/post.dart';

class PostSliderCardWidget extends StatelessWidget {
  final Post post;
  PostSliderCardWidget({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            height: 280,
            width: MediaQuery.of(context).size.width - 35.0,
            decoration: BoxDecoration(
              color: Colors.red,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white.withOpacity(0.2), Colors.black],
              ),
              image: DecorationImage(
                image: NetworkImage(
                    post.images.length > 0 ? post.images[0].url : ''),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstOver),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Align(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width - 35.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.title != null ? post.title : '',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    post.content != null ? post.content : '',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade200),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
