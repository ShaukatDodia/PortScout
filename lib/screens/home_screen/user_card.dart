import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:portscout/models/user_model.dart';
import 'package:portscout/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:portscout/screens/home_screen/firebase_user_card.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:dart_markdown/dart_markdown.dart' hide Text;
// ignore: import_of_legacy_library_into_null_safe
// import 'package:libv_markdown/libv_markdown.dart';
import 'package:portscout/models/firebase_user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel userModel;
  // final String? profileMarkdown;

  const UserCard({
    Key? key,
    required this.userModel,
    // this.profileMarkdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String md = profileMarkdown ?? '';

    // final markdown = Markdown(
    //   enableSubscript: true,
    //   enableSuperscript: true,
    //   enableHighlight: true,
    // );

    // final nodes = markdown.parse(md);

    // final html = nodes.toHtml();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  userModel.avatarUrl ?? '',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 8),
              userModel.bio != null && userModel.bio != ''
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.format_quote_outlined,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Flexible(
                            child: Text(
                              userModel.bio ?? 'No bio',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.format_quote_outlined,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userModel.name != null && userModel.name != ''
                      ? Text(
                          userModel.name ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(width: 4),
                  if (userModel.name != null && userModel.name != '')
                    const Text('|', style: TextStyle(color: Colors.grey)),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      launchUrl(
                        Uri.parse(userModel.htmlUrl ?? ''),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Text(
                      '@' '${userModel.login}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              userModel.email != null && userModel.email != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          OctIcons.mail_16,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          userModel.email ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : const SizedBox(height: 8),
              userModel.location != null && userModel.location != ''
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            OctIcons.location_16,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            userModel.location ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      OctIcons.people_16,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      userModel.followers.toString() +
                          ' followers' +
                          ' • ' +
                          userModel.following.toString() +
                          ' following',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(double.infinity, 40.0)),
                child: const Text('Edit profile'),
              ),
              const SizedBox(height: 8),
              const FirebaseUserCard(),
              const SizedBox(height: 16),
              // //  render special repository (readme) for user
              // html.isNotEmpty
              //     // ? SingleChildScrollView(
              //     //     child: ClipRRect(
              //     //       borderRadius: BorderRadius.circular(10.0),
              //     //       child: HtmlContentViewer(
              //     //         htmlContent: html,
              //     //       ),
              //     //     ),
              //     //   )
              //     ? SingleChildScrollView(
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(10.0),
              //           child: MarkdownView(
              //             markdownViewHTML: profileMarkdown,
              //             loadingWidget: const Center(
              //               child: CircularProgressIndicator(),
              //             ),
              //           ),
              //         ),
              //       )
              //     : const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
