import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final index = args?['index'] as int? ?? 0;
    final id = args?['id'] as String? ?? 'product-$index';
    final name = args?['name'] as String? ?? 'Item';
    final description = args?['description'] as String? ??
        'Detail produk belum tersedia.';
    final price = (args?['price'] as num?)?.toDouble() ?? 0.0;
    final image = args?['image'] as String? ?? 'images/items/${index + 1}.jpg';

    final imageWidget = image.startsWith('http')
        ? Image.network(image, height: 240, fit: BoxFit.cover)
        : Image.asset(image, height: 240, fit: BoxFit.cover);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFF4C53A5),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: imageWidget),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black54, height: 1.6),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  CartState.instance.addProduct(
                    id: id,
                    title: name,
                    description: description,
                    image: image,
                    price: price,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name berhasil ditambahkan ke keranjang')),
                  );
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C53A5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
