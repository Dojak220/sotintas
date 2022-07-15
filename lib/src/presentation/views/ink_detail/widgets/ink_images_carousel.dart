import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/presentation/controllers/product_detail_controller.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/left_arrow.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/right_arrow.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class InkImagesCarousel extends StatefulWidget {
  final ProductDetailController controller;
  const InkImagesCarousel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<InkImagesCarousel> createState() => _InkImagesCarouselState();
}

class _InkImagesCarouselState extends State<InkImagesCarousel> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.8);

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Observer(
            builder: (context) => (widget.controller.isFetchingImages)
                ? const Center(child: CircularProgressIndicator())
                : widget.controller.productStore.productImageCount == 0
                    ? const Center(child: Text("Nada encontrado"))
                    : PageView.builder(
                        itemCount: widget.controller.productImageCount,
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
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
                                  widget.controller.productImages![i].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          ),
          LeftArrow(pageController: pageController),
          RightArrow(pageController: pageController),
        ],
      ),
    );
  }
}
