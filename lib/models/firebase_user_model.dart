class FirebaseUserModel {
  String username = '';
  List softSkills = [];
  List hardSkills = [];
  List socials = [];

  FirebaseUserModel({
    required this.username,
    required this.softSkills,
    required this.hardSkills,
    required this.socials,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'softSkills': softSkills,
        'hardSkills': hardSkills,
        'socials': socials,
      };

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      username: json['username'],
      softSkills: json['softSkills'],
      hardSkills: json['hardSkills'],
      socials: json['socials'],
    );
  }
}
