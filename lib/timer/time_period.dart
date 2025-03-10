import 'package:flutter/material.dart';




class TimePeriod extends StatelessWidget{
  final String title;
  final int    time;
  final int    value;
  int          groupValue;

  final Function setOption;
  

  TimePeriod({
    required this.title,
    required this.time, 
    required this.value,
    required this.groupValue,
    Key? key,

    required this.setOption,
  }): super(key:key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){setOption(value, time);},
	    child:ClipRRect(
        borderRadius: BorderRadius.circular(7),
	      child: ColoredBox(
		      color: (value == groupValue)?Color(0x5F000000):Color(0x00000000), // black: opacity 40% || 0% .
		      child: Padding(
		        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
		        child  : Text(title),
		      ),
		    )
      )
    );
  }
    
}
