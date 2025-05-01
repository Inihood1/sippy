import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sippy/routes/app_router.dart';

import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../providers/session_provider.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final products = context.watch<ProductProvider>().products;
    final sessionProv = context.watch<SessionProvider>();
    final cartProv = context.watch<CartProvider>();
    final currentUser = sessionProv.currentUserName ?? 'Someone';

    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, idx) {
            final Product product = products[idx];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: Image.network(
                  product.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.name),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                trailing: ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    cartProv.addItem(product, currentUser);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(
                        '${product.name} added by $currentUser',
                      )),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('View Cart (${cartProv.items.length})'),
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          context.router.push(SharedCartRoute());
        },
      ),
    );
  }
}
