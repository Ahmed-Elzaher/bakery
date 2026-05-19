import 'package:flutter/material.dart';

class ProductInfoCards extends StatelessWidget {
  const ProductInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildInfoCard('🕐 المدة', '30 دقيقة'),
        const SizedBox(width: 12),
        _buildInfoCard('🌡️ الحفظ', 'الثلاجة'),
        const SizedBox(width: 12),
        _buildInfoCard('🚚 الحد الأدنى', 'بدون حد'),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE8D5C4), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3E2723).withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3E2723),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: Color(0xFFD35400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}