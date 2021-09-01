import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_shop/model/phone_model.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:mobile_shop/views/home_screen/components/grid_tile_widget.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Container(
          // margin: EdgeInsets.only(top: size.height / 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white24,
          child: GridView.builder(
              itemCount: value.getPhoneMdel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return GridTileWidget(
                  size: size,
                  // phoneModel: value.setPhoneModel(index),
                  phoneModel: value.getPhoneMdel[index], index: index,
                );
              }),
        );
      },
    );
  }
}
