import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    const url = 'https://dummyjson.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('products')) {
          final List<dynamic> productData = jsonResponse['products'];

          setState(() {
            _products =
                productData.map((item) => ProductModel.fromJson(item)).toList();
          });
        } else {
          throw Exception('No products found in response');
        }
      } else {
        throw Exception(
            'Failed to load products (Status: ${response.statusCode})');
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Error fetching products: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addItem(int id) {
    setState(() {
      final product = _products.firstWhere((prod) => prod.id == id);
      product.quantity += 1;
    });
  }

  void _removeItem(int id) {
    setState(() {
      final product = _products.firstWhere((prod) => prod.id == id);
      if (product.quantity > 0) {
        product.quantity -= 1;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : _products.isEmpty
                  ? const Center(child: Text('No products available'))
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: _products.length,
                            itemBuilder: (ctx, index) {
                              final product = _products[index];
                              return ProductCard(
                                product: product,
                                onAdd: () => _addItem(product.id),
                                onRemove: () => _removeItem(product.id),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Total Products: ${_products.length}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCard({
    required this.product,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Category: ${product.category}'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: onRemove,
                      ),
                      Text(
                        '${product.quantity}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: onAdd,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
