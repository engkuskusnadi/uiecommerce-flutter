import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Produk 1', 'image': 'assets/product1.jpg'},
    {'name': 'Produk 2', 'image': 'assets/product2.jpg'},
    {'name': 'Produk 3', 'image': 'assets/product3.jpg'},
    {'name': 'Produk 4', 'image': 'assets/product4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    products[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(products[index]['name']!, style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  child: Text('Add to Cart'),
                  onPressed: () {
                    final snackBar = SnackBar(content: Text('${products[index]['name']} ditambahkan ke keranjang!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                ElevatedButton(
                  child: Text('Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: products[index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}