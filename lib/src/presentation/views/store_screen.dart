import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';

import 'package:sotintas/src/presentation/views/ink_detail_page.dart';
import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';
import 'package:sotintas/src/utils/helpers/display_size_helper.dart';

class StoreScreen extends StatefulWidget {
  final StoreController controller;
  const StoreScreen({Key? key, required this.controller}) : super(key: key);

  static const routeName = "store_screen";

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    widget.controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Opções de tintas"),
      body: SafeArea(
        child: Column(
          children: [
            SearchField(controller: widget.controller),
            ListFilter(controller: widget.controller),
            Observer(
              builder: (context) {
                return SizedBox(
                  height: displayUsableHeight(context) * 0.82,
                  child: (widget.controller.isFetchingProducts)
                      ? const Center(child: CircularProgressIndicator())
                      : widget.controller.productStore.productCount == 0
                          ? const Center(child: Text("Sem produtos à venda"))
                          : ProductsListWidget(controller: widget.controller),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final StoreController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.productCount,
      itemBuilder: ((_, i) {
        return ProductCard(controller.products![i]!);
      }),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.coverImage,
        height: MediaQuery.of(context).size.height * 0.08,
        loadingBuilder: (_, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : const CircularProgressIndicator();
        },
      ),
      subtitle: Text(product.price.toString()),
      title: Text(product.name),
      trailing: TextButton(
        onPressed: () {},
        child: product.deliveryFree
            ? const Text("Entrega grátis")
            : const SizedBox(),
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
  const SearchField({Key? key, required this.controller}) : super(key: key);

  final StoreController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayUsableHeight(context) * 0.08,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          prefixIcon: Icon(Icons.search_rounded),
          hintText: "Buscar...",
        ),
        controller: controller.searchController,
        onEditingComplete: () {
          controller.freeShippingFilter
              ? controller.filterByDeliveryFree()
              : controller.getProducts();
        },
      ),
    );
  }
}

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
