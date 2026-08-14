import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_bottom_nav_bar.dart';
import '../widgets/cart_item_samples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final couponController = TextEditingController();

    return AnimatedBuilder(
      animation: CartState.instance,
      builder: (context, _) {
        return Scaffold(
          body: ListView(
            children: [
              const CartAppBar(),
              Container(
                padding: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    const CartItemSamples(),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.card_giftcard,
                            color: Color(0xFF4C53A5),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: couponController,
                              decoration: const InputDecoration(
                                hintText: 'Enter Coupon Code',
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final coupon = couponController.text.trim();
                              if (coupon.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Masukkan kode kupon terlebih dahulu')),
                                );
                                return;
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Kupon $coupon berhasil diterapkan')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4C53A5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: const CartBottomNavBar(),
        );
      },
    );
  }
}