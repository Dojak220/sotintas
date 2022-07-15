import 'package:flutter/material.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/controllers/product_detail_controller.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/ink_detail_quality_list.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/ink_images_carousel.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/support_buttons_row.dart';
import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';
import 'package:sotintas/src/utils/class_helpers/quality.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetailController controller;
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

  static const routeName = "ink_detail_screen";

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    widget.controller.getQualities(widget.product.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Opções de tintas"),
      body: Column(
        children: [
        ],
      ),
    );
  }
}

class InkDetailHeader extends StatelessWidget {
  final String title;
  const InkDetailHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}

class InkDetailBody extends StatefulWidget {
  final String productId;
  final ProductDetailController controller;
  const InkDetailBody({
    Key? key,
    required this.productId,
    required this.controller,
  }) : super(key: key);

  @override
  State<InkDetailBody> createState() => _InkDetailBodyState();
}

class _InkDetailBodyState extends State<InkDetailBody> {
  final _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkImagesCarousel(pageController: _pageController),
        const SupportButtonsRow(),
        InkDetailQualityList(
          productId: widget.productId,
          controller: widget.controller,
        ),
      ],
    );
  }
}

class InkDetailFooter extends StatelessWidget {
  const InkDetailFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text("Adicionar ao carrinho"),
    );
  }
}
