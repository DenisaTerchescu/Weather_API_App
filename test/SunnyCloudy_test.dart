

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:project/views/SunnyCloudy.dart';

  main()
  {
   test("SunnyCloudy should return cloudy", (){
     IconData cloudy= Icons.wb_cloudy_outlined;
     expect(SunnyCloudy("Clouds"), cloudy);

   });

  }