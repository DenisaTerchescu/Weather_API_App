

import 'package:dio/dio.dart';
import 'package:project/model/weather_model.dart';

  final client = Dio();

 //function to call api
   class WeatherApiClient{
      Future<Weather>? getCurrentWeather(String? location) async{
         try{
         final response = await client.get("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=f7a898121b2a301f2a7179b73a5e4fb3&units=metric");
         var body = response.data;
         return Weather.fromJson(body);
      }
      catch(Exception){
            print(Exception);
            rethrow;
      }

      }

   }




