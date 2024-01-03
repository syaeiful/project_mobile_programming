import 'package:flutter/material.dart';
import 'package:project_mobile_programming/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

final _pageController = PageController();
int _currentPage = 0;


  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(title: 'shop all you want!',
    description: "select from a wide range of variety",
    image:"assets/image/gambar_kartun_belanja.png"),
    WelcomeSlider(title: 'save time, order online',
    description: "convenience at your fingertips",
    image:"assets/image/gambar4.png"),
    WelcomeSlider(title: 'the greatest shop journey',
    description: "make a pratical choice with one voice!",
    image:"assets/image/gambar3.png"),
  ];


  @override
  void initState(){
    super.initState();
    checkFirstSeen();
  }

  Future<void> checkFirstSeen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen')?? false);

    if(_seen) {
      Navigator.of(context)
      .push(MaterialPageRoute(builder: (context)=> LoginScreen()));
    }else {
      await prefs.setBool('seen', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: const Text(
                      'Skip', style: TextStyle(color: Colors.red, fontSize: 16),
                             ),
                            ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount:welcomeSlider.length,
                    onPageChanged: (value){
                      setState(() {
                        _currentPage = value;
                      });
                    },
                  itemBuilder:(context, index){
                    final item = welcomeSlider[index];
                    return Column(children:
                    [
                      Image.asset(
                        item.image, 
                      height: 350),
                      const SizedBox(height: 10,),
                      Text(item.title, 
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold, 
                        fontSize:28 ),),
                        const SizedBox(height: 5,),
                         Text(item.description,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 94, 92, 92),
                          fontSize: 20),
                          ),
                    ]);
                  } ),
                ),
                Row(
                  children: 
                    List.generate(3, (index){
                      return  Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index? 30 : 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index ? Colors.red : Colors.grey,
                          borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        );
                    })
            )
           ],
          ),
         ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
            if(_currentPage < welcomeSlider.length - 1){
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300), 
              curve: Curves.easeOut);
            }else {
                Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginScreen()));
            }
          },
          child: 
          _currentPage != welcomeSlider.length - 1 
          ? const Icon(Icons.arrow_forward) 
          :const Icon(Icons.done),
        ),
      ),
    );
  }
}

class WelcomeSlider{
  final String title;
  final String description;
  final String image;
  WelcomeSlider({required this.title, required this.description, required this.image});
}