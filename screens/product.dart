import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/screens/product_details.dart';

import '../product_widgets.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.userName});

  final String userName;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 1200, 'icon': Icons.laptop},
    {'name': 'Phone', 'price': 800, 'icon': Icons.phone_android},
    {'name': 'Headphones', 'price': 150, 'icon': Icons.headphones},
    {'name': 'Smart Watch', 'price': 250, 'icon': Icons.watch},
    {'name': 'Camera', 'price': 600, 'icon': Icons.camera_alt},
    {'name': 'Keyboard', 'price': 90, 'icon': Icons.keyboard},
    {'name': 'Tablet', 'price': 450, 'icon': Icons.tablet},
    {'name': 'Mouse', 'price': 35, 'icon': Icons.mouse},
  ];

  late final List<bool> isFavorite = List.filled(products.length, false);
  int favoritesCounter = 0;
  double screenWidth = 0;
  double screenheight = 0;
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ProductsPage: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);

    screenWidth = size.width;
    screenheight = size.height;
    print("ProductsPage: didChangeDependencies");
    print("width=${screenWidth},height${screenheight}");
  }

  @override
  Widget build(BuildContext context) {
    // final yourUserName = ModalRoute.of(context)!.settings.arguments.toString();
    print("ProductsPage: build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C7AC8),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Products"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ${widget.userName}",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //"Your Favorites: ${isFavorite.where((item) => item).length}",
                Row(
                  children: [
                    const Icon(Icons.favorite, size: 16, color: Colors.red),
                    const SizedBox(width: 10),
                    Text(
                      "Your Favorites: ${isFavorite.where((item) => item).length}",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.width_normal,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Screen width: ${screenWidth.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                if (message.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xFFA3A1E6),
                    ),
                    child: Text(message),
                  ),
              ],
            ),
          ),

          Expanded(
            child: screenWidth < 600
                ? ProductsListView(
                    products: products,
                    onFavoritePressed: (int index) {
                      setState(() {
                        isFavorite[index] = !isFavorite[index];
                      });
                    },
                    onProductTap: (int index) async {
                      final result = await context.push(
                        '/product_details/${products[index]["price"]}/${products[index]["name"]}',
                        extra: products[index]['icon'],
                      );
                      // final result = await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return ProductDetails(
                      //         name: products[index]["name"],
                      //         price: products[index]["price"],
                      //         icon: products[index]["icon"],
                      //       );
                      //     },
                      //   ),
                      // );
                      setState(() {
                        message = result.toString();
                      });
                    },
                    isFavorite: isFavorite,
                  )
                : ProductsGridView(
                    products: products,
                    onFavoritePressed: (int index) {
                      setState(() {
                        isFavorite[index] = !isFavorite[index];
                      });
                    },
                    onProductTap: (int index) async {
                      final result = await context.push(
                        '/product_details/${products[index]["price"]}/${products[index]["name"]}',
                        extra: products[index]['icon'],
                      );
                      // final result = await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return ProductDetails(
                      //         name: products[index]["name"],
                      //         price: products[index]["price"],
                      //         icon: products[index]["icon"],
                      //
                      //       );
                      //     },
                      //   ),
                      // );
                      setState(() {
                        message = result.toString();
                      });
                    },
                    isFavorite: isFavorite,
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print("ProductsPage: deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("ProductsPage: dispose");
  }
}
