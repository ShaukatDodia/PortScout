class UserModel {
  String? name;
  String? login;
  String? avatarUrl;
  String? bio;
  String? location;
  String? email;
  String followers;
  String following;

  UserModel({
    required this.name,
    required this.login,
    required this.avatarUrl,
    required this.bio,
    required this.location,
    required this.email,
    required this.followers,
    required this.following,
  });
}
