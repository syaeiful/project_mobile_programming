import 'package:flutter/material.dart';
import 'package:project_mobile_programming/custom_scaffold.dart';

import 'package:project_mobile_programming/product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];
  String searchText = '';

  @override
  void initState(){
    super.initState();
    cardItems = [
      CardItem(title: 'Apple', pricing: '\$ 2', images: ['assets/image/apple.png',]),
      CardItem(title: 'Grape', pricing: '\$ 4', images: ['assets/image/grape.png',]),
      CardItem(title: 'Orange', pricing: '\$ 6', images: ['assets/image/orange.webp',]),
      CardItem(title: 'Pineapple', pricing: '\$ 8', images: ['assets/image/pineapple.png',]),
      CardItem(title: 'Watermelon', pricing: '\$ 10', images: ['assets/image/watermelon.webp',]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
             currentFocus.focusedChild != null) {
              currentFocus.focusedChild?.unfocus();
             }
      },
      child: CustomScaffold(
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
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                    Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Fruit Market',
                        hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list),
                    ),
                  ],
                  ),
                ),
                ),
                Expanded(
                 child: GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap:true,
                  children: cardItems
                  .where((cardItem) => cardItem.title
                  .toLowerCase()
                  .contains(searchText.toLowerCase()))
                  .map((cardItem){
                    return buildCard(cardItem);
                    }).toList()),
                  ), 
                ],
              ),      
            ),
            showBottomNavBar: true,
            initialIndex: 0,
        ),
    );
  }
  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height /10,
              child: PageView.builder(
                itemCount: cardItem.images.length,
                onPageChanged: (int index){
                  setState(() {
                    cardItem.currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    cardItem.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(cardItem.images.length,
               (int circleIndex){
                return Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: circleIndex == cardItem.currentIndex
                    ? Colors.blue
                    : Colors.grey,
                  ),
                  );
               }),
               ),
            ListTile(
              title: Text(
                cardItem.title,
                style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(cardItem.pricing),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Fresh',
                  style: TextStyle(color: Colors.white),
                  ),
                ),
            )
        ])
      ),
    );
  }
  


}

class CardItem {
  final String title;
  final String pricing;
  final List<String> images;
  int currentIndex;
  
  CardItem(
    {required this.title,
     required this.pricing,
     required this.images,
     this.currentIndex = 0});
}