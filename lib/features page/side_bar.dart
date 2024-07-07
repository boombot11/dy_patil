import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class side_bar extends StatefulWidget {
 final Size size;
 bool clicked;
 bool delay;
 List<dynamic> items;
   side_bar({super.key,required this.size,required this.clicked,required this.items,required this.delay});

  @override
  State<side_bar> createState() => _side_barState();
}

class _side_barState extends State<side_bar> with SingleTickerProviderStateMixin{
 SideMenuController sideMenu = SideMenuController();
@override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
              style: SideMenuStyle(
                displayMode: widget.clicked?SideMenuDisplayMode.open:SideMenuDisplayMode.auto,
                openSideMenuWidth: widget.size.width*0.75,
                compactSideMenuWidth: widget.size.width*0.0,
                hoverColor: Colors.blue[100],
                selectedColor: Colors.lightBlue,
                selectedIconColor: Colors.white,
                showTooltip: true,
                unselectedIconColor: Colors.black54,
                selectedTitleTextStyle: TextStyle(color: Colors.white),
                unselectedTitleTextStyle: TextStyle(color: Colors.black54),
                iconSize: (widget.size.width*0.07>33)?33:(widget.size.width*0.07<20)?20:widget.size.width*0.07,
                itemBorderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                itemHeight:widget.size.height*0.08,
                itemInnerSpacing: widget.size.width*0.02,
                itemOuterPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                toggleColor: Colors.black54,
                backgroundColor: Colors.white,
                // Additional properties for expandable items
                selectedTitleTextStyleExpandable: TextStyle(color: Colors.black54), // Adjust the style as needed
                unselectedTitleTextStyleExpandable: TextStyle(color: Colors.black54,fontSize: !widget.delay?0:15), // Adjust the style as needed
                selectedIconColorExpandable: Colors.black54, // Adjust the color as needed
                unselectedIconColorExpandable: Colors.black54, // Adjust the color as needed
                arrowCollapse: Colors.blueGrey, // Adjust the color as needed
                arrowOpen: Colors.lightBlueAccent, // Adjust the color as needed
                iconSizeExpandable: (widget.size.width*0.07<33)?widget.size.width*0.07:33, // Adjust the size as needed
                ),
              // Page controller to manage a PageView
              controller: sideMenu,
              // Will shows on top of all items, it can be a logo or a Title text
              // List of SideMenuItem to show them on SideMenu
              items: widget.items,
            );
  }
}