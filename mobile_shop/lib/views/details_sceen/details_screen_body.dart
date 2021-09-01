import 'package:flutter/material.dart';
import 'package:mobile_shop/model/phone_model.dart';
import 'package:mobile_shop/utils/constants.dart';
import 'package:mobile_shop/views/details_sceen/details_body_bottom.dart';

class DetailsBody extends StatefulWidget {
  final PhoneModel phoneModel;
  const DetailsBody({Key? key, required this.phoneModel}) : super(key: key);

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: size.width,
            decoration: BoxDecoration(color: widget.phoneModel.color),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Branded Phones",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                Text(
                  "${widget.phoneModel.name}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.height / 25),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: size.width / 2.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Rs.${widget.phoneModel.price}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height / 35),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height / 5,
                        width: size.width / 2,
                        child: Image.asset(
                            "${Constants.Image_PATH}${widget.phoneModel.imageName}"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height / 1.73,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: DetailsBodyBottom(
              phoneModel: widget.phoneModel,
            ),
          )
        ],
      ),
    );
  }
}
