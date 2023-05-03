import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:portscout/models/repo_model.dart';
import 'package:portscout/models/user_model.dart';
import 'package:portscout/screens/home_screen/repo_card.dart';
import 'package:portscout/screens/home_screen/user_card.dart';
import 'package:portscout/services/github_service.dart';
import 'package:portscout/services/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  get all repos
  List<RepoModel> repoModel = [];
  UserModel userModel = UserModel(
    name: '',
    login: '',
    avatarUrl: '',
    htmlUrl: '',
    bio: '',
    location: '',
    email: '',
    followers: '',
    following: '',
  );
  late GitHubFile readme = GitHubFile();
  String username = '';

  @override
  void initState() {
    // get username from shared prefs
    UserData.init();

    setState(() {
      username = UserData.getUserName() ?? '';
    });

    getReadme(username, username).then((value) {
      setState(() {
        readme = value;
      });
    });

    getAllRepos(username).then((value) {
      setState(() {
        repoModel = value;
      });
    });

    getUser(username).then((value) {
      setState(() {
        userModel = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PortScout'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: UserCard(
              userModel: userModel,
              // profileMarkdown: readme.text,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return RepoCard(repoModel: repoModel[index]);
              },
              childCount: repoModel.length,
            ),
          ),
        ],
      ),
    );
  }
}
