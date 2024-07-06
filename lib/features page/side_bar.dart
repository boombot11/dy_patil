import 'package:flutter/material.dart';

class side_bar extends StatefulWidget {
  final double start;
  final double end;
  final double height;
  final bool state;
  const side_bar({super.key,required this.end, required this.start,required this.height,required this.state});

  @override
  State<side_bar> createState() => _side_barState();
}

class _side_barState extends State<side_bar> with SingleTickerProviderStateMixin{
  late Animation<double> pop=CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  late AnimationController _controller;
@override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    pop=Tween(begin: widget.start,end: widget.end).animate(_controller);
    if(widget.state&&_controller.value<widget.end*0.3)
    _controller.forward();
    if(!widget.state&&_controller.value>widget.end*0.9)
    {
      _controller.reverse();
    }
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.state?AnimatedBuilder(animation: pop, builder: (context,child){
      return Container(
           decoration: BoxDecoration(
             boxShadow: [
              if(pop.value>widget.end*0.7)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 135,
                blurRadius: 55,
                offset: Offset(-45, 0), // Changes position of shadow
              ),
            ],
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.black,
                )
              ),
                  color:Colors.blue.shade600,
            ),
        height:widget.height ,
        width: pop.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 40),
           if(pop.value>80.0)
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:15.0),
             child: Container(
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              alignment: Alignment.center,
              width: pop.value,
              child: const Padding(
                padding:EdgeInsets.symmetric(vertical:5.0),
                child: Text('Feature',style: TextStyle(color: Colors.black,fontSize: 19),),
              ),
             ),
           ),
                   const SizedBox(height: 10),
             if(pop.value>80.0)
           Padding(
               padding: const EdgeInsets.symmetric(horizontal:15.0),
             child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              alignment: Alignment.center,
              width: pop.value,
              child:const Padding(
                padding:EdgeInsets.symmetric(vertical:5.0),
                child: Text('Feature',style: TextStyle(color: Colors.white,fontSize: 19),),
              ),
             ),
           ),
              const SizedBox(height: 10),
           if(pop.value>80.0)
           Padding(
               padding: const EdgeInsets.symmetric(horizontal:15.0),
             child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              alignment: Alignment.center,
              width: pop.value,
              child: const Padding(
                padding:EdgeInsets.symmetric(vertical:5.0),
                child: Text('Feature',style: TextStyle(color: Colors.white,fontSize: 19),),
              ),
             ),
           )
           
           
          ],
        ),
      );
    },
    child: IconButton(onPressed: (){

    },icon: Icon(Icons.more_horiz),),
    ):Container();
  }
}