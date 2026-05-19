import 'package:flutter/material.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/product_image.dart';
import '../widgets/product_header.dart';
import '../widgets/product_description.dart';
import '../widgets/product_info_cards.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/product_action_buttons.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  final int minQuantity = 1;
  bool isFavorite = false;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > minQuantity) {
      setState(() {
        quantity--;
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    _showSnackBar(
      message: isFavorite ? 'تمت إضافة المنتج للمفضلة' : 'تمت إزالة المنتج من المفضلة',
      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
      bgColor: const Color(0xFFD35400),
    );
  }

  void _addToCart() {
    _showSnackBar(
      message: 'تمت إضافة $quantity كرواسون إلى السلة',
      icon: Icons.check_circle,
      bgColor: const Color(0xFF3E2723),
    );
  }

  void _buyNow() {
    _showSnackBar(
      message: 'تم تأكيد الشراء الفوري! ⚡',
      icon: Icons.check_circle_outline,
      bgColor: const Color(0xFFD35400),
    );
  }

  void _showSnackBar({required String message, required IconData icon, required Color bgColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(message, style: const TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: bgColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFDFBF7),
        appBar: ProductAppBar(
          isFavorite: isFavorite,
          onFavoriteToggle: _toggleFavorite,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const ProductImage(),
                const SizedBox(height: 36),
                const ProductHeader(),
                const SizedBox(height: 32),
                const ProductDescription(),
                const SizedBox(height: 32),
                const ProductInfoCards(),
                const SizedBox(height: 36),
                QuantitySelector(
                  quantity: quantity,
                  onIncrement: _incrementQuantity,
                  onDecrement: _decrementQuantity,
                ),
                const SizedBox(height: 36),
                ProductActionButtons(
                  onAddToCart: _addToCart,
                  onBuyNow: _buyNow,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}