import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/providers/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                value.decreaseAmount();
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
                '${value.amount.toString().padLeft(2, '0')}',
                // itemCount.toString().padLeft(2, '0'),
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: size.width / 8,
              height: size.height / 26,
            ),
            InkWell(
              onTap: () {
                value.increaseAmount();
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
      },
    );
  }
}
