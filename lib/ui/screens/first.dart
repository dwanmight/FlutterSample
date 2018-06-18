import 'package:flutter/material.dart';
import 'package:hello_flutter/application.dart';
import 'package:hello_flutter/ui/screens/list_groups.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text("Demo"),
            )
        ),
        body: Center(
            child: FlatButton(
              child: Text("Start demo"),
              onPressed: _clickNextPage,
              color: Colors.red,
            )
        )
    );
  }

  _clickNextPage() {
    startPage(context, SecondPage());
  }
}