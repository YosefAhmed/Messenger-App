class UserModel {
  int id;
  String username;
  // String photo;
  UserModel(dynamic obj) {
    id = obj['user_id'];
    username = obj['username'];
  }

  UserModel.fromMap(Map<String, dynamic> data) {
    id = data['user_id'];
    username = data['username'];
  }

  Map<String, dynamic> toMap() => {
        'user_id': id,
        'username': username,
      };

  int get _id => id;
  String get _username => username;
}
