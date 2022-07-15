import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/presentation/controllers/product_detail_controller.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class InkDetailQualityList extends StatefulWidget {
  final String productId;
  final ProductDetailController controller;
  const InkDetailQualityList({
    Key? key,
    required this.productId,
    required this.controller,
  }) : super(key: key);

  @override
  State<InkDetailQualityList> createState() => _InkDetailQualityListState();
}

class _InkDetailQualityListState extends State<InkDetailQualityList> {
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
          Observer(
            builder: (context) => SizedBox(
              height: 100,
              child: (widget.controller.isFetchingQualities)
                  ? const Center(child: CircularProgressIndicator())
                  : widget.controller.productStore.productQualityCount == 0
                      ? const Center(child: Text("Nada encontrado"))
                      : ListView.separated(
                          itemCount: widget.controller.productQualityCount,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(widget
                                    .controller.productQualities![index].id),
                                const SizedBox(width: 10),
                                Text(widget
                                    .controller.productQualities![index].name),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        ),
            ),
          )
        ],
      ),
    );
  }
}
