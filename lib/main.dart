import 'package:flutter/material.dart';
import 'package:test_app/category_route.dart';

/// The function that is called when main.dart is run.
void main() {
  runApp(InfiniteList());
}

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinite Scroll',
      home: InfiniteScrollListView(),
    );
  }
}
