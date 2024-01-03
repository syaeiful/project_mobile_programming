import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_mobile_programming/forget_password.dart';
import 'package:project_mobile_programming/home_screen.dart';
import 'package:project_mobile_programming/sign_up.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailAdderessController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  handleGoogleSignIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    if(userCredential.user != null){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
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
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 110, 20, 11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Please sign in to continue',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _emailAdderessController,
                style: TextStyle(color: Colors.black,fontFamily: 'SFLUIDisplay'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'EMAIL',
                  prefixIcon: Icon(Icons.email_outlined),
                  labelStyle: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black,fontFamily: 'SFLUIDisplay'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'PASSWORD',
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text('FORGET PASSWORD',
                     style: TextStyle(color:Colors.green),
                    ),
                  ),
                  labelStyle: TextStyle(fontSize: 12),
                ),
              ),
             const SizedBox(height:10),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailAdderessController.text, 
                        password: _passwordController.text)
                        .then((value) =>{
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>HomeScreen()))    
                        } );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('LOGIN'),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, size: 24.0),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: 30,),
              Center(
                child: SizedBox(
                 height: 50,
                  child: ElevatedButton.icon(
                    onPressed: (){
                      handleGoogleSignIn();
                    }, 
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.grey)
                      )
                    ),
                    icon: Image.asset('assets/image/g1.png'),
                    label: Text('Sign in with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0
                    ),
                    ),
                 ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                  fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15 ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
                }, 
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'SFUIDisplay',
                    color: Colors.green,
                    fontSize: 15),
              ))
          ]),
        ),
      ),
    );
  }
}