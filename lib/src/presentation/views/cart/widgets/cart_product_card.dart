import 'package:flutter/material.dart';
import 'package:sotintas/src/external/models/cart_item.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class CartProductCard extends StatefulWidget {
  final CartItem cartProduct;

  const CartProductCard({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  int _dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.darkGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: CustomColors.grey,
      ),
      child: Row(
        children: [
          Image.network(
            "https://picsum.photos/200",
            height: 70,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tinta"),
                Divider(height: 25, thickness: 1, color: CustomColors.darkGrey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomColors.darkGrey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: CustomColors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropdownButton(
                          value: _dropdownValue,
                          isDense: true,
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(10),
                          underline: const SizedBox(),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: CustomColors.darkGrey,
                          ),
                          items: List<DropdownMenuItem<int>>.generate(
                            10,
                            (int index) => DropdownMenuItem(
                              value: index,
                              child: Text("$index un.  "),
                            ),
                          ),
                          onChanged: (int? newValue) {
                            setState(() {
                              _dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const Text("R\$ 100,00"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
