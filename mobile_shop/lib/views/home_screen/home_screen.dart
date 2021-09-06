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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: HomeBody(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Home"),
            )
          ],
        ),
      ),
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
      backgroundColor: Colors.amber,
      shadowColor: Colors.white,
    );
  }
}
