import 'package:flutter/material.dart';
import 'package:hello_flutter/application.dart';
import 'package:hello_flutter/network/response/items/GroupItem.dart';
import 'package:hello_flutter/ui/screens/photo_viewer.dart';

class GroupDetailPage extends StatefulWidget {
  GroupItem group;

  GroupDetailPage(this.group);

  @override
  State<StatefulWidget> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext c) {
    return new Scaffold(
      appBar: AppBar(
         title: Text(widget.group.name)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
             onTap: () =>
                startPage(c, PhotoViewer(widget.group.avatarPath())),
             child: Container(
                color: Colors.red[200],
                width: double.maxFinite,
                height: 200.0,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network("${widget.group.avatarPath()}_b.jpg",
                    alignment: Alignment.center,
                  ),
                )
             )
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Название: ${widget.group.name}",
              style: TextStyle(
                 fontSize: 24.0,
                 color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(widget.group.categoryName,
              style: TextStyle(fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Подписчиков: ${widget.group.subscribersCount}",
              style: TextStyle(fontSize: 16.0,
              ),
            ),
          ),
          ],
        ),
    );
  }
}
