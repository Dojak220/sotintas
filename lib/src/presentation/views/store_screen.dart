import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';

import 'package:sotintas/src/presentation/stores/product_store.dart';
import 'package:sotintas/src/presentation/views/ink_detail_page.dart';
import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';

class StoreScreen extends StatefulWidget {
  final StoreController controller;
  const StoreScreen({Key? key, required this.controller}) : super(key: key);

  static const routeName = "store_screen";

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final exampleStore = GetIt.I.get<ProductStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Opções de tintas"),
      body: SafeArea(
        child: Column(
          children: [
            const SearchField(),
            const ListFilter(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.73,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: ((_, i) {
                  return const InkList();
                }),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class InkList extends StatelessWidget {
  const InkList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://picsum.photos/200",
      ),
      subtitle: const Text("R\$ 100,00"),
      title: const Text("Tinta"),
      trailing: TextButton(
        onPressed: () {},
        child: const Text("Entrega grátis"),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const InkDetailPage(),
        ),
      ),
    );
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
