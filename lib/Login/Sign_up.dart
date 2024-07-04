import 'package:dy_patil/Login/login.dart';
import 'package:dy_patil/Page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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

  void _onSignUpButtonPressed() {
    _animationController?.forward().then((_) {
      _animationController?.reverse();
    });
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
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
                Text('Create your account to get Started',
           style: TextStyle(
           color: Colors.grey.shade400,
           fontSize: 15,
           ),
           ),
             SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
              child:  ElevatedButton(
                  style:const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll<Size>(Size(100, 40)),
                  ),
                onPressed: (){
                  if(!_animationController!.isAnimating)
                  {
                    _animationController!.reset();
                    _animationController!.forward();
                  }
                },
                child:  Text('Login',style: TextStyle(color: Colors.black87),).animate(
                  controller: _animationController,
                ).shimmer(
                  color: Colors.white
                )
              )
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context,NoAnimationPageRoute(page:const LoginPage()));
              },
              child: Text(
                "Already have an account? Login",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}