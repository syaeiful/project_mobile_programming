import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile_programming/cart_provider.dart';
import 'package:project_mobile_programming/splash_screen.dart';


import 'package:provider/provider.dart';




Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyCPUc3CmdolGHsltmXJmgV4mtJOmC5yqgk',
 appId: '1:13131704266:android:b6fb35fd6142cfc51f9133',
  messagingSenderId: '13131704266',
   projectId: 'e-commerce-50dd0',
   storageBucket: 'gs://e-commerce-50dd0.appspot.com'));
  runApp(ChangeNotifierProvider(create: (context) => CartProvider(),child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}