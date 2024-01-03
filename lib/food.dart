

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile_programming/custom_scaffold.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<String> imageUrls = [];
  List<String> titles = ['Spaghettis', 'Fruits', 'Breads', 'Salads', 'Pizza'];
  List<String> rating = ['4.5', '3.0', '3.5', '4.0', '4.5'];
  List<String> subtitle = ['Chinese Dish', 'Vitamin', 'Large', 'Small', '14 inch'];
  List<String> pricing = ['\$10', '\$20',  '\$30',  '\$40', '\$50'];
  

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async{
    FirebaseStorage storage = FirebaseStorage.instance;
    for (int i=1; i<=5; i++){
      Reference ref = storage.ref().child ('f$i.jpg');
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        imageUrls.add(downloadUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
      return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.green[700]
                  ),
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                    const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                  ),
                ),
                ),
                Expanded(
                  child:  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                      itemCount: imageUrls.length,
                      itemBuilder: ((context, index){
                        return Container(
                          decoration: BoxDecoration(
                            image:DecorationImage(
                              image: NetworkImage(
                                imageUrls[index],
                              ),
                                fit: BoxFit.cover
                              ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end, 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreenAccent, 
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          titles[index], 
                                        style: const TextStyle(color: Colors.black, 
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                        ),
                                  ),
                                  ),
                                   const Spacer(),
                                   Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue, 
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                         rating[index], 
                                        style: const TextStyle(color: Colors.black, 
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                        ),
                                  )
                                  ),
                                  ],
                                 ),
                                   Row(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.amber, 
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          subtitle[index], 
                                        style: const TextStyle(color: Colors.black, 
                                        fontSize: 16,
                                        ),
                                        ),
                                  ),
                                  ),
                                   const Spacer(),
                                   Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent, 
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                         pricing[index], 
                                        style: const TextStyle(color: Colors.black, 
                                        fontSize: 16,
                                        ),
                                        ),
                                  )
                                  ),
                                  ],
                                 ),
                                  ],
                                  )
                                 
                                  
                                );
                        
                      })
    ),
    )
   ] )
          
      ),
    
      showBottomNavBar: true,
      initialIndex: 1,
   );
    
                 
  
  }
}

class FoodItem {
  final String image;
  final String title;
  final String subtitle;
  final double rating;
  final double price;

  FoodItem(
    {required this.image, 
    required this.title, 
    required this.subtitle, 
    required this.rating, 
    required this.price});
}