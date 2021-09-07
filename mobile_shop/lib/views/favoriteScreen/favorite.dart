import 'package:flutter/material.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:mobile_shop/views/Drawer/drawer.dart';
import 'package:mobile_shop/views/favoriteScreen/favorite_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppbar(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: size.height / 28),
          child: Consumer<ProductProvider>(
            builder: (context, value, child) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = value.getFavoitetems[index].name;
                    return Dismissible(
                      direction: DismissDirection.vertical,
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        value.setIsFav(value.getFavoitetems[index].id!);

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('$item removed from favorites')));
                      },
                      key: UniqueKey(),
                      // key: Key(index.toString()),
                      // key: Key(value.getFavoitetems[index].toString()) ,
                      child: FavoriteItem(
                        size: size,
                        model: value.getFavoitetems[index],
                      ),
                      background: Container(
                        color: Colors.redAccent.shade100,
                        child: Icon(Icons.delete),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 10,
                      ),
                  itemCount: value.getFavoitetems.length);
            },
          ),
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
