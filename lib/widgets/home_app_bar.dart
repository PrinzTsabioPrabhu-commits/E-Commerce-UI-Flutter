import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartState.instance,
      builder: (context, _) {
        final cartCount = CartState.instance.itemCount;

        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              const Icon(Icons.sort, size: 30, color: Color(0xFF4C53A5)),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'EcoGlobal',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
              const Spacer(),
              badges.Badge(
                showBadge: cartCount > 0,
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.red,
                  padding: EdgeInsets.all(7),
                ),
                badgeContent: Text(
                  cartCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/list-chat');
                  },
                  child: const Icon(
                    Icons.message_sharp,
                    size: 32,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}