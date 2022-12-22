import 'package:flutter/material.dart';
import 'package:scrap/models/post.dart';
import 'package:scrap/models/user.dart';
import 'package:scrap/services/data_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    assert(ModalRoute.of(context) != null, 'post is null');
    Post post = ModalRoute.of(context)!.settings.arguments as Post;
    User user = DataService().userOfId(post.userId)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        foregroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'by. ${user.username}',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 14.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 30.0),
            Text(
              post.body,
              style: TextStyle(
                fontFamily: 'Nanum Myeongjo',
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile', arguments: user);
              },
              child: Text('see writer\'s profile'),
            ),
          ],
        ),
      ),
    );
  }
}
