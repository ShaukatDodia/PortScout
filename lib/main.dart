import 'package:flutter/material.dart';
import 'package:portscout/screens/onboard_screen/onboard_screen.dart';
import 'package:portscout/services/user_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  UserData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PortScout App',
      home: const Scaffold(
        backgroundColor: Color.fromRGBO(108, 122, 137, 0.3),
        body: OnboardScreen(),
      ),
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
