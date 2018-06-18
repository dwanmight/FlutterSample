class ImageItem {
  String id;
  String path;

  ImageItem.fromJson(Map<String, dynamic> json)
     :id=json["id"],
       path=json["path"];

}