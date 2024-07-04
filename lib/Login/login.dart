import 'package:dy_patil/Login/Sign_up.dart';
import 'package:dy_patil/Page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           const SizedBox(height: 20),
           Text('Enter your credentials to access your account',
           style: TextStyle(
           color: Colors.grey.shade400,
           fontSize: 15,
           ),
           ),
           const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration:const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ScaleTransition(
              scale: Tween(begin: 1.0, end: 1.2).animate(
                CurvedAnimation(
                  parent: _animationController!,
                  curve: Curves.easeInOut,
                ),
              ),
              child: ElevatedButton(
                  style:const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll<Size>(Size(100, 40)),
                  ),
                onPressed:  (){
                  if(!_animationController!.isAnimating)
                  {
                    _animationController!.reset();
                    _animationController!.forward();
                  }
                 
                Navigator.push(
                  context,SlideUpPageRoute(page: SignUpPage()));
              
                },
                child:  Text('Login',style: TextStyle(color: Colors.black87),).animate(
                  controller: _animationController,
                ).shimmer(
                  color: Colors.white
                )
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,SlideUpPageRoute(page: SignUpPage()));
              },
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}