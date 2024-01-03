import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile_programming/cart_provider.dart';
import 'package:provider/provider.dart';




class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // ignore: unused_field
  int _currentSlide = 0;
  int selectedButton = 1;

  void addToCart() {
   CartItem newItem = 
    CartItem(name: 'Apple',price: 10, quantity: 1);
    CartItem(name: 'Grape',price: 20, quantity: 1);
    CartItem(name: 'Orange',price: 30, quantity: 1);
    CartItem(name: 'Pineapple',price: 40, quantity: 1);
    CartItem(name: 'Watermelon',price: 50, quantity: 1);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
  }

  void selectButton(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _image = [
    'assets/image/apple.png',
    'assets/image/grape.png',
    'assets/image/orange.webp',
    'assets/image/pineapple.png',
    'assets/image/watermelon.webp',
      ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options:CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              onPageChanged: (index, _) {
                setState(() {
                  _currentSlide = index;
                });
              }), items: _image.map((image) {
                return Builder(builder:(context) {
                  return Image.asset(
                    image,
                    fit: BoxFit.cover,
                  );
                },
                );
              }).toList(),  
          ),
          Container(
            color: Colors.white,
            padding:  EdgeInsets.all(16),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Fruits',
                    style:
                     TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                Text(
                  'Price: \$ 2',
                   style: TextStyle(fontSize: 16),
                ),
                
                  ],
                ),  
              ],
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.all(8.0),
          child:Text(
            'Product Description',
            style: TextStyle(fontSize: 22.0,
            fontWeight: FontWeight.bold),
          ) ,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This fruit is fresh ',
                style: TextStyle(fontSize: 16),
                ),
                Text('Just picked from there',
                style: TextStyle(fontSize: 16),
                ),Text('This fruit tastes delicious',
                style: TextStyle(fontSize: 16),
                
                ),
              ],
            ),
          ),
          
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: (){
                      selectButton(1);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: 
                      selectedButton == 1 ? Colors.green: Colors.white),
                    child: Text (
                      'RESELL', 
                    style: TextStyle(
                      color:
                            selectedButton == 1 ? Colors.white : Colors.black,
                      fontSize: 18),
                    ),
                    ),
                    ),
                    ),
                    Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: (){
                      selectButton(2);
                      addToCart();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: 
                      selectedButton == 2 ? Colors.green: Colors.white),
                    child: Text (
                      'ADD TO CART', 
                    style: TextStyle(
                      color: 
                            selectedButton == 2 ? Colors.white :Colors.black,
                      fontSize: 18),
                    ),
                    ),
                    ),
                    ),
                    
                    
            ],
          )
        ],
      ),
    );                
}
}
             