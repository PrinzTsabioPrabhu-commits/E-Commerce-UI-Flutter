import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class CartState extends ChangeNotifier {
  static final CartState instance = CartState();

  CartState();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.total);

  double get total => totalPrice;

  void addProduct({
    required String id,
    required String title,
    required String description,
    required String image,
    required double price,
    int quantity = 1,
  }) {
    final index = _items.indexWhere((item) => item.id == id);

    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(
        CartItem(
          id: id,
          title: title,
          description: description,
          image: image,
          price: price,
          quantity: quantity,
        ),
      );
    }

    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index < 0) {
      return;
    }

    if (quantity <= 0) {
      _items.removeAt(index);
    } else {
      _items[index].quantity = quantity;
    }

    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
