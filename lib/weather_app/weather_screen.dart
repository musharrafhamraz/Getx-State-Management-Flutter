import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/weather_app/controller.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather.'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade400,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Obx(() {
          if (weatherController.isLoading.value) {
            return SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.3,
                child: const CircularProgressIndicator());
          }
          final data = weatherController.weatherData.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Temperature',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
              ),
              Text(
                '${data.temperature.toString()} `C',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text('Humidity: '),
                  Text(data.humidity.toString())
                ],
              )
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            weatherController.refreshWeather(33.6844, 73.0479);
          },
          label: const Text('Refresh')),
    );
  }
}
