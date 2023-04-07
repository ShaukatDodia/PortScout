import 'package:flutter/material.dart';
import 'package:portscout/wellcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PortScout App',

      home: Scaffold(
        backgroundColor: Color.fromRGBO(108, 122, 137, 0.3),

        body: wlcm(),
      ),
    );
  }
}
