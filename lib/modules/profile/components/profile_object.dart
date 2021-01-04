class ProfileResponseObj {
  bool success;
  ProfileObj result;

  ProfileResponseObj({this.success, this.result});

  ProfileResponseObj.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
    json['result'] != null ? new ProfileObj.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class ProfileObj {
  int id;
  String name;
  String image;
  String email;
  String createdAt;
  String updatedAt;

  ProfileObj(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.createdAt,
        this.updatedAt});

  ProfileObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
