import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/utils/helpers/display_size_helper.dart';

class ListFilter extends StatelessWidget {
  const ListFilter({Key? key, required this.controller}) : super(key: key);

  final StoreController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayUsableHeight(context) * 0.06,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Observer(
            builder: ((_) => Switch(
                  value: controller.freeShippingFilter,
                  onChanged: (newValue) {
                    newValue
                        ? controller.filterByDeliveryFree()
                        : controller.getProducts();
                  },
                )),
          ),
          const Text("Apenas "),
          const Text(
            "entrega grátis",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          const Spacer(),
          const Text("100 resultados"),
        ],
      ),
    );
  }
}