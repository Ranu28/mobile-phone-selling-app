import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/model/phone_model.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_shop/views/details_sceen/components/cart_counter.dart';
import 'package:mobile_shop/views/details_sceen/components/colordot.dart';
import 'package:mobile_shop/views/details_sceen/components/description.dart';
import 'package:mobile_shop/views/details_sceen/components/favorite_button.dart';

class DetailsBodyBottom extends StatefulWidget {
  final PhoneModel phoneModel;
  const DetailsBodyBottom({
    Key? key,
    required this.phoneModel,
  }) : super(key: key);

  @override
  _DetailsBodyBottomState createState() => _DetailsBodyBottomState();
}

class _DetailsBodyBottomState extends State<DetailsBodyBottom> {
  bool c1 = true, c2 = false, c3 = false;
  // Color themeColor = widget.phoneModel.color;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: size.height / 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color"),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              c1 = true;
                              c2 = false;
                              c3 = false;
                            });
                          },
                          child: ColorDot(
                            color: widget.phoneModel.color,
                            isSelected: c1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              c1 = false;
                              c2 = true;
                              c3 = false;
                            });
                          },
                          child: ColorDot(
                            color: widget.phoneModel.color1,
                            isSelected: c2,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              c1 = false;
                              c2 = false;
                              c3 = true;
                            });
                          },
                          child: ColorDot(
                            color: widget.phoneModel.color2,
                            isSelected: c3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width / 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Size"),
                    Text(
                      "${widget.phoneModel.phoneSize} cm",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Descrpition(size: size, widget: widget),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartCounter(),
                  FavotiteButton(size: size),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width / 7,
                  decoration: BoxDecoration(
                      border: Border.all(color: widget.phoneModel.color),
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      '${Constants.Icon_PATH}add_to_cart.svg',
                      color: widget.phoneModel.color,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width / 1.5,
                    height: size.width / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: widget.phoneModel.color),
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
