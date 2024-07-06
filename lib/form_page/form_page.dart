import 'dart:async';

import 'package:dy_patil/Login/login.dart';
import 'package:dy_patil/Page_transition/page_transition.dart';
import 'package:dy_patil/features%20page/landing.dart';
import 'package:dy_patil/util/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class form_page extends StatefulWidget {
  
  @override
  State<form_page> createState() => _form_pageState();
}


class _form_pageState extends State<form_page> with SingleTickerProviderStateMixin {
  bool clicked=false;
  late List<String> questions;
  late List<TextEditingController> controllers;
  
  AnimationController? _animationController;


 void clean_Up() {
    setState(() {
      clicked=false;
    });
  }


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  questions=[
 "aaaaaaaaaaaaa",
 "bbbbbbbbbbbbbbbb",
 "cccccccccccccccccc",
   ];
   controllers=List.generate(questions.length, (index) => TextEditingController());
   _animationController!.forward();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context,SlideUpPageRoute(page:const LoginPage())), 
    icon: const Icon(Icons.skip_previous)),
        backgroundColor: Colors.blue.shade100,
        title: Text('Sign up'),
      ),
      body:clicked?spinkit(status: clicked):SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Question_builder(questions, controllers),
        ),
      ),
    );
  }

  Widget Question_builder(List<String> questions,List<TextEditingController> controllers) {
    List<Column> form = questions.asMap().entries.map((entry) {
  int index = entry.key;
  String question = entry.value;

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(' $question', style: const TextStyle(color: Colors.black, fontSize: 25)),
      TextField(
        controller: controllers[index],
        decoration:const InputDecoration(
          labelText: 'Answer',
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}).toList();
    return Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...form,
        SizedBox(height: 25,),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.2).animate(
                  CurvedAnimation(
                    parent: _animationController!,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: ElevatedButton(
                    style:const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll<Size>(Size(150, 40)),
                    ),
                  onPressed:  (){
                    if(!_animationController!.isAnimating)
                    {
                      _animationController!.reset();
                      _animationController!.forward();
                    }
                    setState(() {
                      clicked=true;
                      Future.delayed(Duration(milliseconds: 1300),(){
                   Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => landing()),
              (Route<dynamic> route) => false, // This ensures that all previous routes are removed
            );
                      }
                     );
                    });
                  },
                  child: const Text('Submit',style: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.w300),).animate(
                     delay: Duration(seconds: 4),
                    onComplete: (controller) =>Timer(const Duration(seconds: 2), () { 
                       controller.reset();
                       controller.forward();
                    }),
                    controller: _animationController,
                  ).shimmer(
                    color: Colors.white
                  )
                ),
              ),
        ),
      ],
    );
  }

}


