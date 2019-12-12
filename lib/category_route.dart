import 'package:flutter/material.dart';

import 'package:test_app/category.dart';

final _backgroundColor = Colors.blue[100];

class InfiniteScrollListView extends StatefulWidget {
  CategoryScreen createState() => CategoryScreen();
}

class CategoryScreen extends State<InfiniteScrollListView> {
  ScrollController scrollController = ScrollController();
  int value = 0;

  var categories = <Category>[];
  @override
  void initState() {
    super.initState();
    addItems();
    scrollController.addListener(_scrollListener);
  }

  initializeItems() {
    for (int index = categories.length; index < value + 5; index++) {
      categories.add(Category(
        value: index,
      ));
    }
  }

  addItems() {
    setState(() {
      value = categories.length;
    });
    print('Now the value is $value');
    initializeItems();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print('Reached end');
      addItems();
    }
  }

  Widget _buildCategory(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
      controller: scrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.all(10.0),
      child: _buildCategory(categories),
    );

    final appBar = AppBar(
      elevation: 5.0,
      title: Text(
        'Infinite List',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
