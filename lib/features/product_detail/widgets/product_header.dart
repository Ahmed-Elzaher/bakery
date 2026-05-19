import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. اسم المنتج
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF3E2723), Color(0xFF5D4037)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(bounds),
          child: Text(
            'كرواسون فرنسي فاخر',
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
              letterSpacing: 1.0,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 2. كرت السعر والعملة
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFD35400),
                const Color(0xFFD35400).withOpacity(0.75),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD35400).withOpacity(0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '45.00',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'ج.م',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),

        // 3. كرت التقييم بالنجوم
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE8D5C4), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3E2723).withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                5,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Icon(Icons.star_rounded, color: Color(0xFFD35400), size: 20),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '(127 تقييم)',
                style: GoogleFonts.tajawal(
                  color: const Color(0xFF3E2723),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}