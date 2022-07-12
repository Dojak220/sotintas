import 'package:flutter/material.dart';

class SoTintasLogo extends StatelessWidget {
  const SoTintasLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.brush),
        Text("SóTintas"),
      ],
    );
  }
}