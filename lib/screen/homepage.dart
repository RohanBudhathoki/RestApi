import 'package:flutter/material.dart';
import 'package:restapiapp/common/postcard.dart';
import 'package:restapiapp/services/remote_services.dart';
import '../model/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Visibility(
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: PostCard()));
  }
}
