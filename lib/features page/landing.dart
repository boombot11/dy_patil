import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:dy_patil/Login/login.dart';
import 'package:dy_patil/features%20page/pop_up.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:dy_patil/features%20page/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

List<dynamic> items = [
const SideMenuItem(
  title: 'Dashbord',
  icon: const Icon(Icons.dashboard),
  badgeColor: Colors.white
),
  SideMenuExpansionItem(
    title: "Expansion Item",
    icon: const Icon(Icons.kitchen),
    children: [
      SideMenuItem(
        title: 'Expansion Item 1',
        onTap: (index, _) {
        },
        icon: const Icon(Icons.home),
      ),
      SideMenuItem(
        title: 'Expansion Item 2',
        onTap: (index, _) {
        },
        icon: const Icon(Icons.supervisor_account),
      ),
       SideMenuItem(
    title: 'Exit',
    onTap: (index,_) {

    },
    icon: Icon(Icons.exit_to_app),
  ),
    ],
  ),

];

class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> with TickerProviderStateMixin{
  bool clicked=false;
  bool feature_click=false;
  bool delay=false;
  bool a1=true;
  bool a2=false;
   bool a3=false;
    bool a4=false;
   bool opacity_bool=false;
  SideMenuController sideMenu = SideMenuController();
 late Animation<double> off_animation;
late AnimationController off_controller;
late AnimationController no1;
late AnimationController no2;
late AnimationController no3;
late AnimationController no4;
late AnimationController pop_up;

  late Timer _timer;
  int _randomNumber = 0;
  final Random _random = Random();

  

void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      _generateRandomNumber();
    });
  }

  void _generateRandomNumber() {
  
      setState(() {
        final a=_random.nextInt(4);
      if(_randomNumber==0)a1=false;
      if(_randomNumber==1)a2=false;
      if(_randomNumber==2)a3=false;
      if(_randomNumber==3)a4=false;
      if(a==0&&_randomNumber!=a){a1=true;_randomNumber=0;no1.reset(); no1.forward();}
      if(a==1&&_randomNumber!=a){a2=true;_randomNumber=1;no2.reset(); no2.forward();}
      if(a==2&&_randomNumber!=a){a3=true;_randomNumber=2;no3.reset(); no3.forward();}
      if(a==3&&_randomNumber!=a){a4=true;_randomNumber=3;no4.reset(); no4.forward();}
      });
       // Generates a number between 0 and 3
  
  }


@override
void initState() {
  off_controller=AnimationController(vsync: this,duration: const Duration(seconds: 2));
  no1=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    no2=AnimationController(vsync: this,duration: const Duration(seconds: 1));
      no3=AnimationController(vsync: this,duration: const Duration(seconds: 1));
        no4=AnimationController(vsync: this,duration: const Duration(seconds: 1));
        pop_up=AnimationController(vsync: this,duration: const Duration(seconds: 2));
  // Connect SideMenuController and PageController together
  off_animation=CurvedAnimation(curve: Curves.easeIn,parent:off_controller );
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    off_controller.forward();
     _startTimer();
     no1.forward();
  });
 off_controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        off_controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
       off_controller.forward();
      }
    });

no1.addStatusListener((status) {if(status==AnimationStatus.completed)no1.reverse();});
no2.addStatusListener((status) {if(status==AnimationStatus.completed)no2.reverse();});
no3.addStatusListener((status) {if(status==AnimationStatus.completed)no3.reverse();});
no4.addStatusListener((status) {if(status==AnimationStatus.completed)no4.reverse();});
  super.initState();
}


 @override
Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
        leading: IconButton(icon:Icon(Icons.more_horiz_rounded),onPressed: (){
          setState(() {
            clicked=!clicked;
            Timer(const Duration(milliseconds: 400),(){
              setState(() {
                opacity_bool=!opacity_bool;
              });
            });
            Timer(Duration(milliseconds: 200), () {
              setState(() {
                delay=!delay;
              });
             });
          });
        }),
        backgroundColor: Colors.blue.shade100,
        title: Text('Features'),
      ),
    body: Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
             SizedBox(height: size.height*0.05,),
            Opacity(
              opacity: feature_click?0.2:1,
              child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     GestureDetector(
                      onTap: (){
                        setState(() {
                          feature_click=!feature_click;
                          print('xxxxxxxxx  '+feature_click.toString());
                          if(pop_up.isCompleted)
                          pop_up.reverse();
                          pop_up.reset();
                          pop_up.forward();
                        });
                      },
                       child: AnimatedBuilder(animation: no1, builder: (context,widget){
                        return Transform.translate(offset: Offset(no1.value*6, no1.value*3),
                        child: Container(
                          height: size.height*0.3,
                          width: size.width*0.36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueGrey.shade400,
                              width: 1.3
                            ),
                            borderRadius:const  BorderRadius.all(
                            Radius.circular(25),
                            )
                          ),
                          alignment: Alignment.center,
                                       child: Text('Expansion Item 1'),
                                     ),
                        );
                       }).animate(
                        controller: no1,
                       ).shimmer(color: Colors.white,curve: Curves.easeIn),
                     )
                     ,
                 AnimatedBuilder(animation: no2, builder: (context,widget){
                      return Transform.translate(offset: Offset(no2.value*-4, a2?no2.value*-1:0),
                      child: Container(
                        height: size.height*0.3,
                        width: size.width*0.36,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey.shade400,
                            width: 1.3
                          ),
                         borderRadius:const  BorderRadius.all(
                          Radius.circular(25),
                          )
                        ),
                        alignment: Alignment.center,
                  child: Text('Expansion Item 2'),
                ),
                      );
                     }).animate(
                      controller: no2,
                     ).shimmer(color: Colors.white,curve: Curves.easeIn),
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     AnimatedBuilder(animation: off_animation, builder: (context,widget){
                      return Transform.translate(offset: Offset(no3.value*-2, no3.value*3),
                      child: Container(
                        height: size.height*0.3,
                        width: size.width*0.36,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey.shade400,
                            width: 1.3
                          ),
                         borderRadius:const  BorderRadius.all(
                          Radius.circular(25),
                          )
                        ),
                        alignment: Alignment.center,
                  child: Text('Expansion Item 3'),
                ),
                      );
                     }).animate(
                      controller: no3,
                     ).shimmer(color: Colors.white,curve: Curves.easeIn),
                 AnimatedBuilder(animation: no4, builder: (context,widget){
                      return Transform.translate(offset: Offset(no4.value*3, no4.value*7),
                      child: Container(
                        height: size.height*0.3,
                        width: size.width*0.36,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey.shade400,
                            width: 1.3
                          ),
                         borderRadius:const  BorderRadius.all(
                          Radius.circular(25),
                          )
                        ),
                        alignment: Alignment.center,
                  child: Text('Expansion Item 4'),
                ),
                      );
                     }).animate(
                      controller: no4,
                     ).shimmer(color: Colors.white,curve: Curves.easeIn),
                  ],
                ),
                ],
              ),
            ),
              pop_ip(size: Size(size.width*0.7,size.height*0.13), text: 'Feature pop up', page: LoginPage()).animate(
                       controller: pop_up,).moveY(curve: Curves.easeIn, begin: feature_click?300:-200,end: feature_click?-200:300).fadeIn(
                        duration: const Duration(milliseconds: 100),
                       )
            ],
          ),
        ),
      
    Positioned(
          left: 0.0,
          child: AnimatedOpacity(
            duration:const Duration(milliseconds: 250),
            opacity: opacity_bool?1:0,
            child: delay?SideMenu(
              style: SideMenuStyle(
                displayMode: clicked?SideMenuDisplayMode.open:SideMenuDisplayMode.auto,
                openSideMenuWidth: size.width*0.75,
                compactSideMenuWidth: size.width*0.0,
                hoverColor: Colors.blue[100],
                selectedColor: Colors.lightBlue,
                selectedIconColor: Colors.white,
            
                unselectedIconColor: Colors.black54,
                selectedTitleTextStyle: TextStyle(color: Colors.white),
                unselectedTitleTextStyle: TextStyle(color: Colors.black54),
                iconSize: size.width*0.07,
                itemBorderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                itemHeight: size.height*0.07,
                itemInnerSpacing: size.width*0.02,
                itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                toggleColor: Colors.black54,
                backgroundColor: Colors.white,
                // Additional properties for expandable items
                selectedTitleTextStyleExpandable: TextStyle(color: Colors.black54), // Adjust the style as needed
                unselectedTitleTextStyleExpandable: TextStyle(color: Colors.black54,fontSize: !delay?0:15), // Adjust the style as needed
                selectedIconColorExpandable: Colors.black54, // Adjust the color as needed
                unselectedIconColorExpandable: Colors.black54, // Adjust the color as needed
                arrowCollapse: Colors.blueGrey, // Adjust the color as needed
                arrowOpen: Colors.lightBlueAccent, // Adjust the color as needed
                iconSizeExpandable: size.width*0.08, // Adjust the size as needed
                ),
              // Page controller to manage a PageView
              controller: sideMenu,
              // Will shows on top of all items, it can be a logo or a Title text
              // List of SideMenuItem to show them on SideMenu
              items: items,
            ):Container(),
          ),
        ),
  
         
      ],
    ),
  );
}
}