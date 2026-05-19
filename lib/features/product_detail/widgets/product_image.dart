import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Hero(
        tag: 'product_image',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            height: screenHeight * 0.38,
            width: screenWidth * 0.88,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3E2723).withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 12),
                  spreadRadius: 3,
                ),
                BoxShadow(
                  color: const Color(0xFFD35400).withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=500&h=500&fit=crop',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFE8D5C4),
                        const Color(0xFFE8D5C4).withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.bakery_dining,
                    size: 90,
                    color: Color(0xFF3E2723),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}