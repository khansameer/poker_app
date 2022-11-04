class LoginModel {
  bool? success;
  Data? data;
  String? message;

  LoginModel({this.success, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  int? currentTeamId;
  String? manager;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? profilePhotoUrl;

  Data(
      {this.id,
        this.name,
        this.email,
        this.currentTeamId,
        this.manager,
        this.createdAt,
        this.updatedAt,
        this.accessToken,
        this.profilePhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    currentTeamId = json['current_team_id'];
    manager = json['manager'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['current_team_id'] = this.currentTeamId;
    data['manager'] = this.manager;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['access_token'] = this.accessToken;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
