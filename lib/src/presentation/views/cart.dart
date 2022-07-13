import 'package:flutter/material.dart';

import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = "store_screen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Carrinho"),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: ((_, i) {
                  return const InkList();
                }),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Adicionar ao carrinho"),
            ),
          ],
        ),
      ),
    );
  }
}

class InkList extends StatefulWidget {
  const InkList({
    Key? key,
  }) : super(key: key);

  @override
  State<InkList> createState() => _InkListState();
}

class _InkListState extends State<InkList> {
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
    // return ListTile(
    //   leading: Image.network(
    //     "https://picsum.photos/200",
    //   ),
    //   subtitle: const Text("R\$ 100,00"),
    //   title: const Text("Tinta"),
    //   trailing: TextButton(
    //     onPressed: () {},
    //     child: const Text("Entrega grátis"),
    //   ),
    //   onTap: () => Navigator.of(context).push(
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => const InkDetailPage(),
    //     ),
    //   ),
    // );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        prefixIcon: Icon(Icons.search_rounded),
        hintText: "Buscar...",
      ),
    );
  }
}

class ListFilter extends StatefulWidget {
  const ListFilter({Key? key}) : super(key: key);

  @override
  State<ListFilter> createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  bool _freeShippingFilter = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Switch(
          value: _freeShippingFilter,
          onChanged: (newValue) {
            setState(() => _freeShippingFilter = newValue);
          },
        ),
        const Text("Apenas "),
        const Text(
          "entrega grátis",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        const Spacer(),
        const Text("100 resultados"),
      ],
    );
  }
}
