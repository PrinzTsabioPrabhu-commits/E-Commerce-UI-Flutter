import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ecommerce/cart_state.dart';

void main() {
  test('cart adds product once and aggregates quantity', () {
    final cart = CartState.instance;
    cart.clear();

    cart.addProduct(
      id: 'nike-air-max',
      title: 'Nike Air Max',
      description: 'Sepatu olahraga',
      image: 'https://example.com/1.jpg',
      price: 50,
    );
    cart.addProduct(
      id: 'nike-air-max',
      title: 'Nike Air Max',
      description: 'Sepatu olahraga',
      image: 'https://example.com/1.jpg',
      price: 50,
    );

    expect(cart.items.length, 1);
    expect(cart.items.first.quantity, 2);
    expect(cart.total, 100);
  });
}
