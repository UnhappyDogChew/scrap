import 'package:scrap/models/post.dart';
import 'package:scrap/models/user.dart';
import 'package:scrap/services/api_service.dart';

class DataService {
  DataService._();
  static final DataService _instance = DataService._();

  factory DataService() {
    return _instance;
  }

  List<Post> posts = [];
  Map<int, User> users = {};

  Future<int> fetchPosts() async {
    List<Post> newPosts =
        await APIService().fetchPosts(startIndex: posts.length);

    posts.addAll(newPosts);

    for (final post in newPosts) {
      List<User> newUsers = await APIService().fetchUsers(id: post.userId);

      users[newUsers[0].id] = newUsers[0];
    }

    return newPosts.length;
  }
}
