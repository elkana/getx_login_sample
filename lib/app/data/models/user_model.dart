class User {
  String? userId;
  String? pwd;
  bool? rememberMe;

  User({this.userId, this.pwd, this.rememberMe});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    pwd = json['pwd'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['pwd'] = pwd;
    data['rememberMe'] = rememberMe;
    return data;
  }

  @override
  String toString() =>
      'User(userId: $userId, pwd: $pwd, rememberMe: $rememberMe)';
}
