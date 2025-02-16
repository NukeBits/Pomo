import "package:flutter/material.dart";
import 'package:pomo/timer/init.dart';


const pomoColor       = Color(0xFFBA4949);
const shortBreakColor = Color(0xFF38858A);
const longBreakColor  = Color(0xFF397097);




class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
  
  
}




class _HomePageState extends State<HomePage>{
  Color _currentBg = pomoColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _currentBg,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:[

          Text("top"),
          TimerWidget(bgFunc:_changeBgColor),
          Text("end"),
        ],
      )

    );
  }




  void _changeBgColor(int option){
    Color clr = Color(0xFF000000);
    switch (option) {
      case 0:
        clr = pomoColor;
        break; 
      case 1:
        clr = shortBreakColor;
        break;
      default:
        clr = longBreakColor;
        break;
    }
    setState(() {
      _currentBg = clr;
    });
  }
}
