import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';

final _rowHeight = 200.0;

class Category extends StatelessWidget {
  final int value;

  const Category({
    Key key,
    @required this.value,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
                Center(
                    child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/id/$value/400/300',
                )),
              ],
            )),
      ),
    );
  }
}
