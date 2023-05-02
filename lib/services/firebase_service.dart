import 'package:firebase_core/firebase_core.dart';
import 'package:portscout/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portscout/models/firebase_user_model.dart';

Future<void> init() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// create firestore instance
FirebaseFirestore firestore = FirebaseFirestore.instance;

// Create a reference to the users collection
CollectionReference users = FirebaseFirestore.instance.collection('users');

// Create a new user
// the schema for the user is defined in the firebase_user_model.dart file
// only add if the user does not exist
Future<void> createUser(
  FirebaseUserModel firebaseUser,
) {
  Map<String, dynamic> user = {
    "username": firebaseUser.username,
    "softSkills": firebaseUser.softSkills,
    "hardSkills": firebaseUser.hardSkills,
    "socials": firebaseUser.socials,
  };

  return users
      .doc(firebaseUser.username)
      .set(user)
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

// Create a query against the collection
Future<void> getUser(
  String username,
) {
  return users
      .where('username', isEqualTo: username)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc["username"]);
    });
  });
}

// Create a query against the collection to get a document
Future<DocumentSnapshot> getUserDocument(
  String username,
) {
  return users.doc(username).get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print('Document data: ${documentSnapshot.data()}');
      return documentSnapshot;
    } else {
      print('Document does not exist on the database');
      return documentSnapshot;
    }
  });
}

// Update a user
// create a new user if the user does not exist
Future<void> updateUser(
  FirebaseUserModel firebaseUser,
) {
  Map<String, dynamic> user = {
    "username": firebaseUser.username,
    "softSkills": firebaseUser.softSkills,
    "hardSkills": firebaseUser.hardSkills,
    "socials": firebaseUser.socials,
  };

  return users
      .doc(firebaseUser.username)
      .set(user)
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
