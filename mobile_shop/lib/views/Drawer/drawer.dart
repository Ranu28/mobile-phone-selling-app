import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/utils/functions.dart';
import 'package:mobile_shop/views/favoriteScreen/favorite.dart';
import 'package:mobile_shop/views/home_screen/home_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
              ),
              accountName: Text("Name"),
              accountEmail: Text("Email")),
          ListTile(
            onTap: () {
              UtillFunctions.pushRemoveNavigation(context, HomeScreen());
            },
            title: Text("Home"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () {
              UtillFunctions().navigateRoute(context, FavoriteScreen());
            },
            title: Text("Favoite items"),
            leading: Icon(Icons.favorite),
          ),
          ListTile(
            title: Text("You Cart"),
            leading: Icon(Icons.shopping_cart),
          ),
          ListTile(
            title: Text("My Profile"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("Sign Out"),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
