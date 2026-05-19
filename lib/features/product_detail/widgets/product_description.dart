import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8D5C4), width: 1.5),
        boxShadow: [
          BoxShadow(
color: const Color(0xFF3E2723).withOpacity(0.04), // شفافية خفيفة جداً
  blurRadius: 24, // انتشار أوسع للظل
  offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Text(
        'كرواسون فرنسي مخبوز بالزبدة الطبيعية الفاخرة ومغطى برقائق اللوز المحمص المقرمشة. طبخ يومي من أفضل المكونات المستوردة مباشرة من فرنسا. طعم غني وشهي مع قوام هش وناعم يذوب في الفم.',
        style: TextStyle(
          color: Color(0xFF3E2723),
          fontSize: 16,
          height: 1.9,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}