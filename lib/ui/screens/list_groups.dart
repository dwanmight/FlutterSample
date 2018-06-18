import 'package:flutter/material.dart';
import 'package:hello_flutter/application.dart';
import 'package:hello_flutter/network/networkApi.dart';
import 'package:hello_flutter/network/networkClient.dart';
import 'package:hello_flutter/network/response/items/GroupItem.dart';
import 'package:hello_flutter/ui/screens/group_detail.dart';

class SecondPage extends StatefulWidget {
  final NetworkClient network = MyApp.getNetworkClient();
  final NetworkApi api = MyApp.getNetworkApi();


  @override
  State<StatefulWidget> createState() => SecondPageState();
}



class SecondPageState extends State<SecondPage> {
  List<GroupItem> groups = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
      ),
      body: _buildListView(),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.network.load(widget.api.getGroups())
        .then((response) => response['groups'])
        .then((list) {
      for (var item in list) {
        groups.add(GroupItem.fromJson(item));
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  _buildListView() {
    return ListView.builder(
      itemBuilder: (context, i) {
        var item = groups[i];
        return InkWell(
          child: Dismissible(
            key: Key(item.groupId.toString()),
            background: Container(
              color: Colors.blue,
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 16.0),
              alignment: Alignment.centerRight,
              color: Colors.red[400],
              child: Icon(Icons.clear,
                color: Colors.black,),
            ),
            onDismissed: (dir) => groups.removeAt(i),
            child: ListTile(
              leading: CircleAvatar(
                 radius: 30.0,
                 child: _buildIcon(item)
              ),
              title: Text(item.name),
              onTap: () => startPage(context, GroupDetailPage(item)),
            ),
          ),
        );
      },
      itemCount: groups.length,
    );
  }

  _buildIcon(GroupItem item) {
    return _hasAvatar(item) ?
    Image.network("${item.avatarPath()}_p.jpg") :
    Icon(Icons.cloud_download);
  }

  bool _hasAvatar(GroupItem item) {
    return item.avatarPath() != null;
  }
}