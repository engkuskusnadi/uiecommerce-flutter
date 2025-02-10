import 'package:flutter/material.dart';
import 'checkout_page.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product['image']!, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(product['name']!, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Checkout'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage(product: product)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}