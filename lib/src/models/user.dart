class User {
  final String id;
  final String name;
  final String email;
  final String token;

  User({this.id, this.name, this.email, this.token});

  User.fromJson(Map<String, dynamic> user)
    : this.id = user['_id'],
      this.name = user['name'],
      this.email = user['email'],
      this.token = user['token'];
}