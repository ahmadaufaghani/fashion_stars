class UserModel{
  int? id;
  String? username;
  String? email;
  String? token;

  UserModel({this.id, this.username, this.email, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'username' : username,
      'email' : email,
      'token' : token
    };
  }
}