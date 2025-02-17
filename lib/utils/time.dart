


List<int> second2MinArray(int timeInS){
  return [timeInS~/60, timeInS%60];
}


String second2MinStr(int timeInS){
  final arr = second2MinArray(timeInS);
  final sec = (arr[1].toString().length == 2)?arr[1].toString():"0${arr[1]}";
  return "${arr[0]}:" + sec;
}


