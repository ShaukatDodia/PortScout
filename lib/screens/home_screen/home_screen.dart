import 'package:flutter/material.dart';
import 'package:portscout/models/repo_model.dart';
import 'package:portscout/screens/home_screen/repo_card.dart';
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
  String username = '';

  @override
  void initState() {
    // get username from shared prefs
    UserData.init();

    setState(() {
      username = UserData.getUserName() ?? '';
    });

    getAllRepos(username).then((value) {
      setState(() {
        repoModel = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PortScout'),
      ),
      // make a repo card for every user repo
      body: ListView.builder(
        itemCount: repoModel.length,
        itemBuilder: (context, index) {
          return RepoCard(repoModel: repoModel[index]);
        },
      ),
    );
  }
}
