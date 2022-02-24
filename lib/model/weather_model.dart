
//model for storing the weather parameters from the api
class Weather {
  String? cityName;
  String? state;
  String? description;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather({
    this.cityName = "Bucharest",
    this.state = "Sunny",
    this.temp = 20.0,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure}
      );

  Weather.fromJson(Map<String, dynamic> json){

    cityName = json["name"];
    state=json["weather"][0]["main"];
    description=json["weather"][0]["description"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}
