import 'package:flutter/material.dart';
import 'package:pomo/timer/clock.dart';
import 'time_period.dart';
import 'package:pomo/varbs.dart' show pomoTime, longBreakTime, shortBreakTime;





class TimerWidget extends StatefulWidget{
  
  final Function bgFunc;

  
  TimerWidget({required this.bgFunc});


  @override 
  _TimeeWidgetState createState() => _TimeeWidgetState();
}

class _TimeeWidgetState extends State<TimerWidget>{
  int _groupValue = 0; // for TimePeriod to know the current selected value (balck background).
  int _time       = pomoTime;


  @override
  Widget build(BuildContext context) {
    final modes      = [
	    TimePeriod(title: "Pomodoro",    time: pomoTime,       value: 0, groupValue: _groupValue, setOption: _setTimePeriod),
	    TimePeriod(title: "Short Break", time: shortBreakTime, value: 1, groupValue: _groupValue, setOption: _setTimePeriod),
      TimePeriod(title: "Long Break",  time: longBreakTime,  value: 2, groupValue: _groupValue, setOption: _setTimePeriod),
	  ];


	  return ClipRRect(
      borderRadius: BorderRadius.circular(10),
	    child:Container(
	      color: Color(0x5CFFFFFF),
	      padding: EdgeInsets.all(13),
	      child: Column(
	        mainAxisSize:MainAxisSize.min,
	        children: [
	          Row(
              spacing: 4,
	            mainAxisSize:MainAxisSize.min,
	            children: modes,
	          ),
            // Use ValueKey to force ClockWidget to reload.
	          ClockWidget(timePeriod: _time, key: ValueKey(_time),)
	        ],
	      ),
	    )
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





