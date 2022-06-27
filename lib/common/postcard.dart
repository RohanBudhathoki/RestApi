import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import '../services/remote_services.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts!.isNotEmpty) {
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "title :${posts?[index].title}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "Description :${posts?[index].body}",
                          maxLines: 4,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 10),
                          maxFontSize: 10,
                          minFontSize: 6,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green),
                        child: Image.asset('assets/image/arrowwhite.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
