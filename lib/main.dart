import 'package:flutter/material.dart';
import 'features/product_detail/screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مخبزة ألوان الدفء',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3E2723),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
        appBarTheme: const AppBarThemeData(
          backgroundColor: Color(0xFFFDFBF7),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF3E2723)),
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: ProductDetailPage(),
      ),
    );
  }
}
