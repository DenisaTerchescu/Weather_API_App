
import 'package:flutter/material.dart';

Widget weatherLayout(IconData icon, String temp, String location, String state){
    return Container(
      color:Colors.white.withOpacity(0.45),


      child: Column(
        children: [
          Row(
            children: [
              Icon(
               icon,
               color: Colors.white,
                size:35.0,
              ),
              SizedBox(
                width: 15.0),

              Text(
                "$temp",
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
              SizedBox(
                  width: 90.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 50.0),
                  Text(
                    "$location",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

            ],
          ),


          SizedBox(
              width: 90.0),
          Row(
            children: [
              SizedBox(
                  width: 255.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 90.0),

                  Text(
                    "$state",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
              height: 5.0),





        ],

      ),
    );
  }