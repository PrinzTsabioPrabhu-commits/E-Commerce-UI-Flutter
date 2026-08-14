import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';

class CartItemSamples extends StatelessWidget {
  const CartItemSamples({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CartState.instance.items;

    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Keranjang masih kosong',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Column(
      children: [
        for (final item in items)
          Container(
            height: 110,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(right: 15),
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          CartState.instance.removeItem(item.id);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              CartState.instance.updateQuantity(
                                item.id,
                                item.quantity - 1,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              item.quantity.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              CartState.instance.updateQuantity(
                                item.id,
                                item.quantity + 1,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}