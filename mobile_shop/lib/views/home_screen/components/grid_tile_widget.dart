import 'package:flutter/material.dart';
import 'package:mobile_shop/model/phone_model.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/views/details_sceen/detail_screen.dart';
import 'package:provider/provider.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({
    Key? key,
    required this.phoneModel,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final PhoneModel phoneModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: InkWell(
        onTap: () {
          Provider.of<ProductProvider>(context, listen: false)
              .setSingleProduct(phoneModel);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        phoneModel: phoneModel,
                      )));
        },
        child: Container(
          padding: EdgeInsets.all(size.width / 20),
          child: Image.asset('${Constants.Image_PATH}${phoneModel.imageName}'),
          width: size.width / 3,
          height: size.height / 5,
          decoration: BoxDecoration(
              color: phoneModel.color, borderRadius: BorderRadius.circular(25)),
        ),
      ),
      footer: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${phoneModel.name}',
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs ${phoneModel.price}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Consumer<ProductProvider>(builder: (context, value, child) {
                return IconButton(
                  onPressed: () {
                    // value.setIsFav(phoneModel.id);
                    value.setIsFav(index);
                  },
                  icon: Icon(
                    phoneModel.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                );
              })
            ],
          ),
        )
      ]),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
