// class LoginObj {
//   bool success;
//   String token;
//   Result result;
//
//   LoginObj({this.success, this.token, this.result});
//
//   LoginObj.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     token = json['token'];
//     result =
//     json['result'] != null ? new Result.fromJson(json['result']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['token'] = this.token;
//     if (this.result != null) {
//       data['result'] = this.result.toJson();
//     }
//     return data;
//   }
// }
//
// class Result {
//   int id;
//   String name;
//   String image;
//   String email;
//   Null emailVerifiedAt;
//   String createdAt;
//   String updatedAt;
//
//   Result(
//       {this.id,
//         this.name,
//         this.image,
//         this.email,
//         this.emailVerifiedAt,
//         this.createdAt,
//         this.updatedAt});
//
//   Result.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
