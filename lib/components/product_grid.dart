import 'package:flutter/material.dart';
import 'package:loja/components/product_grid_item.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/product_list.dart';

class ProductGrid extends StatelessWidget {
  bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
