import 'package:flutter/material.dart';
import 'package:hello_flutter/network/networkApi.dart';
import 'package:hello_flutter/network/networkClient.dart';

import 'ui/screens/first.dart';

class MyApp extends StatelessWidget {
  static NetworkClient _networkClient = NetworkClient();
  static NetworkApi _networkApi = NetworkApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage());
  }

  static getNetworkClient() => _networkClient;

  static NetworkApi getNetworkApi() => _networkApi;

}

startPage(BuildContext context, StatefulWidget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}