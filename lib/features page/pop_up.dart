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
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text),

          
              Transform.translate(
                offset: Offset(widget.size.width*0.12, 0),
                child: FloatingActionButton(onPressed: (){
                
                },
                child: Icon(Icons.arrow_circle_right),
                ),
              ),
       
        ],
      ),
    );
  }
}