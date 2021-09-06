import 'package:flutter/material.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:mobile_shop/views/details_sceen/details_body_bottom.dart';
import 'package:provider/provider.dart';

class Descrpition extends StatelessWidget {
  const Descrpition({
    Key? key,
    required this.size,
    required this.widget,
  }) : super(key: key);

  final Size size;
  final DetailsBodyBottom widget;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Container(
          height: size.height / 9,
          margin: EdgeInsets.only(
            top: size.height / 25,
          ),
          child: SingleChildScrollView(
            child: Text("${value.singleProdunt.description}"),
          ),
        );
      },
    );
  }
}
