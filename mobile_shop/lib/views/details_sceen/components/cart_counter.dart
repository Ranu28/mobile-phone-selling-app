import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (itemCount > 1) {
              setState(() {
                itemCount--;
              });
            }
          },
          child: Container(
            child: Icon(Icons.remove),
            alignment: Alignment.center,
            width: size.width / 10,
            height: size.height / 26,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(13)),
          ),
        ),
        Container(
          child: Text(
            itemCount.toString().padLeft(2, '0'),
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: size.width / 8,
          height: size.height / 26,
        ),
        InkWell(
          onTap: () {
            setState(() {
              itemCount++;
            });
          },
          child: Container(
            child: Icon(Icons.add),
            alignment: Alignment.center,
            width: size.width / 10,
            height: size.height / 26,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(13)),
          ),
        ),
      ],
    );
  }
}
