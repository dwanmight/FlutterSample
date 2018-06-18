class Request {
  String _path;
  Map<String, String> _params = Map();


  /**
   * @param path - path without slash like ("example")
   * @param additionalParams = map with request params <String,String>
   */
  Request(String path, Map<String, String> additionalParams) {
    _params.putIfAbsent("api_token", () => "ilya");
    _path = "/api/v2/test/" + path;

    if (additionalParams != null) {
      _params.addAll(additionalParams);
    }
  }

  String path() => _path;

  Map<String, String> params() => _params;

}