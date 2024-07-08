import 'package:flutter/material.dart';

class pop_ip extends StatefulWidget {
  final Widget page;
  final Size size;
  final String text;
   pop_ip({super.key,required this.size,required this.text,required this.page});

  @override
  State<pop_ip> createState() => _pop_ipState();
}

class _pop_ipState extends State<pop_ip> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context,constraint)=> Container(
        alignment: Alignment.center,
        width: widget.size.width,
        height: widget.size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text),
              Container(
            width: widget.size.width*0.7,
          height: widget.size.height*0.7,
              decoration: BoxDecoration(
            border: Border.all(color: Colors.black12,width: 2),
            borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child:const Text('insert image url'),
              ), 
              Icon(Icons.arrow_circle_right,size: 35,color: Colors.purple.shade300,),
              
          ],
        ),
      ),
    );
  }
}