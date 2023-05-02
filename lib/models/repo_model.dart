import 'package:github/github.dart';

class RepoModel {
  String? license;
  String fullName;
  String name;
  String description;
  String? language;
  UserInformation owner;
  String stargazers;
  String url;

  RepoModel({
    required this.license,
    required this.fullName,
    required this.name,
    required this.description,
    required this.language,
    required this.owner,
    required this.stargazers,
    required this.url,
  });
}
