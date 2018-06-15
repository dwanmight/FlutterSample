import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'request.dart';


const baseURL = "test.zonto.world/api/v2/";

class NetworkClient {
  var network = HttpClient();


  Future<dynamic> load(Request r) async {
    var uri=_getUri(r.path(), r.params());
    print("*******************************************************");
    print(uri);
    var request = await network.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    responseBody = _validateResponse(responseBody);
    var responseJson = json.decode(responseBody);
    return responseJson;
  }

  _getUri(path, params) {
    return baseURL.startsWith("test") ?
    Uri.http(baseURL, path, params) :
    Uri.https(baseURL, path, params);
  }

  String _validateResponse(String response) {
    var pattern = "</script>";
    if (response.contains(pattern)) {
      var index = response.lastIndexOf(pattern);
      response = response.substring(index + pattern.length);
    }
    return response;
  }
}