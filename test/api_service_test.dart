import 'package:scrap/models/post.dart';
import 'package:scrap/models/user.dart';
import 'package:scrap/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Posts', () {
    test('Should return 10 posts', () async {
      List<Post> posts = await APIService().fetchPosts();

      expect(posts.length, 10);
    });

    test('Should return first 5 posts and 10 posts in serial', () async {
      List<Post> fivePosts = await APIService().fetchPosts(length: 5);
      List<Post> tenPosts =
          await APIService().fetchPosts(startIndex: 5, length: 10);

      for (int i = 0; i < 5; i++) {
        expect(fivePosts[i].id, i + 1);
      }
      for (int i = 0; i < 10; i++) {
        expect(tenPosts[i].id, i + 6);
      }
    });

    test('Should return just one post that id is 1', () async {
      List<Post> posts = await APIService().fetchPosts(id: 1);

      expect(posts.length, 1);
      expect(posts[0].id, 1);
    });

    test('Should return posts that userId is 1', () async {
      List<Post> posts = await APIService().fetchPosts(userId: 1);

      for (final post in posts) {
        expect(post.userId, 1);
      }
    });
  });

  group('Users', () {
    test('Should return a user that id is 1', () async {
      List<User> users = await APIService().fetchUsers(id: 1);

      expect(users[0].id, 1);
    });

    test('Should return list of users', () async {
      List<User> users = await APIService().fetchUsers();

      expect(users.isNotEmpty, true);
    });
  });
}
