import 'Api.dart';
import 'request.dart';

class NetworkApi extends Api {

  @override getGroups() {
    return new Request("groups", null);
  }
}