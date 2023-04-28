import 'package:flutter/material.dart';
import 'package:portscout/models/repo_model.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({Key? key, required this.repoModel}) : super(key: key);
  final RepoModel repoModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(repoModel.name),
          Text(repoModel.owner),
          Text(repoModel.language),
          Text(repoModel.stargazers),
          Text(repoModel.url),
          Text(repoModel.createdAt.toString()),
        ],
      ),
    );
  }
}
