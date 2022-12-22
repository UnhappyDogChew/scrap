import 'dart:developer';

import 'package:scrap/models/post.dart';
import 'package:scrap/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  APIService._();
  static final APIService _instance = APIService._();

  factory APIService() {
    return _instance;
  }

  static const String siteUrl = 'jsonplaceholder.typicode.com';
  static const int fetchLength = 10;
  static const int retryMax = 50;

  Future<List<Post>> fetchPosts({
    int? id,
    int? userId,
    String? title,
    int startIndex = 0,
    int length = fetchLength,
  }) async {
    // fill query parameters
    Map<String, dynamic> queryParameters = {};
    if (id != null) {
      queryParameters['id'] = '$id';
    }
    if (userId != null) {
      queryParameters['userId'] = '$userId';
    }
    if (title != null) {
      queryParameters['title'] = title;
    }
    var url = Uri.https(siteUrl, 'posts', queryParameters);
    var retryCount = 0;

    while (true) {
      try {
        var response = await http.get(url);

        List<dynamic> json = jsonDecode(response.body);
        var datas = json.skip(startIndex).take(length);

        List<Post> result = [];
        for (final data in datas) {
          var post = Post(
            id: data['id'],
            userId: data['userId'],
            title: data['title'],
            body: data['body'],
          );
          result.add(post);
        }
        return result;
      } catch (e) {
        log('$e');
        if (retryCount > retryMax) {
          break;
        }
        retryCount += 1;
      }
    }

    return [];
  }

  Future<List<User>> fetchUsers({
    int? id,
    String? username,
  }) async {
    // fill query parameters
    Map<String, dynamic> queryParameters = {};
    if (id != null) {
      queryParameters['id'] = '$id';
    }
    if (username != null) {
      queryParameters['username'] = username;
    }
    var url = Uri.https(siteUrl, 'users', queryParameters);
    var retryCount = 0;

    while (true) {
      try {
        var response = await http.get(url);

        List<dynamic> json = jsonDecode(response.body);

        List<User> result = [];
        for (final data in json) {
          var user = User(
            id: data['id'],
            name: data['name'],
            username: data['username'],
            email: data['email'],
            address: Address(
              street: data['address']['street'],
              suite: data['address']['suite'],
              city: data['address']['city'],
              zipcode: data['address']['zipcode'],
            ),
            phone: data['phone'],
            website: data['website'],
            company: data['company']['name'],
          );
          result.add(user);
        }
        return result;
      } catch (e) {
        log('$e');
        if (retryCount > retryMax) {
          break;
        }
        retryCount += 1;
      }
    }

    return [];
  }
}
