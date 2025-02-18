import 'package:flutter/material.dart';
import 'package:pomo/utils/time.dart' show second2MinArray;


const updateRate = 1;



class ClockWidget extends StatefulWidget{
  int timePeriod;


  ClockWidget({
    required this.timePeriod,

    Key? key
  }):super(key: key);
  

  @override
  _ClockState createState() => _ClockState();

}



class _ClockState extends State<ClockWidget>{
  DateTime _startTime  = DateTime.now(); // Reset every time: like a check point after clicking start to count time.
  bool     _paused     = true; // The state of clock: Paused or Working. 
  int      _passedTime = 0;    // Sum of time between clicking start btn until stop btn.
  int      _time       = 0;    // Updated every second by display() func.


  
  @override
  Widget build(BuildContext context) {
    display(); // to insure display() will always be called as long _paused = false.
    return Column(
      mainAxisSize:MainAxisSize.min,
      children: [
        // _time       : Used only for refreshing the clock.
        // _passedTime : Sum of all the periods from start->pause clicks.
        TimeDisplay(timeLeft:widget.timePeriod-_time-_passedTime), 
        GestureDetector(
          onTap: (_paused)?(){start();}:(){pause();}, // choose the right event.
          child: Text((_paused)?"Start":"Pause"),     
        )
      ],
    );
  }
  

  void start(){
    setState(() {
      _startTime = DateTime.now(); // reset start time to begin a new period.
      _paused    = false;          // set clock to the working state.

    });
  }
  

  void pause(){
    setState(() {
      // reset to 0 because: (_passedTime += _time).
      _passedTime += DateTime.now().difference(_startTime).inSeconds;
      _time       = 0;
      _paused     = true;
    });
  }


  void display() async{
    await Future.delayed(Duration(seconds:1)); // refresh every 1 seconds & avoiding fast refreshing rate

    if(!mounted) return; // check if the widget still in the tree.

    // if the clock is paused this will stop and wont triger build() or display() itself.
    if (!_paused){ 
      setState(() {
        _time = DateTime.now().difference(_startTime).inSeconds; // the different between now and start time.
      });
    }
    
  }
}


  



//-------------------------------------------------------------------------------------

class TimeDisplay extends StatelessWidget{
  final int timeLeft;


  TimeDisplay({required this.timeLeft});


  @override
  Widget build(BuildContext context) {
    final inMin = second2MinArray(timeLeft); // 305sec -> [5min, 5sec].
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          inMin[0].toString(),
          style: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ), 
        ),
        Text(
          (inMin[1].toString().length == 2)?":${inMin[1]}":":0${inMin[1]}", // "44" -> "44" | "4" -> "04".
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
