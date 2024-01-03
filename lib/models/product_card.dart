import 'package:flutter/material.dart';
import 'package:project_mobile_programming/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
width: MediaQuery.of(context).size.width/2,
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),
color: Colors.grey.withOpacity(0.1),
),
child: Column(
  children: [
    SizedBox(
      height: 130,
      width: 130,
      child: Image.asset(
        widget.product.image,
        fit: BoxFit.cover,
      ),
    ),
  Text(
    widget.product.name,
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  Text(
    '\$' '{widget.product.price}',
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  ),
]),
    );
  }
}