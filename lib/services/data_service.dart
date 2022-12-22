import 'package:scrap/models/post.dart';
import 'package:scrap/models/user.dart';

class DataService {
  DataService._() {
    _posts[1] = Post(
        userId: 1,
        id: 1,
        title: 'Say Hello to the World with Flutter App',
        body:
            'hello world! hello world! hello world! hello world! hello world! hello world! hello world!');
    _posts[2] =
        Post(userId: 1, id: 2, title: 'Flutter', body: 'hello flutter!');
    _posts[3] = Post(userId: 1, id: 3, title: 'Scrap', body: 'hello scrap!');

    _users[1] = User(
      id: 1,
      username: 'Holand',
      name: 'Tom',
      email: 'tom@gmail.com',
      address: Address(
          city: 'suwon',
          street: 'yeongtong',
          suite: 'bandal',
          zipcode: '35359'),
      phone: '010-6376-7501',
      website: 'tom.github.io',
      company: 'kyeonghee',
    );
  }
  static final DataService _instance = DataService._();

  factory DataService() {
    return _instance;
  }

  Map<int, Post> _posts = Map();
  Map<int, User> _users = Map();

  List<Post> posts(int start, int length) {
    List<Post> result = [];
    for (final entry in _posts.entries.skip(start).take(length)) {
      result.add(entry.value);
    }
    return result;
  }

  User? userOfId(int id) {
    return _users[id];
  }
}
