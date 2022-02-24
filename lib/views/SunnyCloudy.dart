

import 'package:flutter/material.dart';

//function for showing the correct weather icon
IconData SunnyCloudy(String state){
   //case when sky is cloudy
    if(state=="Clouds" || state=="Rain" || state=="Mist"){
      return Icons.wb_cloudy_outlined;
      print("Cloudy");
    }
    //case when the sky is clear
    else if(state=="Clear"){
      return Icons.sunny;
      print("Sunny");
    }

    //default case
    else {
      return Icons.sunny;
      print("Sunny");
    }
}