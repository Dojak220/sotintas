import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/ink_detail_quality_list.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/ink_images_carousel.dart';
import 'package:sotintas/src/presentation/views/ink_detail/widgets/support_buttons_row.dart';
import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';
import 'package:sotintas/src/utils/class_helpers/quality.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class InkDetailScreen extends StatefulWidget {
  const InkDetailScreen({Key? key}) : super(key: key);

  static const routeName = "ink_detail_screen";

  @override
  State<InkDetailScreen> createState() => _InkDetailScreenState();
}

class _InkDetailScreenState extends State<InkDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Opções de tintas"),
      body: Column(
        children: const [
          InkDetailHeader(),
          InkDetailBody(),
          InkDetailFooter(),
        ],
      ),
    );
  }
}

class InkDetailHeader extends StatelessWidget {
  const InkDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Tinta Suvinil Criativa");
  }
}

class InkDetailBody extends StatefulWidget {
  const InkDetailBody({Key? key}) : super(key: key);

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
        InkDetailQualityList(),
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
