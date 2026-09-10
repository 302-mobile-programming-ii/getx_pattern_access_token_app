class CategoryRequest {
  CategoryRequest({
      this.id, 
      this.name, 
      this.imageUrl, 
      this.status,});

  CategoryRequest.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? imageUrl;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    map['status'] = status;
    return map;
  }

}