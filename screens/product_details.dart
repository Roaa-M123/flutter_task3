import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, this.name, this.price, this.icon});

  final String? name;
  final int? price;
  final IconData? icon;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ProductDetails: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ProductDetails: didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("ProductDetails: build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C7AC8),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Products Details"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: 200,
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(widget.icon, color: Color(0xFF7C7AC8)),
                title: Text(
                  widget.name ?? "",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "\$${widget.price}",
                  style: const TextStyle(
                    color: Color(0xFF7C7AC8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7C7AC8),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context, '${widget.name} added to cart');
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print("ProductDetails: deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("ProductDetails: dispose");
  }
}
