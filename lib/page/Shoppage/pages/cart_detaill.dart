import 'package:app_present/page/Shoppage/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class CartDetaill extends StatefulWidget {
  const CartDetaill({Key? key});

  @override
  State<CartDetaill> createState() => _CartDetaillState();
}

class _CartDetaillState extends State<CartDetaill> {
  late CartProvider provider; // Declare provider variable

  @override
  void initState() {
    super.initState();
    provider = CartProvider.of(context);
  }

  _buildProductQuantity(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          icon == Icons.add
              ? provider.incrementQuantity(index)
              : provider.decrementQuantity(index);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade100,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access context within the build method
    final finalList = provider.cart;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text(
                  "Mycart",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        finalList[index].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        finalList[index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(finalList[index].image),
                        backgroundColor: Colors.red.shade100,
                      ),
                      trailing: Column(
                        children: [
                          _buildProductQuantity(Icons.add, index),
                          Text(
                            '\$${finalList[index].price}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          _buildProductQuantity(Icons.add, index),
                        ],
                      ),
                      tileColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${provider.getTotalPrice()}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
