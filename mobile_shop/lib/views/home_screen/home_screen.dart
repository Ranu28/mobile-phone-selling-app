import 'package:flutter/material.dart';

import 'components/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: HomeBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        "Mobile Shop",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
    );
  }
}
