import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/utils/hard_coded_data.dart';
import 'package:lootlo_app_admin_dash/widgets/product_tile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _products = productsList;

  Widget buildDesktopView() {
    return Padding(
      padding: AppConstants.screenPadding,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'All Products',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).primaryColor,
                  ),
                  foregroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(AppConstants.screenPaddingValue / 1.5),
                  ),
                ),
                icon: const Icon(Icons.add),
                onPressed: () {},
                label: const Text('Add Product'),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 250,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) =>
                  ProductTileWidget(product: _products[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileView() {
    return const Center(
      child: Text('Products Widget Mobile View'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => buildDesktopView(),
      mobile: (_) => buildMobileView(),
    );
  }
}
