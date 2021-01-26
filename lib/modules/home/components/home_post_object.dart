class HomePostObj {
  bool success;
  Result result;

  HomePostObj({this.success, this.result});

  HomePostObj.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
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

class Result {
  String currentPage;
  List<HomePostData> data;
  String firstPageUrl;
  String nextPageUrl;

  Result(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.nextPageUrl,
      });

  Result.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'].toString();
    if (json['data'] != null) {
      data = new List<HomePostData>();
      json['data'].forEach((v) {
        data.add(new HomePostData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    nextPageUrl = json['next_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    return data;
  }
}

class HomePostData {
  int id;
  String categoryId;
  String userId;
  String title;
  String image;
  String description;
  String createdAt;
  String updatedAt;
  Category category;
  User user;

  HomePostData(
      {this.id,
        this.categoryId,
        this.userId,
        this.title,
        this.image,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.user});

  HomePostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  Category({this.id, this.name, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int id;
  String name;
  String image;
  String email;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
