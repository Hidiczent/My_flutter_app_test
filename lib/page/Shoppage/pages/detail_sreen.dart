import 'package:app_present/page/Shoppage/models/product.dart';
import 'package:app_present/page/Shoppage/widgets/avilable_size.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: 220,
            height: 220,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade100,
              ),
              child: Image.asset(widget.product.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.product.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Available",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Available(size: "US.6")),
                    Expanded(child: Available(size: "US.7")),
                    Expanded(child: Available(size: "US.8")),
                    Expanded(child: Available(size: "US.9")),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Available Colors",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Text(
                '\$${widget.product.price}',
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 250,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // provider.toggleProduct(widget.product);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CartDetaill(),
                  //   ),
                  // );
                },
                icon: const Icon(Icons.add),
                label: const Text("Add to Cart"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
