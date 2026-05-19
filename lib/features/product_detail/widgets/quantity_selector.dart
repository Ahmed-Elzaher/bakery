import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(QuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.quantity != oldWidget.quantity) {
      _animController.forward().then((_) => _animController.reverse());
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

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
            color: const Color(0xFF3E2723).withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'الكمية',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 17,
              color: Color(0xFF3E2723),
            ),
          ),
          Row(
            children: [
              _buildQuantityButton(icon: Icons.remove, onPressed: widget.onDecrement),
              const SizedBox(width: 12),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 64,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDFBF7),
                    border: Border.all(color: const Color(0xFFD35400), width: 2.5),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD35400).withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.quantity.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Color(0xFFD35400),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _buildQuantityButton(icon: Icons.add, onPressed: widget.onIncrement),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({required IconData icon, required VoidCallback onPressed}) {
    return SizedBox(
      width: 52,
      height: 52,
      child: Material(
        color: const Color(0xFFD35400),
        borderRadius: BorderRadius.circular(14),
        elevation: 5,
        shadowColor: const Color(0xFFD35400).withOpacity(0.4),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(14),
          splashColor: Colors.white.withOpacity(0.3),
          child: Icon(icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}