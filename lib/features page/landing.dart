import 'dart:async';
import 'dart:ui';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:dy_patil/features%20page/side_bar.dart';
import 'package:flutter/material.dart';



class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  bool clicked=false;
  bool delay=false;
  SideMenuController sideMenu = SideMenuController();
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

@override
void initState() {
  // Connect SideMenuController and PageController together
  sideMenu.addListener((index) {

  });
  super.initState();
}


 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
        leading: IconButton(icon:Icon(Icons.more_horiz_rounded),onPressed: (){
          setState(() {
            clicked=!clicked;
            Timer(Duration(milliseconds: 500), () {
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
        Column(
          children: [
            Container(
              child: Center(
                child: Text('Dashboard'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Expansion Item 1'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Expansion Item 2'),
              ),
            ),
          ],
        ),
         Positioned(
          left: 0.0,
          child: SideMenu(
            style: SideMenuStyle(
              displayMode: clicked?SideMenuDisplayMode.open:SideMenuDisplayMode.auto,
              openSideMenuWidth: 250,
              compactSideMenuWidth: 75,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedIconColor: Colors.white,
          
              unselectedIconColor: Colors.black54,
              selectedTitleTextStyle: TextStyle(color: Colors.white),
              unselectedTitleTextStyle: TextStyle(color: Colors.black54),
              iconSize: 20,
              itemBorderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              itemHeight: 50.0,
              itemInnerSpacing: 8.0,
              itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              toggleColor: Colors.black54,
              backgroundColor: Colors.white,
              // Additional properties for expandable items
              selectedTitleTextStyleExpandable: TextStyle(color: Colors.black54), // Adjust the style as needed
              unselectedTitleTextStyleExpandable: TextStyle(color: Colors.black54,fontSize: !delay?0:15), // Adjust the style as needed
              selectedIconColorExpandable: Colors.black54, // Adjust the color as needed
              unselectedIconColorExpandable: Colors.black54, // Adjust the color as needed
              arrowCollapse: Colors.blueGrey, // Adjust the color as needed
              arrowOpen: Colors.lightBlueAccent, // Adjust the color as needed
              iconSizeExpandable: 24.0, // Adjust the size as needed
              ),
            // Page controller to manage a PageView
            controller: sideMenu,
            // Will shows on top of all items, it can be a logo or a Title text
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            // List of SideMenuItem to show them on SideMenu
            items: items,
          ),
        ),
      ],
    ),
  );
}
}