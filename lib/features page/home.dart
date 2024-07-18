import 'dart:math';

import 'package:dy_patil/Login/login.dart';
import 'package:dy_patil/features%20page/landing.dart';
import 'package:dy_patil/features%20page/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/cupertino.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> with TickerProviderStateMixin{
  late AnimationController pop_up;
  
  @override
  void initState() {
   pop_up=AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text('Homepage'),
      ),
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              landing(),
              pop_ip(size: Size(size.width*0.7,size.height*0.3), text: 'Feature pop up', page: LoginPage()).animate(
                         controller: pop_up,).slideY(begin: 200),
            ],
          ),
        ),
      ),
     
    );
  }
}