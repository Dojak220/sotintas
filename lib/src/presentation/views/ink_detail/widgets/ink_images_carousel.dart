import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/left_arrow.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/right_arrow.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class InkImagesCarousel extends StatefulWidget {
  final PageController pageController;
  const InkImagesCarousel({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<InkImagesCarousel> createState() => _InkImagesCarouselState();
}

class _InkImagesCarouselState extends State<InkImagesCarousel> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 10,
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: CustomColors.darkGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://picsum.photos/400",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          LeftArrow(pageController: widget.pageController),
          RightArrow(pageController: widget.pageController),
        ],
      ),
    );
  }
}
