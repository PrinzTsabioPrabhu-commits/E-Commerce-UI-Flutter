import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan URL gambar internet yang stabil
    final List<String> categoryImages = [
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200&q=80', // Sepatu Merah
      'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=200&q=80', // Jam Tangan
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200&q=80', // Headphone
      'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=200&q=80', // Tas
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categoryImages.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    categoryImages[i],
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Kategori ${i + 1}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}