import 'package:flutter/material.dart';
import 'dart:ui'; // مهم جداً عشان الـ BackdropFilter يشتغل

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ProductAppBar({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFDFBF7),
      elevation: 0,
      leading: _buildIconButton(
        icon: isFavorite ? Icons.favorite : Icons.favorite_border,
        iconSize: 24,
        color: isFavorite ? const Color(0xFFD35400) : const Color(0xFF3E2723),
        onTap: onFavoriteToggle,
      ),
      actions: [
        _buildIconButton(
          icon: Icons.arrow_forward_ios,
          iconSize: 20,
          color: const Color(0xFF3E2723),
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required double iconSize,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      // الظل الخارجي خففناه شوية عشان يتناسب مع نعومة الزجاج
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3E2723).withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // ClipRRect مهم جداً هنا عشان التأثير الزجاجي ميتخطاش حدود الزرار
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // درجة غباش الزجاج
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6), // أبيض شفاف
              // لمعة خفيفة على الحواف بتدي واقعية لتأثير الزجاج
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            ),
            child: Material(
              color: Colors.transparent, // شفاف عشان ميبوظش لون الزجاج
              child: InkWell(
                onTap: onTap,
                child: Center(
                  child: Icon(icon, color: color, size: iconSize),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}