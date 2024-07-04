import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class spinkit extends StatefulWidget {
  bool status;
  spinkit({super.key,required this.status});

  @override
  State<spinkit> createState() => _spinkitState();
}

class _spinkitState extends State<spinkit> with SingleTickerProviderStateMixin {
    late final spinkit;
late AnimationController _spinkitController;

@override
  void initState() {
      _spinkitController=AnimationController(vsync: this,
   duration: const Duration(seconds: 3),
  );

    spinkit=SpinKitFadingCircle(color: Colors.grey.shade300,
    controller: _spinkitController,
    );

   if(widget.status) {
     _spinkitController.addStatusListener((status) {
       if(status==AnimationStatus.completed)
       {
        _spinkitController.reset();
        _spinkitController.forward();
       }
     });
   }
    super.initState();
  }

@override
  void dispose() {
    _spinkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return spinkit;
  }
}