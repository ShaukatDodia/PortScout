import 'package:github/github.dart';
import 'package:portscout/models/repo_model.dart';
import 'package:portscout/models/user_model.dart';

var github = GitHub(
  auth: Authentication.anonymous(),
);

Future<UserModel> getUser(String username) async {
  var user = await github.users.getUser(username);

  UserModel userModel = UserModel(
    name: user.name,
    login: user.login,
    avatarUrl: user.avatarUrl,
    bio: user.bio,
    location: user.location,
    email: user.email,
    followers: user.followersCount.toString(),
    following: user.followingCount.toString(),
  );

  return userModel;
}

Future<RepoModel> getRepo(String username, String repoName) async {
  var repo = await github.repositories.getRepository(
    RepositorySlug(username, repoName),
  );

  RepoModel repoModel = RepoModel(
    createdAt: DateTime.parse(repo.createdAt.toString()),
    fullName: repo.fullName,
    name: repo.name,
    language: repo.language,
    owner: repo.owner!.login,
    stargazers: repo.stargazersCount.toString(),
    url: repo.htmlUrl,
  );

  return repoModel;
}

Future<List<RepoModel>> getAllRepos(String username) async {
  List repos = [];
  List<RepoModel> repoModels = [];
  repos = await github.repositories.listUserRepositories(username).toList();

  for (var repo in repos) {
    RepoModel repoModel = RepoModel(
      createdAt: DateTime.parse(repo.createdAt.toString()),
      fullName: repo.fullName,
      name: repo.name,
      language: repo.language,
      owner: repo.owner!.login,
      stargazers: repo.stargazersCount.toString(),
      url: repo.htmlUrl,
    );
    repoModels.add(repoModel);
  }
  return repoModels;
}
