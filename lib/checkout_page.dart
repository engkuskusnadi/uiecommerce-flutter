import 'package:flutter/material.dart';
import 'thank_you_page.dart';

class CheckoutPage extends StatelessWidget {
  final Map<String, String> product;

  CheckoutPage({required this.product});

  void _submitOrder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThankYouPage(productName: product['name']!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Anda ingin membeli: ${product['name']}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Konfirmasi Pembelian'),
              onPressed: () => _submitOrder(context),
            ),
          ],
        ),
      ),
    );
  }
}