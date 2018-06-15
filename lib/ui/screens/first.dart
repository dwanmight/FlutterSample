import 'package:flutter/material.dart';
import 'package:hello_flutter/application.dart';
import 'package:hello_flutter/ui/screens/second.dart';

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
              child: Text("First Page"),
            )),
        body: Center(
            child: FlatButton(
              child: Text("click to next page1"),
              onPressed: _clickNextPage,
            )));
  }

  _clickNextPage() {
    startPage(context, SecondPage());
  }
}