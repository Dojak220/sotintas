
import 'package:flutter/material.dart';

class LeftArrow extends StatelessWidget {
  const LeftArrow({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 40,
      top: 80,
      child: IconButton(
        icon: const Icon(Icons.arrow_circle_left, size: 30),
        onPressed: () {
          _pageController.animateToPage(_pageController.page!.toInt() - 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}