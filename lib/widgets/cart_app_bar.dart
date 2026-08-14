import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 28,
              color: Color(0xFF4C53A5),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF4C53A5),
                  size: 26,
                ),
                SizedBox(width: 8),
                Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 28,
              color: Color(0xFF4C53A5),
            ),
            onSelected: (value) {
              if (value == 'Clear Cart') {
                CartState.instance.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Keranjang berhasil dibersihkan')),
                );
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Menu $value dipilih')),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Clear Cart',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, color: Color(0xFF4C53A5)),
                    SizedBox(width: 10),
                    Text('Clear Cart'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined, color: Color(0xFF4C53A5)),
                    SizedBox(width: 10),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}