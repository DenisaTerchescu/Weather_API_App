import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/model/weather_model.dart';
import 'package:project/services/weather_api_client.dart';
import 'package:project/views/SunnyCloudy.dart';
import 'package:project/views/additional_informartion.dart';
import 'package:project/views/current_weather.dart';
import 'package:dio/dio.dart';

String City ="Bucharest";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final GlobalKey<RefreshIndicatorState> _refreshIndicator =
  new GlobalKey<RefreshIndicatorState>();

  WeatherApiClient client=WeatherApiClient();
  var _controller = TextEditingController();

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');

   Weather? data, data1, data2;


  Future<void> getData() async{

     data = await client.getCurrentWeather(City);
     data1 = await client.getCurrentWeather("Madrid");
     data2 = await client.getCurrentWeather("New York");
}
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return RefreshIndicator(
      key: _refreshIndicator,
      onRefresh: refreshData,
      child: Scaffold(
          extendBodyBehindAppBar: true,

        appBar: AppBar(

          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0.0,

          title: Column(
            children: [

              Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(30),

                ),

                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        City = value;
                        print(City);
                      }
                      );
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Search"
                    ),
                  ),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu_rounded, size:25),
            color: Colors.white,
          ),

          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search))
          ],

        ),

        body: Scaffold(
          backgroundColor: Colors.purple.shade300,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            reverse: true,
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Stack(

                      children: <Widget> [
                        Image.asset(
                            './assets/city.jpg',
                            fit:BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          color: Colors.white.withOpacity(0.75),
                          colorBlendMode: BlendMode.overlay,
                        ),
                        Container(
                          decoration: BoxDecoration(color:Colors.black12),
                        ),
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //first city

                          Column(
                            children: [
                              SizedBox(height:120.0),

                              weatherLayout(SunnyCloudy("${data!.state}"), "${data!.temp}°C", "${data!.cityName}","${data!.description}"),
                              SizedBox(
                                height: 60.0,
                              ),

                              Text("More info",
                                style: TextStyle(
                                    fontSize:24.0,
                                    color: Color(0xdd212121),
                                    fontWeight: FontWeight.bold,
                                ),

                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white54
                                    )
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 5.0),

                              //more info

                              AdditionalInformation(
                                  "${data!.wind}", "${data!.humidity}",
                                  "${data!.pressure}", "${data!.feels_like}°C"),
                      //second city
                              SizedBox(height:100.0),

                              weatherLayout(SunnyCloudy("${data1!.state}"), "${data1!.temp}°C", "${data1!.cityName}","${data1!.description}"),
                              SizedBox(
                                height: 60.0,
                              ),

                              Text("More info",
                                style: TextStyle(
                                  fontSize:24.0,
                                  color: Color(0xdd212121),
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white24
                                    )
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 5.0),

                              //more info

                              AdditionalInformation(
                                  "${data1!.wind}", "${data1!.humidity}",
                                  "${data1!.pressure}", "${data1!.feels_like}°C"),

                              //third city
                              SizedBox(height:120.0),

                              weatherLayout(SunnyCloudy("${data2!.state}"), "${data2!.temp}°C", "${data2!.cityName}","${data2!.description}"),
                              SizedBox(
                                height: 60.0,
                              ),

                              Text("More info",
                                style: TextStyle(
                                  fontSize:24.0,
                                  color: Color(0xdd212121),
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white24
                                    )
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 20.0),

                              //more info

                              AdditionalInformation(
                                  "${data2!.wind}", "${data2!.humidity}",
                                  "${data2!.pressure}", "${data2!.feels_like}°C"),
                            ],
                          )





                        ],
                      ),

                      ]
                    );
                  }
                  else if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return Container();
                },
              ),
            ),
          ),
        )
      ),
    );
  }
  Future<void> refreshData() async {
    try {
      final client = Dio();
      final response = await client.get(
          "https://api.openweathermap.org/data/2.5/weather?q=${data!
              .cityName}&appid=f7a898121b2a301f2a7179b73a5e4fb3&units=metric");
      var body = response.data;
      setState(()  {});
    }
    catch (Exception) {
      print(Exception);
      rethrow;
    }
  }

}





