import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/session_provider.dart';
import '../../routes/app_router.dart';

@RoutePage()
class SharedCartScreen extends StatelessWidget {
  const SharedCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProv = context.watch<CartProvider>();
    final sessionProv = context.read<SessionProvider>();
    final currentSession = sessionProv.currentSession;

    return Scaffold(
      appBar: AppBar(title: Text('Shared Cart')),
      body: cartProv.itemCount == 0
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cartProv.items.length,
        itemBuilder: (_, i) {
          final item = cartProv.items[i];
          return ListTile(
            title: Text(item.product.name),
            subtitle: Text('Added by ${item.addedBy}'),
            trailing: Text('\$${item.product.price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${cartProv.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Clear data first
                cartProv.clearCart();
                sessionProv.clearSession();
                // Navigate to confirmation screen
                context.router.push(ConfirmationRoute());
              },
              child: Text('Done Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}
