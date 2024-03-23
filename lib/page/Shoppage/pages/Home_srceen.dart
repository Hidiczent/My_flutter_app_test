import 'package:app_present/page/Shoppage/models/my_product.dart';
import 'package:app_present/page/Shoppage/pages/detail_sreen.dart';
import 'package:app_present/page/Shoppage/widgets/product_crad.dart';
import 'package:flutter/material.dart';


class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // const Text(
          //   "Our products",
          //   style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All products"),
              _buildProductCategory(index: 1, name: "Anime"),
              _buildProductCategory(index: 2, name: "Sneakers"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: isSelected == 0
                  ? _buildAllProducts()
                  : isSelected == 1
                      ? _buildAnimePorducts()
                      : _buildSneakersProduct())
        ],
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          width: 90,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
//
  Widget _buildAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 100),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: Myproduct.allproducts.length,
      itemBuilder: (context, index) {
        final allproduct = Myproduct.allproducts[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(product: allproduct))),
            child: ProductCard(product: allproduct));
      });

  Widget _buildAnimePorducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: Myproduct.Animeproduct.length,
      itemBuilder: (contex, index) {
        final Animeproduct = Myproduct.Animeproduct[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(product: Animeproduct))),
            child: ProductCard(product: Animeproduct));
      });

  Widget _buildSneakersProduct() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: Myproduct.ShoesProduct.length,
      itemBuilder: (contex, index) {
        final ShoesProduct = Myproduct.ShoesProduct[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(product: ShoesProduct))),
            child: ProductCard(product: ShoesProduct));
      });
}
