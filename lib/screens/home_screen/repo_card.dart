import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:portscout/models/repo_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({Key? key, required this.repoModel}) : super(key: key);
  final RepoModel repoModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    repoModel.owner.avatarUrl,
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    launchUrl(
                      Uri.parse(repoModel.owner.htmlUrl),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    repoModel.owner.login,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(' / ', style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {
                    launchUrl(
                      Uri.parse(repoModel.url),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      repoModel.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            repoModel.description.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(repoModel.description),
                  )
                : const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  OctIcons.star_16,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(repoModel.stargazers),
                repoModel.language != null && repoModel.language!.isNotEmpty
                    ? Row(
                        children: [
                          const SizedBox(width: 8),
                          Icon(
                            OctIcons.globe_16,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(repoModel.language!),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 16),
            // license
            Row(
              children: [
                Icon(
                  OctIcons.law_16,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(repoModel.license!),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse(repoModel.url),
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const Text('View Repository'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
