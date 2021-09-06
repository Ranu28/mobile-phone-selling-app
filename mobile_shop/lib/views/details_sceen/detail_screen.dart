import 'package:flutter/material.dart';
import 'package:mobile_shop/model/phone_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/views/details_sceen/details_screen_body.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  // final PhoneModel phoneModel;
  const DetailsScreen({
    Key? key,
    // required this.phoneModel,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                '${Constants.Icon_PATH}back.svg',
                color: Colors.white,
                // height: 5,
                // width: 7,
                // fit: BoxFit.fill,
              ),
            ),
            elevation: 0,
            backgroundColor: value.singleProdunt.color,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('${Constants.Icon_PATH}search.svg')),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('${Constants.Icon_PATH}cart.svg')),
            ]),
        body: DetailsBody(
            // phoneModel: widget.phoneModel,
            ),
      );
    });
  }
}
