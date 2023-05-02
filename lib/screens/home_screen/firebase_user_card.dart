import 'package:flutter/material.dart';
import 'package:portscout/services/firebase_service.dart';
import 'package:portscout/services/user_data.dart';
import 'package:url_launcher/url_launcher.dart';

class FirebaseUserCard extends StatefulWidget {
  const FirebaseUserCard({Key? key}) : super(key: key);

  @override
  State<FirebaseUserCard> createState() => _FirebaseUserCardState();
}

class _FirebaseUserCardState extends State<FirebaseUserCard> {
  String username = '';
  List softSkills = [];
  List hardSkills = [];
  List socials = [];
  dynamic userDocument;

  @override
  void initState() {
    // get username from shared prefs
    UserData.init();
    username = UserData.getUserName() ?? '';

    // get user details from firestore
    userDocument = getUserDocument(username).then((value) {
      setState(() {
        userDocument = value;
        softSkills = userDocument['softSkills'];
        hardSkills = userDocument['hardSkills'];
        socials = userDocument['socials'];
      });
    });

    print(userDocument);

    print(softSkills.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Soft Skills",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          if (softSkills.isEmpty) const Text("No soft skills added yet"),
          for (var skill in softSkills) Text("- $skill"),
          const SizedBox(height: 16),
          const Text(
            "Hard Skills",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          if (hardSkills.isEmpty) const Text("No hard skills added yet"),
          for (var skill in hardSkills) Text("- $skill"),
          const SizedBox(height: 16),
          const Text(
            "Socials",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          if (socials.isEmpty) const Text("No socials added yet"),
          for (var url in socials)
            GestureDetector(
              onTap: () {
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Text(
                url,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
