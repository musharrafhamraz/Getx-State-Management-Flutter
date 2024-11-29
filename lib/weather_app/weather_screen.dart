import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/weather_app/controller.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    final TextEditingController lonController = TextEditingController();
    final TextEditingController latController = TextEditingController();

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
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: const InputDecoration(
                            label: Text('Longitude'),
                            prefixIcon: Icon(Icons.directions_boat_rounded),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)))),
                        controller: lonController,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: const InputDecoration(
                            label: Text('latitude'),
                            prefixIcon: Icon(Icons.directions_bike),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)))),
                        controller: latController,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          if (lonController.text.isEmpty &&
                              latController.text.isEmpty) {
                            Get.snackbar(
                                'Warning!', 'Fill the required fields');
                          } else {
                            weatherController.fetchWeatherFromCity(
                                double.parse(lonController.text),
                                double.parse(latController.text));
                          }
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
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
            ),
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
