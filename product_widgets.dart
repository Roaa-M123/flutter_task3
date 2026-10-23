// ============================================================
//  HELPER FILE: Product widgets
// ============================================================
//  Ready widgets to show a list of products.
//  Use ProductsListView or ProductsGridView inside your page.
//
//  Each product is a Map like: {"name": "Laptop", "price": 1200}
//
//  Example:
//  ProductsListView(
//    products: products,
//    onFavoritePressed: () {
//      setState(() {
//        favorites++;
//      });
//    },
//    onProductTap: (index) {
//      print(products[index]["name"]);
//    },
//  )

import 'package:flutter/material.dart';
import 'package:products_app/screens/product.dart';

class ProductsListView extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final void Function(int index) onFavoritePressed;
  final void Function(int index) onProductTap;
  final List<bool> isFavorite;

  ProductsListView({
    required this.products,
    required this.onFavoritePressed,
    required this.onProductTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(
          name: products[index]["name"],
          price: products[index]["price"],
          onFavoritePressed: () {
            onFavoritePressed(index);
          },
          onTap: () {
            onProductTap(index);
          },
          icon: products[index]["icon"],
          isFavorite: isFavorite,
          index: index,
        );
      },
    );
  }
}

class ProductsGridView extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final void Function(int index) onFavoritePressed;
  final void Function(int index) onProductTap;
  final List<bool> isFavorite;

  ProductsGridView({
    required this.products,
    required this.onFavoritePressed,
    required this.onProductTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
      ),
      itemBuilder: (context, index) {
        return ProductTile(
          name: products[index]["name"],
          price: products[index]["price"],
          onFavoritePressed: () {
            onFavoritePressed(index);
          },
          onTap: () {
            onProductTap(index);
          },
          icon: products[index]["icon"],
          isFavorite: isFavorite,
          index: index,
        );
      },
    );
  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final int price;
  final IconData icon;
  final void Function() onFavoritePressed;
  final void Function() onTap;
  final List<bool> isFavorite;
  final int index;

  const ProductTile({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.onFavoritePressed,
    required this.onTap,
    required this.isFavorite,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
        subtitle: Text('\$$price'),
        trailing: IconButton(
          icon: Icon(
            isFavorite[index] ? Icons.favorite : Icons.favorite_border,
          ),
          color: isFavorite[index] ? Colors.red : Colors.black,
          onPressed: onFavoritePressed,
        ),
        onTap: onTap,
      ),
    );
  }
}
