import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final total = CartState.instance.totalPrice;
    final itemCount = CartState.instance.itemCount;

    return BottomAppBar(
      height: 130,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ],
          ),
          Material(
            color: const Color(0xFF4C53A5),
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.white.withValues(alpha: 0.3),
              onTap: () {
                if (itemCount == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Keranjang masih kosong')),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Proceeding to Checkout...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}