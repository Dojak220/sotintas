import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/presentation/views/store/widgets/list_filter.dart';

import 'package:sotintas/src/presentation/views/store/widgets/products_list_view.dart';
import 'package:sotintas/src/presentation/views/store/widgets/search_field.dart';
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
                          ? const Center(child: Text("Nada encontrado"))
                          : ProductsListView(controller: widget.controller),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
