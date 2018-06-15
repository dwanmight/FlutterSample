class Request {
  String _path;
  Map<String, String> _params = Map();

  Request(this._path, additionalParams) {
    _params.putIfAbsent("api_token", () {
      return "ilya";
    });

    if (additionalParams != null) {
      _params.addAll(additionalParams);
    }
  }

  String path() => _path;

  Map<String, String> params() => _params;

}