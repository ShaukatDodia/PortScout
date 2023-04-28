class RepoModel {
  DateTime createdAt;
  String fullName;
  String name;
  String language;
  String owner;
  String stargazers;
  String url;

  RepoModel({
    required this.createdAt,
    required this.fullName,
    required this.name,
    required this.language,
    required this.owner,
    required this.stargazers,
    required this.url,
  });
}
