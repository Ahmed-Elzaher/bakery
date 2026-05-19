import 'package:flutter/material.dart';

class ProductActionButtons extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const ProductActionButtons({
    super.key,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
color: const Color(0xFF3E2723).withOpacity(0.04), // شفافية خفيفة جداً
  blurRadius: 24, // انتشار أوسع للظل
  offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3E2723),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 26),
                  SizedBox(width: 16),
                  Text(
                    'إضافة إلى السلة',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
color: const Color(0xFF3E2723).withOpacity(0.04), // شفافية خفيفة جداً
  blurRadius: 24, // انتشار أوسع للظل
  offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Material(
              color: const Color(0xFFFFE082),
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: onBuyNow,
                borderRadius: BorderRadius.circular(16),
                splashColor: const Color(0xFFD35400).withOpacity(0.2),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flash_on, color: Color(0xFFD35400), size: 26),
                    SizedBox(width: 16),
                    Text(
                      'شراء فوري',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: Color(0xFFD35400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}