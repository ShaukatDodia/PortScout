import 'package:flutter/material.dart';
import 'package:portscout/models/firebase_user_model.dart';
import 'package:portscout/services/firebase_service.dart';
import 'package:portscout/services/user_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _softSkillsController = TextEditingController();
  final TextEditingController _hardSkillsController = TextEditingController();
  final TextEditingController _socialsController = TextEditingController();
  String username = '';
  List _softSkills = [];
  List _hardSkills = [];
  List _socials = [];
  dynamic userDocument;

  @override
  void initState() {
    // get username from shared prefs
    UserData.init();
    username = UserData.getUserName() ?? '';

    userDocument = getUserDocument(username).then((value) {
      setState(() {
        userDocument = value;
        _softSkills = userDocument['softSkills'];
        _hardSkills = userDocument['hardSkills'];
        _socials = userDocument['socials'];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // add/modify user details to store in firestore using firebase_user_model
    // details to be added/modified:
    // list of soft skills
    // list of hard skills
    // list of socials
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(108, 122, 137, 0.3),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 32.0),
              Text("Soft Skills: $_softSkills"),
              const SizedBox(height: 16.0),
              Text("Hard Skills: $_hardSkills"),
              const SizedBox(height: 16.0),
              Text("Socials: $_socials"),
              const SizedBox(height: 16.0),
              const Text(
                'Enter your skills and socials',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              TextField(
                controller: _softSkillsController,
                decoration: InputDecoration(
                  labelText: 'Soft Skills',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (value) {
                  setState(() {
                    _softSkills.add(value);
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _hardSkillsController,
                decoration: InputDecoration(
                  labelText: 'Hard Skills',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (value) {
                  setState(() {
                    _hardSkills.add(value);
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _socialsController,
                decoration: InputDecoration(
                  labelText: 'Socials',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (value) {
                  setState(() {
                    _socials.add(value);
                  });
                },
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _softSkills.clear();
                      _hardSkills.clear();
                      _socials.clear();

                      FirebaseUserModel user = FirebaseUserModel(
                        username: username,
                        softSkills: _softSkills.toSet().toList(),
                        hardSkills: _hardSkills.toSet().toList(),
                        socials: _socials.toSet().toList(),
                      );
                      updateUser(user);
                    },
                    child: const Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseUserModel user = FirebaseUserModel(
                        username: username,
                        softSkills: _softSkills.toSet().toList(),
                        hardSkills: _hardSkills.toSet().toList(),
                        socials: _socials.toSet().toList(),
                      );
                      updateUser(user);
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
