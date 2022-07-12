import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';
import 'package:sotintas/src/utils/class_helpers/quality.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class InkDetailPage extends StatelessWidget {
  const InkDetailPage({Key? key}) : super(key: key);

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
        InkDetailQualities(),
      ],
    );
  }
}

class InkDetailQualities extends StatelessWidget {
  InkDetailQualities({Key? key}) : super(key: key);

  final List<Quality> _qualities = [
    Quality(const Icon(Icons.brush), "Fácil de aplicar"),
    Quality(const Icon(Icons.air), "Não deixa cheiro"),
    Quality(const Icon(Icons.check), "É só abrir, mexer e pintar"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          const Text("Diferenciais"),
          SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    _qualities[index].icon,
                    const SizedBox(width: 10),
                    Text(_qualities[index].name),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          )
        ],
      ),
    );
  }
}

class SupportButtonsRow extends StatelessWidget {
  const SupportButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                  right: Radius.zero,
                ),
              ),
            ),
            child: const Text("Como pintar"),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.zero,
                  right: Radius.circular(50),
                ),
              ),
            ),
            child: const Text("Tirar dúvidas"),
          ),
        ),
      ],
    );
  }
}

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

class RightArrow extends StatelessWidget {
  const RightArrow({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 40,
      top: 80,
      child: IconButton(
        icon: const Icon(Icons.arrow_circle_right, size: 30),
        onPressed: () {
          _pageController.animateToPage(_pageController.page!.toInt() + 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}

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

class InkDetailImage extends StatelessWidget {
  const InkDetailImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/200"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
