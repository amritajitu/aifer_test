

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductGridPage extends StatefulWidget {
  @override
  _ProductGridPageState createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  final List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreProducts(); // Load initial products
  }

  // Simulate fetching data from an API or database
  void _loadMoreProducts() {
    if (isLoading) return; // Prevent multiple simultaneous loads
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      // Simulate adding new products
      List<Product> newProducts = [
        Product(name: 'Apple', imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Apple'),
        Product(name: 'Banana', imageUrl: 'https://via.placeholder.com/150/FFFF00/FFFFFF?text=Banana'),
        Product(name: 'Orange', imageUrl: 'https://via.placeholder.com/150/FFA500/FFFFFF?text=Orange'),
        Product(name: 'Mango', imageUrl: 'https://via.placeholder.com/150/FFD700/FFFFFF?text=Mango'),
        Product(name: 'Grapes', imageUrl: 'https://via.placeholder.com/150/800080/FFFFFF?text=Grapes'),
      ];

      setState(() {
        products.addAll(newProducts); // Add more products to the list
        isLoading = false; // Stop loading indicator
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading Product Grid'),
      ),
      body: GridView.builder(
        itemCount: products.length + (isLoading ? 1 : 0), // Add one more for loading indicator
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of columns
          crossAxisSpacing: 10.0, // space between columns
          mainAxisSpacing: 10.0, // space between rows
        ),
        itemBuilder: (context, index) {
          if (index == products.length) {
            // Show loading indicator when reaching the end
            _loadMoreProducts();
            return Center(child: CircularProgressIndicator());
          }

          final product = products[index];
          return Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  product.imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}





