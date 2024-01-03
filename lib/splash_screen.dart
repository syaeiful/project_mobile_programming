import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_mobile_programming/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin
 {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync:this,
      duration: const Duration(seconds: 2)
      );
      _animationController.forward();
      Timer(const Duration(seconds: 3), (){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context)=> WelcomeScreen()));
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOut
            ),
          ),
          child: Image.asset('assets/image/keranjang_belanjaa.png', height: 150),
        ),
        const SizedBox(
          height: 50,
        ),
        ScaleTransition(

          scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.linear,
            ),
          ),
          child: const Text(
          'MY E-COMMERCE APP',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black),
         ),
        ),
       ],
      ),
     ),
     bottomNavigationBar: const SizedBox(
      height: 40,
      child: Text('Oleh Kelompok 2',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
      ),
     ),
    );
  }
}