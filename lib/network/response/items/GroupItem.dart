import 'ImageItem.dart';

class GroupItem {
  int groupId;
  int adminId;

  String name;

  int categoryId;
  String categoryName;

  String url;

  int subscribersCount;
  bool subscribed;

  ImageItem _avatar;

  GroupItem.fromJson(Map<String, dynamic> json)

     :groupId = json["group_id"],
       adminId = json["admin_id"],
       name=json["name"],
       categoryId=json["category_id"],
       categoryName=json["category_name"],
       url=json["url"],
       subscribersCount=json["subscribers_count"],
       subscribed=json["subscribed"],
       _avatar=_hasAvatar(json) ?
       ImageItem.fromJson(json["avatar"]) :
       null;

  static bool _hasAvatar(json) {
    return json["avatar"] != null;
  }

  String avatarPath() {
    if (_avatar != null && _avatar.path != null) {
      return _avatar.path;
    }
    return null;
  }

}