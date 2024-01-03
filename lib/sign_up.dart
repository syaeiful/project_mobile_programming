import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile_programming/home_screen.dart';
import 'package:project_mobile_programming/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
      child: Scaffold(
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account', 
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  TextFields(
                    label: 'FULL NAME', 
                    icon: const Icon(Icons.person_2_outlined), 
                    controller: _nameController,
                    ),
                  const SizedBox(height: 10),
                  TextFields(
                    label: 'EMAIL', 
                    icon: const Icon(Icons.email_outlined), 
                    controller: _emailController,
                    ),
                  const SizedBox(height: 10),
                  TextFields(
                    label: 'PASSWORD', 
                    secureText: true,
                    icon: const Icon(Icons.lock_outlined), 
                    controller: _passwordController,
                    ),
                  const SizedBox(height: 10),
                  TextFields(
                    label: 'CONFIRM PASSWORD', 
                    secureText: true,
                    icon: const Icon(Icons.lock_outlined), 
                    controller: _confirmPasswordController,
                    ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                                email: _emailController.text, 
                                password: _passwordController.text, )
                              .then((value) => {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    ),
                                  });
                        }, 
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                        child: Row(
                          children: [
                            Text('SING UP'),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward, size: 24.0,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have a account?",
                style: TextStyle(
                  fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'SDUIDisplay',
                      color: Colors.green,
                      fontSize: 15),
                ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;
  
  TextFields(
    {super.key, 
    required this.icon, 
    required this.label, 
    required this.controller,
    this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        style: const TextStyle(
          color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          prefixIcon: icon,
          labelStyle: const TextStyle(fontSize: 12),
        ),  
      ),
    );
  }
}