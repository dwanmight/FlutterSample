import 'package:flutter/material.dart';
import 'package:hello_flutter/application.dart';
import 'package:hello_flutter/network/networkApi.dart';
import 'package:hello_flutter/network/networkClient.dart';

class SecondPage extends StatefulWidget {
  final NetworkClient network = MyApp.getNetworkClient();
  final NetworkApi api = MyApp.getNetworkApi();


  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  var groups = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text("Start Sample"),
            )),
        body: _buildListView());
  }

  @override
  void initState() {
    super.initState();
    widget.network.load(widget.api.getGroups())
        .then((response) => response['groups'])
        .then((list) {
      groups.addAll(list);
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  _buildListView() {
    return ListView.builder(
      itemBuilder: (context, i) {
        return FlatButton(
          child: Text(_getTextForItem(i)),
          onPressed: () {
            _clickItem;
            setState(() {});
          },
        );
      },
      itemCount: groups.length,
    );
  }

  _clickItem() {}

  _getTextForItem(index) {
    var item = groups[index];
    return item["name"];
  }
}