import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key? key,
    required this.size,
    required this.urlImage,
  }) : super(key: key);

  final Size size;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: size.width / 10,
        child: Image.network(urlImage),
      ),
    );
  }
}
