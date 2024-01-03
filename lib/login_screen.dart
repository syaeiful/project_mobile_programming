import 'package:flutter/material.dart';
import 'package:project_mobile_programming/food.dart';
import 'package:project_mobile_programming/sign_in.dart';
import 'package:project_mobile_programming/sign_up.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/Ecommerce.png'), fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7),
              BlendMode.darken),
            ),
          ),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 120, 5, 20,),
            ),
            Image.asset(
              'assets/image/keranjang_belanjaa.png',
               height: 175,
            ),
            SizedBox(height: 100),
            Button(
              onPressed: () { 
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignUp()));
              },
              text: 'SIGN UP',
            ),
            const SizedBox(height: 45),  
             Button(
              onPressed: () { 
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignIn()));
             }, 
             text: 'SIGN IN ',
             ),
             Spacer(),
             Padding(
               padding: const EdgeInsets.only(bottom: 30, right: 20),
               child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Food()));
                 }, 
                 child: const Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.yellow, 
                      fontSize: 26, 
                      fontWeight: FontWeight.w400),
                  ),
                 ),
               ),
             ),  
            ]
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  
  final void Function () onPressed;
  Button({
    super.key, required this.text,required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              child: Text(
                text,
              style: TextStyle(
                color: Color.fromARGB(255, 94, 92, 92),
                fontSize: 22),
              ))
    );
  }
}