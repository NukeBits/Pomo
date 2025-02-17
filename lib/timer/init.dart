import 'package:flutter/material.dart';
import 'time_period.dart';
import 'package:pomo/utils/time.dart' show second2MinStr;
import 'package:pomo/varbs.dart' show pomoTime, longBreakTime, shortBreakTime;

final s = TextStyle(fontSize:15);








class TimerWidget extends StatefulWidget{
  
  final Function bgFunc;

  
  TimerWidget({required this.bgFunc});


  @override 
  _TimeeWidgetState createState() => _TimeeWidgetState();
}

class _TimeeWidgetState extends State<TimerWidget>{
  int _groupValue = 0;
  int _time       = pomoTime;


  @override
  Widget build(BuildContext context) {
    final modes      = [
	    TimePeriod(title: "Pomodoro",    time: pomoTime, value: 0, groupValue: _groupValue, setOption: _setTimePeriod),
	    TimePeriod(title: "Short Break", time: shortBreakTime,  value: 1, groupValue: _groupValue, setOption: _setTimePeriod),
      TimePeriod(title: "Long Break",  time: longBreakTime, value: 2, groupValue: _groupValue, setOption: _setTimePeriod),
	  ];


	  return Container(
      color: Color(0x5CFFFFFF),
      padding: EdgeInsets.all(13),
      child: Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          Row(
            children: modes,
          ),
          Text(second2MinStr(_time))
        ],
      ),
    );
      
  }
  

  void _setTimePeriod(int value, int time){
    setState(() {
      _groupValue = value;
      _time       = time; 
      widget.bgFunc(value);

    });
  }
  
}





