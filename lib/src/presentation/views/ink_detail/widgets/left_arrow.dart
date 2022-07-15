import 'package:flutter/material.dart';

class LeftArrow extends StatelessWidget {
  final PageController pageController;
  const LeftArrow({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 40,
      top: 80,
      child: IconButton(
        icon: const Icon(Icons.arrow_circle_left, size: 30),
        onPressed: () {
          pageController.animateToPage(pageController.page!.toInt() - 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}
