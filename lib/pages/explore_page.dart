import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scrap/models/post.dart';
import 'package:scrap/services/data_service.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // fetch 10 posts
    log('${DataService().fetchPosts()} posts are fetched');

    _scrollController.addListener(() {
      if (_scrollController.position.outOfRange) {
        if (_scrollController.position.pixels < 0) {
          log('top');
        } else {
          log('bottom');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: DataService().posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/post',
                    arguments: DataService().posts[index]);
              },
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 20.0, 16.0, 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DataService().posts[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 21.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              DataService().posts[index].body,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Nanum Myeongjo',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'by ${DataService().users[DataService().posts[index].userId]!.username}',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Open Sans',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
