import 'package:flutter/material.dart';

class YellowCircle extends StatelessWidget {
  const YellowCircle({
    Key? key,
    required this.sizeCircle,
    required this.colorCircle,
  }) : super(key: key);
  final double sizeCircle;
  final Color colorCircle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * sizeCircle,
      height: size.height * sizeCircle,
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [
          colorCircle,
          const Color.fromARGB(255, 255, 255, 255),
        ],
      )),
    );
  }
}
