import 'package:flutter/material.dart';
import 'package:hello_flutter/network/response/items/GroupItem.dart';

class GroupDetailPage extends StatefulWidget {
  GroupItem group;

  GroupDetailPage(this.group);

  @override
  State<StatefulWidget> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
         title: Text(widget.group.name)
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, top: 24.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Image.network("${widget.group.avatarPath()}_p.jpg",
                alignment: Alignment.center,
              ),
            ),
            Text(widget.group.name,
              style: TextStyle(fontSize: 24.0,
              ),
            ),
            Text(widget.group.categoryName,),
            Text("Подписчиков :${widget.group.subscribersCount}",),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}