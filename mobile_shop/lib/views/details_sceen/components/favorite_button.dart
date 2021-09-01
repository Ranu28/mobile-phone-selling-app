import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:provider/provider.dart';

class FavotiteButton extends StatelessWidget {
  const FavotiteButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, value, child) {
      return InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          height: size.width / 15,
          width: size.width / 15,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: SvgPicture.asset(
            '${Constants.Icon_PATH}heart.svg',
            color: Colors.white,
            fit: BoxFit.fill,
            height: size.width / 30,
            width: size.width / 30,
          ),
        ),
      );
    });
  }
}
