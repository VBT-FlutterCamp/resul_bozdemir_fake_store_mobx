import 'package:fake_store_api/feature/productview/view/product_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx - E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductView(),
    );
  }
}
