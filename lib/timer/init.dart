import 'package:flutter/material.dart';
import 'time_period.dart';

final s = TextStyle(fontSize:15);








class TimerWidget extends StatefulWidget{
  
  final Function bgFunc;

  
  TimerWidget({required this.bgFunc});


  @override 
  _TimeeWidgetState createState() => _TimeeWidgetState();
}

class _TimeeWidgetState extends State<TimerWidget>{
  int _groupValue = 0;


  @override
  Widget build(BuildContext context) {
    final modes      = [
	    TimePeriod(title: "Pomodoro",    time: 25*60, value: 0, groupValue: _groupValue, setOption: _setTimePeriod),
	    TimePeriod(title: "Short Break", time: 5*60,  value: 1, groupValue: _groupValue, setOption: _setTimePeriod),
      TimePeriod(title: "Long Break",  time: 15*60, value: 2, groupValue: _groupValue, setOption: _setTimePeriod),
	  ];


	  return Container(
      color: Color(0x5CFFFFFF),
      padding: EdgeInsets.all(13),
      child: Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          Row(
            children: modes,
          )
        ],
      ),
    );
      
  }
  

  void _setTimePeriod(int value){
    setState(() {
      _groupValue = value;      
      widget.bgFunc(value);
    });
  }
  
}





