import 'package:flutter/material.dart';
import 'package:scrap/models/post.dart';
import 'package:scrap/pages/explore_page.dart';
import 'package:scrap/pages/post_page.dart';
import 'package:scrap/pages/profile_page.dart';
import 'package:scrap/pages/scrap_page.dart';
import 'package:scrap/pages/search_page.dart';
import 'package:scrap/services/data_service.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/post': (context) => PostPage(),
      '/profile': (context) => ProfilePage(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> _pages;

  int _selectedIndex = 1;

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      SearchPage(),
      ExplorePage(),
      ScrapPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scrap',
          style: TextStyle(
            fontSize: 32.0,
            fontFamily: 'Nanum Myeongjo',
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapHandler,
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        selectedItemColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'My Scrap',
          ),
        ],
      ),
    );
  }
}
