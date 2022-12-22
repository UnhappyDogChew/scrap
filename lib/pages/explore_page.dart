import 'package:flutter/material.dart';
import 'package:scrap/models/post.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/post', arguments: posts[index]);
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
                              posts[index].title,
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
                              posts[index].body,
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
                        'by username',
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
