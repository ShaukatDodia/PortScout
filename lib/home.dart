import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portscout/post.dart';
import 'wellcome.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Post>? posts;
  var isLoading = false;

  @override
  void initState() {
    super.initState();

//fetch data from api
    getData();
  }

  getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(src),
                  ),
                  title: const Text(
                    'shaukatabbas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.cyan,
                      fontFamily: 'monda',
                    ),
                  ),
                );
              }),
    );
  }
}
