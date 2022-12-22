import 'package:flutter/material.dart';

class ScrapPage extends StatefulWidget {
  const ScrapPage({super.key});

  @override
  State<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends State<ScrapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Child Page'),
    );
  }
}
