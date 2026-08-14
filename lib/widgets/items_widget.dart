import 'package:flutter/material.dart';
import 'package:ui_ecommerce/cart_state.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'id': 'nike-air-max',
        'title': 'Nike Air Max',
        'desc': 'Sepatu Olahraga Trendy',
        'description':
            'Sepatu lari premium dengan bantalan udara untuk kenyamanan maksimal dan tampilan modern.',
        'price': 50.0,
        'image':
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&q=80',
      },
      {
        'id': 'smart-watch',
        'title': 'Smart Watch',
        'desc': 'Jam Tangan Pintar Modern',
        'description':
            'Smartwatch dengan monitor detak jantung, notifikasi pintar, dan desain elegan untuk aktivitas harian.',
        'price': 120.0,
        'image':
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&q=80',
      },
      {
        'id': 'wireless-headphone',
        'title': 'Wireless Headphone',
        'desc': 'Audio Berkualitas Tinggi',
        'description':
            'Headphone wireless dengan kualitas suara premium, noise cancellation, dan baterai tahan lama.',
        'price': 80.0,
        'image':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&q=80',
      },
      {
        'id': 'fashion-backpack',
        'title': 'Fashion Backpack',
        'desc': 'Tas Punggung Elegen',
        'description':
            'Backpack modern dengan banyak ruang penyimpanan, nyaman dipakai setiap hari, dan desain stylish.',
        'price': 45.0,
        'image':
            'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400&q=80',
      },
    ];

    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (var i = 0; i < products.length; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${products[i]['title']} ditambahkan ke favorit',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/items',
                      arguments: {
                        'index': i,
                        'id': products[i]['id'],
                        'name': products[i]['title'],
                        'description': products[i]['description'],
                        'price': products[i]['price'],
                        'image': products[i]['image'],
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    child: Image.network(
                      products[i]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    products[i]['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    products[i]['desc']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${products[i]['price']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final product = products[i];
                          CartState.instance.addProduct(
                            id: product['id'],
                            title: product['title'],
                            description: product['description'],
                            image: product['image'],
                            price: product['price'],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product['title']} ditambahkan ke keranjang'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                          Navigator.pushNamed(context, '/cart');
                        },
                        icon: const Icon(
                          Icons.shopping_cart_checkout,
                          color: Color(0xFF4C53A5),
                        ),
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